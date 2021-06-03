package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import model.Hotel4s;
import model.Hotel4s_Join_Hotel_Sub4s;
import model.Hotel_Sub4s;
import model.Member;
import service.AdminDaoMybatis;

@Controller
@RequestMapping("/admin/")
public class AdminController {

	@Autowired
	AdminDaoMybatis dao;
	
	@RequestMapping("hinsertForm")
	private String hinsertForm(Model m, Hotel4s hotel4s) {
		
		m.addAttribute("hotel4s", hotel4s);
		return "admin/hinsertForm";
	}
	
	@RequestMapping("hinsert")
	   private String hinsert(Model m, Hotel4s hotel4s) {
	      
	      
	      String msg = "중복된 호텔 코드로 인한 숙소등록 실패";
	      String url = "admin/hinsertForm";
	      
	      hotel4s.setHotel_option1(hotel4s.getHotel_option1().replace(",", "/"));
	      hotel4s.setHotel_option2(hotel4s.getHotel_option2().replace(",", "/"));
	      //같은 값이 없으면
	      Hotel4s hs=dao.select(hotel4s.getHotel_code());
	      if(hs==null)
	      {
	         dao.hinsert(hotel4s);
	         msg = hotel4s.getHotel_name()+"숙소등록이 되었습니다.";
	         url = "admin/adminadd?hotel_code="+hotel4s.getHotel_code();
	      }
	      
	      m.addAttribute("url", url);
	      m.addAttribute("msg", msg);
	      return "fps/alert";
	   }
	
	@RequestMapping("pictureimg")
	public String pictureimg(MultipartHttpServletRequest request, Model m) {
		String uploadpath = request.getServletContext().getRealPath("/himg/hotel/");
		MultipartFile multi = request.getFile("hotel_img");

		String filename = "";
		
		
		if(!multi.isEmpty()) {
			File file = new File(uploadpath, multi.getOriginalFilename());
			filename =  multi.getOriginalFilename();
			try {
				multi.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		
		m.addAttribute("filename", filename);
		return "single/pictureimg";
	}
	
	@RequestMapping("hlistForm")
	private String hlistForm(Model m) {
		
		List<Hotel4s> hlist = dao.hlist();
		
		m.addAttribute("hlist",hlist);
		
		
		return "admin/hlistForm";
	}
	
	@RequestMapping("searchForm") 
	private String searchForm(Model m, String hotel_name) {
		
		
		List<Hotel4s> list = dao.search(hotel_name);
		m.addAttribute("list",list);
		
		return "admin/searchForm"; 
	}
	
	@RequestMapping("hupdateForm")
	private String hupdateForm(Model m, String hotel_code) {
		
		Hotel4s hotel4s = dao.select(hotel_code);

		m.addAttribute("hotel4s",hotel4s);
		return "admin/hupdateForm";
	}
	
	@RequestMapping("hupdate")
	private String hupdate(Model m, Hotel4s hotel4s) {
		String msg = "";
		String url = "";
		int num = dao.hupdate(hotel4s);
		
		if(num > 0) {
			msg=hotel4s.getHotel_code()+"호텔수정이 완료되었습니다.";
			url="hotel/hotelSubForm?hotel_code="+hotel4s.getHotel_code();
		}
		
		m.addAttribute("url", url);
		m.addAttribute("msg", msg);
		
		return "fps/alert";
	}
	
	@RequestMapping("hdeleteForm")
	private String hdeleteForm(Model m, String hotel_code) {
		
		Hotel4s hotel4s = dao.select(hotel_code);
		m.addAttribute("hotel4s",hotel4s);
		return "admin/hdeleteForm";
	}
	
	@RequestMapping("hdelete")
	private String hdelete(Model m, String hotel_code) {
		String msg = "";
		String url = "";
		
		if(dao.hdelete(hotel_code)) {
			msg = "삭제 완료.";
			url = "admin/hlistForm";
		} else {
			msg = "삭제 실패.";
			url = "admin/hlistForm";
		}
		
		m.addAttribute("url", url);
		m.addAttribute("msg", msg);
		
		return "fps/alert";
	}
	
	@RequestMapping("hsinsertForm")
	private String hsinsertForm(Model m, String hotel_code) {
		Hotel4s hotel4s = dao.select(hotel_code);
		m.addAttribute("hotel4s",hotel4s);
		
		return "admin/hsinsertForm";
	}
	
	@RequestMapping("hsinsert")
	private String hsinsert(Model m, Hotel_Sub4s hotel_sub, Hotel4s_Join_Hotel_Sub4s hotel4s_join_hotel_sub4s) {
	      String msg = "중복된 호텔 코드로 인한 숙소등록 실패";
	      String url = "hinsert";
	      
	      
	      if(dao.hsinsert(hotel_sub)) {
	         msg = hotel4s_join_hotel_sub4s.getRoom_name()+"객실등록이 되었습니다.";
	         url = "admin/adminaddsub?room_code="+hotel4s_join_hotel_sub4s.getRoom_code();
	      }
	      
	      m.addAttribute("url", url);
	      m.addAttribute("msg", msg);
	      return "fps/alert";
	}
	
	@RequestMapping("hslistForm")
	private String hslistForm(Model m, String hotel_code) {
		
		List<Hotel_Sub4s> hlist = dao.hslist(hotel_code);
		
		m.addAttribute("hlist",hlist);
		m.addAttribute("hotel_code", hotel_code);
		
		return "admin/hslistForm";
	}
	
	@RequestMapping("subpictureimg")
	public String subpictureimg(MultipartHttpServletRequest request, Model m) {
		String uploadpath = request.getServletContext().getRealPath("/himg/room/");
		
		MultipartFile multi = request.getFile("room_img");
		String filename = "";
		
		
		if(!multi.isEmpty()) {
			File file = new File(uploadpath, multi.getOriginalFilename());
			filename =  multi.getOriginalFilename();
			try {
				multi.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		
		m.addAttribute("filename", filename);
		return "single/subpictureimg";
	}
	
	@RequestMapping("hsdeleteForm")
	private String hsdeleteForm(Model m, String room_code) {
		
		Hotel4s_Join_Hotel_Sub4s hotel4s_join_hotel_sub4s =
				dao.selectsub(room_code);
		
		m.addAttribute("hsub",hotel4s_join_hotel_sub4s);
		
		return "admin/hsdeleteForm";
	}
	
	@RequestMapping("hsdelete")
	private String hsdelete(Model m, String room_code, Hotel_Sub4s hotel4s) {
		String msg = "";
		String url = "";
		
		if(dao.hsdelete(room_code)) {
			msg = "삭제 완료.";
			url = "admin/hslistForm?hotel_code="+hotel4s.getHotel_code();
		} else {
			msg = "삭제 실패.";
			url = "admin/hlistForm";
		}
		
		m.addAttribute("url", url);
		m.addAttribute("msg", msg);
		
		return "fps/alert";
	}
	
	@RequestMapping("hsupdateForm")
	private String hsupdateForm(Model m, String room_code) {
		Hotel4s_Join_Hotel_Sub4s hotel4s_join_hotel_sub4s =
				dao.selectsub(room_code);
		
		m.addAttribute("hsub",hotel4s_join_hotel_sub4s);
		return "admin/hsupdateForm";
	}
	
	@RequestMapping("hsupdate")
	private String hsupdate(Model m, Hotel4s_Join_Hotel_Sub4s hotel4s_join_hotel_sub4s) {
		String msg = "숙소수정 실패";
		String url = "admin/hslistForm?hotel_code="+hotel4s_join_hotel_sub4s.getRoom_code();
		int num = dao.hsupdate(hotel4s_join_hotel_sub4s);
		
		if(num > 0) {
			msg=hotel4s_join_hotel_sub4s.getHotel_code()+"의 객실수정이 완료되었습니다.";
			url="admin/hslistForm?hotel_code="+hotel4s_join_hotel_sub4s.getHotel_code();
		}
		
		m.addAttribute("url", url);
		m.addAttribute("msg", msg);
		
		return "fps/alert";
	}
	
	@RequestMapping("adminadd")
	private String adminadd(Model m, String hotel_code) {
		Hotel4s hotel4s = dao.select(hotel_code);
		m.addAttribute("hotel4s",hotel4s);
		
		return "admin/adminadd";
	}
	
	@RequestMapping("adminaddsub")
	private String adminaddsub(Model m, String room_code) {
		
		Hotel4s_Join_Hotel_Sub4s hotel4s_join_hotel_sub4s =
				dao.selectsub(room_code);
		
		m.addAttribute("hsub",hotel4s_join_hotel_sub4s);
		
		return "admin/adminaddsub";
	}
	
	@RequestMapping("memListForm")
	public String memListForm(HttpSession session, Model m) {
		  String msg = ""; 
		  String url="";
		  String login = (String)session.getAttribute("login");

		   if(login == null || login.trim().equals("")) {
			   msg="관리자로 로그인 하세요";
			   url="loginForm";
			   m.addAttribute("msg", msg);
			   m.addAttribute("url", url);
			   return "fps/alert";
		   } 
		   else if (!login.equals("admin"))  {
			   msg="관리자만 가능한 거래 입니다.";
			   url="mainForm";
			   m.addAttribute("msg", msg);
			   m.addAttribute("url", url);
			   return "fps/alert";
	        }
			List<Member> list = dao.memselect();
			
			m.addAttribute("list", list);
			return "admin/memListForm";
	}
	
	@RequestMapping("memdeleteForm")
	public String deleteForm(Model m, String id) {
		
		//String id = member.getId();
		//String id = request.getParameter("id");
		m.addAttribute("id", id);

		return "admin/memdeleteForm";
	}
	
	@RequestMapping("memdelete")
	public String delete(HttpSession session, Model m, String user_id, String password) {
		
		String login = (String) session.getAttribute("login");
		

		String msg = null;
		String url = null;
		if (login == null || login.trim().equals("")) {
			msg = "로그인이 필요합니다.";
			url = "loginForm";
		} else if (!login.equals(user_id) && !login.equals("admin")) {
			msg = "본인만 탈퇴가 가능합니다.";
			url = "mainForm";
		} else if (user_id.equals("admin")) {
			msg = "관리자는 탈퇴할 수 없습니다.";
			url = "mainForm";
		} else {
			Member mem = dao.selectOne(user_id);
			if (login.equals("admin") || password.equals(mem.getPassword())) {
				int result = dao.delete(user_id);
				if (result > 0) { // 삭제 성공
					if (login.equals("admin")) { // 관리자인 경우
						msg = user_id + " 사용자를 강제 탈퇴 성공";
						url = "admin/memListForm";
					} else { // 일반사용자인 경우
						msg = user_id + "님의  회원 탈퇴가 완료되었습니다.";
						url = "loginForm";
						session.invalidate();
					}
				} else { // 삭제 실패
					msg = user_id + "님의 탈퇴시 오류 발생.";
					if (login.equals("admin")) { // 관리자인 경우
						url = "admin/memListForm";
					} else { // 일반사용자인 경우
						url = "main";
					}
				}
			} else {
				msg = user_id + "님의 비빌번호가 틀립니다.";
				url = "memdeleteForm?id=" + user_id;
			}
		}
		m.addAttribute("url", url);
		m.addAttribute("msg", msg);
		return "fps/alert";
	}
	
	@RequestMapping("memupdateForm")
	public String updateForm(HttpSession session, Model m, Member member, String user_id) {


		String login = (String) session.getAttribute("login");

		String msg = "";
		String url = "";
		if (login == null || login.trim().equals("")) {
			msg = "로그인이 필요합니다";
			url = "loginForm";
			m.addAttribute("msg", msg);
			m.addAttribute("url", url);
			return "fps/alert";
		} else if (!login.equals("admin") && !login.equals(user_id)) {
			msg = "자신의 정보만 수정이 가능합니다.";
			url = "loginForm";
			m.addAttribute("msg", msg);
			m.addAttribute("url", url);
			return "fps/alert";
		} else {
			Member mem = dao.selectOne(user_id);
			m.addAttribute("mem", mem);

			return "admin/memupdateForm";
		}
	}
	
	@RequestMapping("memupdate")
	public String update(HttpSession session, Model m, Member member) {

		String login = (String) session.getAttribute("login");
		
		
		String msg = null;
		String url = null;
		
		Member dbMem = dao.selectOne(member.getUser_id());
		if (!login.equals("admin") && !member.getPassword().equals(dbMem.getPassword())) {
			msg = "비밀번호가 틀립니다. 확인 후 다시 거래 하세요.";
			url = "memupdateForm?user_id=" + member.getUser_id();
		} else {
			if (dao.update(member) > 0) {
				msg = member.getUser_id() + "님의 회원 정보가 수정되었습니다.";
				url = "admin/memListForm";
			} else {
				msg = member.getUser_id() + "님 회원 정보 수정 실패.";
				url = "memupdateForm?user_id=" + member.getUser_id();
			}
		}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "fps/alert";
	}

}
