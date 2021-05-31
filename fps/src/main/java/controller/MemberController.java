package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import model.Member;
import service.MemberDaoMybatis;

//어제 제가 MemberDao랑 DBConnect랑 memberXml가지고 할떈 잘 됬는데 지금 안됩니다ㅠ

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	MemberDaoMybatis dao;
	
	
	@RequestMapping("test")
	private String pub(Model m) {
		m.addAttribute("test", "member입니다");
		return "index";
	}
	
	/*
	 * @RequestMapping("loginForm") public String loginForm() { return
	 * "member/loginForm"; }
	 */
	
	@RequestMapping("login")
	public String login(Model m, String user_id, String password, HttpSession login) {
														//HttpServletRequest request
		/*
		 * 1. id, pass 파라미터 저장 2. db에서 id 에 해당하는 데이터를 읽어서 Member 전달받기 3. 결과분석 Member객체가
		 * null 인경우 : 아이디를 확인하세요 메세지 출력. --->loginForm.jsp 페이지 이동 Member객체가 null이 아닌 경우
		 * : 화면에서 입력된 비밀번호와 db 비밀번호 검증 같은경우 : 로그인 성공. -----> main.jsp 페이지 이동 다른 경우 :
		 * 비밀번호 확인하세요 ----> loginForm.jsp로 페이지 이동
		 */
		// mem : db에 저장된 회원정보 저장
		Member mem = dao.selectOne(user_id);
		String msg = "아이디를 확인하세요";
		String url = "loginForm";
		if (mem != null) {
			if (password.equals(mem.getPassword())) {
			//*******세션 넘겨줘야함 그래야 메인으로 감**********
				
				login.setAttribute("login", user_id);
				msg = mem.getName() + "님이 로그인 하셨습니다.";
				url = "mainForm";
				
			}
			else if(!(password.equals(mem.getPassword())))
			{
				msg="비밀번호가 틀립니다.";
				url="loginForm";
			}
			else {
				msg = "비밀번호를 입력해주세요.";
				url = "loginForm";
			}
		}
		m.addAttribute("url", url);
		m.addAttribute("msg", msg);
		/* m.addAttribute("login", login.getAttribute("user_id")); */
		
		login.setAttribute("login",user_id);
		
		/* session.setAttribute("ressession", res.getRes_seq()); */
		return "fps/alert";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession logout, Model m) {

		/*
		 * 1. session에 등록된 로그인 정보 제거 2. id님 로그아웃되었습니다. 메세지 출력 후 loginForm.jsp로 페이지 이동하기
		 */
		String login = (String) logout.getAttribute("login");
		logout.removeAttribute("login");
		
		String msg = login + "님 로그아웃되었습니다.";
		
		m.addAttribute("msg", msg);
		m.addAttribute("url", "mainForm");
		return "fps/alert";
	}
	
	
	
	@RequestMapping("join")
	public String join(Member member, Model m, String user_id, HttpServletRequest req) {
		
		String birthyy = req.getParameter("birthyy");
		String birthmm = req.getParameter("birthmm");
		String birthdd = req.getParameter("birthdd");
		
		String post = req.getParameter("post");
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
		
		String birth = stringTodate1(birthyy, birthmm, birthdd);
		String addr = stringTodate2(post,addr1,addr2);
		
		member.setBirth(birth);
		member.setAddress(addr);
		
		String msg = "";
		String url = "";
		
		
		int mem = dao.useridCheck(user_id);
		/*
		 * msg = "아이디를 확인하세요"; url = "SignupForm";
		 */
		if(mem !=1){
		
			int num = dao.insert(member);
			
		if (num > 0) {
			msg=member.getName()+"님의 가입이 완료 되었습니다.";
			url="loginForm";
			} 
		}
		else {
			msg = "아이디가 중복됩니다.";
			url = "SignupForm";
		}
		
		m.addAttribute("url", url);
		m.addAttribute("msg", msg);
		return "fps/alert";
	}
	

	
	public String stringTodate1(String birthyy, String birthmm, String birthdd) {
		
		String birth = birthyy + birthmm + birthdd;
		return birth;
	}
	
	public String stringTodate2(String post, String addr1, String addr2) {
		
		String addr = post + addr1 + addr2;
		return addr;
	}

	
	@RequestMapping("idfind")
	public String idfind(Model m, String user_id, String name, String tel,HttpSession id) {
		
		Member mem = dao.selectTelfind(tel);
		String msg = "이름을 확인하세요";
		String url = "id_findForm";
		
		if (mem != null) {
			if (name.equals(mem.getName())) {
				msg = "아이디는" + mem.getUser_id() + "입니다.";
				url = "id_confirmForm";
				
			}
			else if(!(name.equals(mem.getName())))
			{
				msg="이름이 일치하지않습니다.";
				url="id_findForm";
			}
		}
		
		m.addAttribute("url", url);
		m.addAttribute("msg", msg);
		id.setAttribute("id", mem.getUser_id());
		
		/* session.setAttribute("login", id); */
		
		return "fps/alert";
	}

	
	
	@RequestMapping("passfind")
	public String passfind(Model m, String user_id, String name, HttpSession pass,HttpServletRequest req,HttpServletResponse res) {
														//HttpServletRequest request
		
		// mem : db에 저장된 회원정보 저장
		Member mem = dao.selectOne(user_id);
		String msg = "아이디를 확인하세요";
		String url = "loginForm";
		if (mem != null) {
			if (name.equals(mem.getName())) {
				msg = "비밀번호는" + mem.getPassword() + "입니다.";
				url = "pass_confirmForm";
			}
			else if(!(name.equals(mem.getName())))
			{
				msg="이름이 일치하지않습니다.";
				url="pass_findForm";
			}
		}
		m.addAttribute("url", url);
		m.addAttribute("msg", msg);
		pass.setAttribute("pass", mem.getPassword());
		
		return "fps/alert";
	}

	
	
	@RequestMapping("idcheck")
	public String idcheck(String user_id, Model m, HttpSession idcheck) {
		
		int mem = dao.useridCheck(user_id);
		String msg = "아이디를 입력해주세요.";
		String url = "SignupForm";
		if(mem == 1) {
			msg = "사용중인 아이디 입니다.";
			url = "SignupForm";
		}
		else {
			idcheck.setAttribute("user_id", user_id);
			msg = "사용가능한 아이디입니다.";
			url = "SignupForm";
		}
		
		m.addAttribute("url", url);
		m.addAttribute("msg", msg);
		
		return "fps/alert";
	}
		  
	 
}

		  
 

