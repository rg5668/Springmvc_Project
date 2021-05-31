package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import calculation.DiffofDate;
import model.Board;
import model.Guest_Date;
import model.Hotel4s_Join_Hotel_Sub4s;
import model.Hotel_Res;
import model.Hotel_Sub4s;
import model.Member;
import model.Member_Card;
import model.Member_Coupon;
import model.Payment;
import model.Reservation;
import service.HotelDaoMybatis;
import service.MemberDaoMybatis;

@Controller
@RequestMapping("/hotel/")
public class HotelController {
	@Autowired
	HotelDaoMybatis dao;
	@Autowired
	MemberDaoMybatis mdao;

	@RequestMapping("hotelForm")
	private String hotelForm(Model m, String search_option, Hotel4s_Join_Hotel_Sub4s hj, Guest_Date gd) {

		List<Hotel4s_Join_Hotel_Sub4s> hotel = null;
		// 정렬하는 방식을 구하는 메소드
		if (search_option == null || search_option.equals("")) {
			search_option = "L_price";
		}
		if (search_option.equals("L_price")) {
			hotel = dao.hotelsearch(gd.getGuest(), hj.getArea_code(), 5, hj.getHotel_option1(), hj.getHotel_option2(),
					null);
		} else if (search_option.equals("H_price")) {
			hotel = dao.hotelsearch(gd.getGuest(), hj.getArea_code(), 5, hj.getHotel_option1(), hj.getHotel_option2(),
					"desc");
		} else if (search_option.equals("L_grade")) {
			hotel = dao.hotelsearch(gd.getGuest(), hj.getArea_code(), 7, hj.getHotel_option1(), hj.getHotel_option2(),
					null);
		} else {
			hotel = dao.hotelsearch(gd.getGuest(), hj.getArea_code(), 7, hj.getHotel_option1(), hj.getHotel_option2(),
					"desc");
		}

		m.addAttribute("hotel", hotel);
		m.addAttribute("area_code", hj.getArea_code());
		m.addAttribute("gd", gd);
		m.addAttribute("search_option", search_option);
		String h1 = "";
		String h2 = "";

		// 옵션을 검색하는 메소드 
		if (hj.getHotel_option1() != null)
			for (String s : hj.getHotel_option1()) {
				h1 = h1 + s + "/";
				System.out.println(h1);
			}
		if (hj.getHotel_option2() != null)
			for (String s : hj.getHotel_option2()) {
				h1 = h1 + s + "/";
			}

		m.addAttribute("hotel_option1", h1);
		m.addAttribute("hotel_option2", h2);

		return "hotel/hotelForm";
	}

	@RequestMapping("hotelSubForm")
	private String hotelSubForm(Model m, Hotel4s_Join_Hotel_Sub4s hj, Guest_Date gd) throws Exception {

		Hotel4s_Join_Hotel_Sub4s hotelgrade = dao.hotelgrade(hj.getHotel_code());
		List<Hotel_Sub4s> hotelsublist = dao.hotelsublist(gd, hj.getHotel_code());
		List<Board> boardview = dao.boardview(hj.getHotel_code());
		if (gd.getEdate() != null&&gd.getSdate() != null&&gd.getGuest() != 0) {
			List<Hotel_Res> hotelres = dao.hotelrescheck(gd, hj.getHotel_code());
			m.addAttribute("hotelres", hotelres);
			
			int i = 0;
			for (Hotel_Res r : hotelres)
			{
				for (Hotel_Sub4s s : hotelsublist) {
					if (r.getRoom_code().equals(s.getRoom_code())) {

						hotelsublist.remove(i);
						i = 0; 
						break;
					}
					i++;
				}
			}
		}

		
		m.addAttribute("hotelsublist", hotelsublist);
		m.addAttribute("boardview", boardview);
		m.addAttribute("hotelgrade", hotelgrade);
		m.addAttribute("gd", gd);

		DiffofDate diff = new DiffofDate();
		if (gd.getSdate() != null && !gd.getSdate().equals("")) {
			if (gd.getEdate() != null && !gd.getEdate().equals("")) {
				long diffDays = diff.diffOfDate(gd.getSdate(), gd.getEdate());
				m.addAttribute("diffDays", diffDays);
			}
		}
		return "hotel/hotelSubForm";
	}

	@RequestMapping("paymentForm")
	private String paymentForm(HttpSession session, Model m, Hotel4s_Join_Hotel_Sub4s hj, Reservation res,
			Guest_Date gd) throws Exception {
		if (session.getAttribute("login") != null) {// 세션체크 로그인시 처리
			String id = (String) session.getAttribute("login");
			Member mem = mdao.selectOne(id);
			res.setUser_id(id);
			List<Member_Card> memcard = mdao.selectcard(id);
			List<Member_Coupon> memcoupon = mdao.selectcoupon(id);
			m.addAttribute("name", mem.getName());
			m.addAttribute("tel", mem.getTel());
			m.addAttribute("memcard", memcard);
			m.addAttribute("memcoupon", memcoupon);
		} else {// 비 로그인시 처리
			m.addAttribute("name", res.getName());
			m.addAttribute("tel", res.getTel());
		}
		Hotel4s_Join_Hotel_Sub4s hotel = dao.roomone(hj.getRoom_code());
		m.addAttribute("res", res);
		m.addAttribute("gd", gd);
		m.addAttribute("hotel", hotel);
		DiffofDate diff = new DiffofDate();
		if (gd.getSdate() != null && !gd.getSdate().equals("")) {
			if (gd.getEdate() != null && !gd.getEdate().equals("")) {
				long diffDays = diff.diffOfDate(gd.getSdate(), gd.getEdate());
				m.addAttribute("diffDays", diffDays);
			}
		}
		return "hotel/paymentForm";
	}

	@RequestMapping("reservation")
	private String reservation(HttpSession session, Model m, Reservation res, Hotel4s_Join_Hotel_Sub4s hj,
			Guest_Date gd) throws Exception {
		if (session.getAttribute("login") != null) {// 로그인시
			String id = (String) session.getAttribute("login");
			res.setUser_id(id);
		}

		boolean result = dao.resinsert(res);
		if (result) {// 예약 insert성공값 전송
			res = dao.selectres(res);
			session.setAttribute("rescheck", res.getRes_seq());
		}
		m.addAttribute("hj", hj);
		m.addAttribute("res", res);
		m.addAttribute("gd", gd);
		DiffofDate diff = new DiffofDate();
		if (gd.getSdate() != null && !gd.getSdate().equals("")) {
			if (gd.getEdate() != null && !gd.getEdate().equals("")) {
				long diffDays = diff.diffOfDate(gd.getSdate(), gd.getEdate());
				m.addAttribute("diffDays", diffDays);
			}
		}
		return "fps/confirm";
	}

	@RequestMapping("payment")
	private String payment(HttpSession session, Model m, Reservation res, Member_Card card, String price,
			String search_coupon) {
		if (search_coupon == null || search_coupon.equals("no")) {
		} else// 지금 사용한 쿠폰 정보
		{
			String[] couponcomma = search_coupon.split(",");
			search_coupon = couponcomma[2];
			dao.cpnupdate(search_coupon);
		}

		if (!ObjectUtils.isEmpty(session.getAttribute("rescheck"))) {// 세션체크
			int pay_price = Integer.parseInt(price.replaceAll("[^0-9]", ""));// 가격에 문자 제거
			Payment pay = dao.selectresone(res);
			pay.setCard_num(card.getCard_num());
			pay.setPay_price(pay_price);
			boolean result = dao.payinsert(pay);
			if (result) {// 결제정보insert 성공시
				dao.resupdate(res.getRes_seq());// 예약상태 결제로
			}
			session.removeAttribute("rescheck");// 결제 세션 제거
			m.addAttribute("res", res);
		} else {// 새로고침시 재결제 상황 제거
			String msg = "잘못된 경로입니다";
			String url = "mainForm";
			m.addAttribute("msg", msg);
			m.addAttribute("url", url);
			session.removeAttribute("rescheck");
			return "fps/alert";
		}
		return "hotel/paymentendForm";
	}

}
