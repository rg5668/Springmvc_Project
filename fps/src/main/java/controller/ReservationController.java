package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.Member;
import model.Reservation;
import model.hotel4s_hotel_sub4s_reservation4s_join;
import service.ReservationDaoMybatis;

@Controller
@RequestMapping("/reservation/")
public class ReservationController {

	@Autowired
	ReservationDaoMybatis dao;

	@RequestMapping("mypageForm")
	public String mypageForm(Model m, String user_id, HttpSession login) {

		Member mem = dao.selectmember(login.getAttribute("login").toString());
		m.addAttribute("mem", mem);

		return "reservation/mypageForm";
	}

	@RequestMapping("deleteForm")
	public String deleteForm(Model m, String user_id, HttpSession login) {

		login.setAttribute("login", user_id);
		Member mem = dao.selectmember(user_id);
		m.addAttribute("mem", mem);
		return "reservation/deleteForm";
	}

	@RequestMapping("delete")
	public String delete(HttpSession session, Model m, Member mem) throws Throwable {

		/*
		 * 1. 로그아웃상태 : 로그인 하세요. 메세지 출력 후 loginForm.jsp 페이지 이동 2. 로그인 상태 - 일반사용자 (1) 비밀번호
		 * 검증 (2) -비밀번호가 일치하면 db에서 id 해당하는 정보 삭제성공. 로그아웃 후, '탈퇴 성공' 메시지 출력,
		 * loginForm.jsp 페이지 이동 db에서 id 해당하는 정보 삭제실패. "삭제 실패" 메세지 출력. main.jsp 페이지 이동
		 * -비밀번호 불일치 "비밀번호 불일치" 메세지 출력. deleteForm.jsp 페이지 이동 - 관리자 (1) db에서 해당 id 정보 삭제
		 * db에서 id 해당하는 정보 삭제실패. "삭제 실패" 메세지 출력. list.jsp 페이지 이동 (2) 탈퇴 성공 메서지 출력.
		 * list.jsp 페이지 이동
		 */

		String login = session.getAttribute("login").toString();
		Member memdb = dao.selectmember(login);
		String msg = null;
		String url = null;
		if (login == null || login.trim().equals("")) {
			msg = "로그인이 필요합니다.";
			url = "loginForm";
		} else if (!login.equals(memdb.getUser_id()) && !login.equals("admin")) {
			msg = "본인만 탈퇴가 가능합니다.";
			url = "mainForm";
		} else if (memdb.getUser_id().equals("admin")) {
			msg = "관리자는 탈퇴할 수 없습니다.";
			url = "mainForm";
		} else {
			if (login.equals("admin") || mem.getPassword().equals(memdb.getPassword())) {
				boolean result = dao.memberdelete(login);
				if (result) { // 삭제 성공
					if (login.equals("admin")) { // 관리자인 경우
						msg = login + " 사용자를 강제 탈퇴 성공";
						url = "memberList";
					} else { // 일반사용자인 경우
						msg = login + "님의  회원 탈퇴가 완료되었습니다.";
						url = "loginForm";
						session.removeAttribute("login");
					}
				} else { // 삭제 실패
					msg = login + "님의 탈퇴시 오류 발생.";
					if (login.equals("admin")) { // 관리자인 경우
						url = "memberList";
					} else { // 일반사용자인 경우
						url = "mainForm";
					}
				}
			} else {
				msg = mem.getUser_id() + "님의 비빌번호가 틀립니다.";
				url = "deleteForm?id=" + mem.getUser_id();
			}
		}
		m.addAttribute("url", url);
		m.addAttribute("msg", msg);
		return "fps/alert";
	}

	@RequestMapping("updateForm")
	public String updateForm(Model m,  HttpSession login) {
		
		Member mem = dao.selectmember(login.getAttribute("login").toString());
		m.addAttribute("mem", mem);
		return "reservation/updateForm";

	}

	@RequestMapping("update")
	public String update(Model m, HttpSession login, String user_id, Member mem) throws Throwable {

		String msg = "";
		String url = "";

		Member dbMem = dao.selectmember(login.getAttribute("login").toString());
		boolean result;

		if (!login.equals("admin") && !mem.getPassword().equals(dbMem.getPassword())) {
			msg = "비밀번호가 틀립니다. 확인 후 다시 거래 하세요.";
			url = "updateForm?id=" + mem.getUser_id();
		} else {
			result = dao.updatemember(mem);
			if (result) {
				login.setAttribute("login", user_id);
				msg = mem.getUser_id() + "님의 회원 정보가 수정되었습니다.";
				url = "reservation/mypageForm";
			} else {
				msg = mem.getUser_id() + "님 회원 정보 수정 실패.";
				url = "updateForm?id=" + mem.getUser_id();
			}
		}

		m.addAttribute("url", url);
		m.addAttribute("msg", msg);
		return "fps/alert";
	}

	@RequestMapping("reservationConfirmForm")
	public String reservationConfirmForm(Model m, HttpSession login) {

		
		List<hotel4s_hotel_sub4s_reservation4s_join> res = dao.selectreservation4s(login.getAttribute("login").toString());

		m.addAttribute("res", res);

		return "reservation/reservationConfirmForm";
	}

	@RequestMapping("reservationForm")
	private String reservationForm(Model m,  Reservation reser, HttpSession login) {

		
		login.setAttribute("seq", reser.getRes_seq());
		hotel4s_hotel_sub4s_reservation4s_join resname = dao.selectreservation4s2(login.getAttribute("login").toString(), reser.getRes_seq());

		m.addAttribute("res", resname);

		return "reservation/reservationForm";
	}
	
	@RequestMapping("cancelForm")
	private String cancleForm(Model m,  int res_seq, HttpSession login) {
		
		hotel4s_hotel_sub4s_reservation4s_join resname = dao.selectreservation4s2(login.getAttribute("login").toString(), res_seq);

		m.addAttribute("res", resname);
		
		return "reservation/cancelForm";
	}
	
	@RequestMapping("cancel")
	public String cancle(Model m,  String user_id,  int res_seq) throws Throwable {

		String msg = "";
		String url = "";

		/*Member dbMem = dao.selectmember(login.getAttribute("login").toString());
		
		System.out.println("test01");

		
		System.out.println("mem.getPassword() : "+mem.getPassword());
		System.out.println("dbMem.getPassword() : "+dbMem.getPassword());
		System.out.println("dbMem.getUser_id() : "+dbMem.getUser_id());
		System.out.println("res_seq : "+res_seq);
		
		if (!login.equals("admin") && !mem.getPassword().equals(dbMem.getPassword())) {
			msg = "비밀번호가 틀립니다. 확인 후 다시 취소 요청하세요.";
			url = "reservationForm?id=" + mem.getUser_id();
		} else {*/
		
		boolean result;
			result = dao.updatereservation(res_seq);

			if (result) {
			
				msg = user_id + "님의 회원 예약 상태가 수정되었습니다.";
				url = "reservation/reservationConfirmForm?id=" + user_id;
			} else {
				msg = user_id + "님 회원 예약 수정 실패.";
				url = "reservation/reservationConfirmForm?id=" + user_id;
			}
		//}

		m.addAttribute("url", url);
		m.addAttribute("msg", msg);
		return "fps/alert";
	}



}
