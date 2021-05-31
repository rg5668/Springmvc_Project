package controller;

import java.io.File;
import java.io.IOException;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import model.Board;
import service.BoardDaoMybatis;

@Controller
@RequestMapping("/board/")
public class BoardController {
	
	String sesboardid="1";
	int sespageNum=1;
	int sesreplychk = 0;
	
	@Autowired
	BoardDaoMybatis dao;
	
	@ModelAttribute() 
	public void setSession(HttpSession session) {
		
		if (session.getAttribute("board_code")!=null) {
			 sesboardid=(String) session.getAttribute("board_code");
		
		}
			
		if(session.getAttribute("pageNum")!=null) {
			try {
			sespageNum=Integer.parseInt((String)(session.getAttribute("pageNum")));
			} catch (Exception e) {}
		}
		
	}
	@RequestMapping("searchListForm")
	public String searchList(String page, String board_code, Model m, HttpSession session) {
		int pageNum=1;
		   try {
			   pageNum = Integer.parseInt(page);
			   session.setAttribute("pageNum", pageNum);
			   sespageNum=pageNum;
			   
		   } catch (NumberFormatException e) {}
		  		   
		   if(board_code!=null) { 
			   session.setAttribute("board_code", board_code);
			   sesboardid= board_code;
			   session.setAttribute("pageNum", 1);
			   sespageNum=1;
		   }
		   
		   
		   int limit = 10; //한페이지에 출력할 게시물 건수
		   
		   int boardcount = dao.boardCount(sesboardid);//등록된 전체 게시물의 건수
		   		   
		   //13 --->   boardcount/limit : 4 + 1
		   int maxpage = (int)(boardcount/limit)+(boardcount%limit==0?0:1);
		   int bottomLine= 5;
		   // page 1,2,3 : 1,   4,5,6: 2
		   int startpage = 1 + (pageNum - 1) / bottomLine * bottomLine;
		   int endpage = startpage + bottomLine - 1;
		   if(endpage > maxpage) endpage = maxpage;
		   int boardnum = boardcount - (pageNum -1) * limit;
		   
		   String boardname = "공지사항";
		   if (sesboardid.equals("2")) boardname = "이벤트";
		   if (sesboardid.equals("3")) boardname = "QNA";
		   if (sesboardid.equals("5")) boardname = "자주묻는질문";
		   
		   String login = (String) session.getAttribute("login");
		   
		   m.addAttribute("boardcount", boardcount);
		   m.addAttribute("boardnum", boardnum);
		   m.addAttribute("startpage", startpage);
		   m.addAttribute("bottomLine", bottomLine);
		   m.addAttribute("endpage", endpage);
		   m.addAttribute("maxpage", maxpage);
		   m.addAttribute("pageNum", pageNum);
		   m.addAttribute("boardname", boardname);
		   m.addAttribute("login",login);
		   return "board/listForm";
	}
	
	@RequestMapping("listForm")
	public String list(String page, String board_code, Model m, HttpSession session)  {

		/*
		 * 게시물 목록 보기 
		 * 1. pageNum 파라미터 존재. pageNum 파라미터 없으면 1로 설정.
		 * 2. 10건의 게시물 출력. => db에서 해당 페이지에 출력되는 게시물만 조회. 순서 : 
		 *                        최근 게시물 순으로
		 * 3. 화면에 출력.
		 */ 
		
		/* boardid와 pageNum은 session으로 작성 한다 */
		
		   int pageNum=1;
		   try {
			   pageNum = Integer.parseInt(page);
			   session.setAttribute("pageNum", pageNum);
			   sespageNum=pageNum;
			   
		   } catch (NumberFormatException e) {}
		  		   
		   if(board_code!=null) { 
			   session.setAttribute("board_code", board_code);
			   sesboardid= board_code;
			   session.setAttribute("pageNum", 1);
			   sespageNum=1;
		   }
		   
		   
		   int limit = 10; //한페이지에 출력할 게시물 건수
		   
		   int boardcount = dao.boardCount(sesboardid);//등록된 전체 게시물의 건수
		   		   
		   List<Board> list = dao.list(pageNum,sesboardid,limit,boardcount); //화면에 출력된 게시물 데이터
		   //13 --->   boardcount/limit : 4 + 1
		   int maxpage = (int)(boardcount/limit)+(boardcount%limit==0?0:1);
		   int bottomLine= 5;
		   // page 1,2,3 : 1,   4,5,6: 2
		   int startpage = 1 + (pageNum - 1) / bottomLine * bottomLine;
		   int endpage = startpage + bottomLine - 1;
		   if(endpage > maxpage) endpage = maxpage;
		   int boardnum = boardcount - (pageNum -1) * limit;
		   
		   String boardname = "공지사항";
		   if (sesboardid.equals("2")) boardname = "이벤트";
		   if (sesboardid.equals("3")) boardname = "QNA";
		   if (sesboardid.equals("5")) boardname = "자주묻는질문";
		   
		   String login = (String) session.getAttribute("login");
		   
		   m.addAttribute("boardcount", boardcount);
		   m.addAttribute("list", list);
		   m.addAttribute("boardnum", boardnum);
		   m.addAttribute("startpage", startpage);
		   m.addAttribute("bottomLine", bottomLine);
		   m.addAttribute("endpage", endpage);
		   m.addAttribute("maxpage", maxpage);
		   m.addAttribute("pageNum", pageNum);
		   m.addAttribute("boardname", boardname);
		   m.addAttribute("login",login);
		   return "board/listForm";
	}
	@RequestMapping("write")
	public String write(MultipartHttpServletRequest request,Board board, Model m)  {
		/*
		 * 1. 파라미터 값을 model.Board 객체 저장. 2. 게시물 번호 num 현재 등록된 num의 최대값을 조회. 최대값 +1 등록된
		 * 게시물의 번호. db에서 maxnum 을 구해서 +1 값으로 num 설정하기
		 */
		// 1. 파라미터 값을 model.Board 객체 저장.

		String uploadpath = request.getServletContext().getRealPath("/upfile");
		
		MultipartFile multiFile = request.getFile("uploadfile");
		if (!multiFile.isEmpty()) {
			File file = new File(uploadpath, multiFile.getOriginalFilename());
			try {
				multiFile.transferTo(file);
				board.setFile1(multiFile.getOriginalFilename());
			} catch (IllegalStateException e) {
				board.setFile1("");
				e.printStackTrace();
			} catch (IOException e) {
				board.setFile1("");
				e.printStackTrace();			}
		} else {			board.setFile1("");		}
			// 2. sequence nextval 입력
			// db에서 maxnum 을 구해서 +1 값으로 num 설정하기
		
			// 3. board 객체의 내용을 db에 insert 하기
			String msg = "게시물 등록 실패";
			String url = "board/writeForm";
			board.setBoard_code(sesboardid);  //입력시 boardid 입력함
			if (dao.insert(board)) {				
				msg = "게시물 등록 성공";				
				url = "board/listForm";
			}
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
		return "fps/alert";
	}
	
	@RequestMapping("boardCheck")
	public String boardCheck(int board_seq,String board_code,String board_pass, Model m,HttpServletRequest request)  {
		
		String url = "board/infoForm";
		Board board = dao.selectOne(board_seq);
		String password = board.getBoard_pass();
		
		
		request.setAttribute("password",password);
		request.setAttribute("board_seq",board_seq);
		request.setAttribute("board_code",board_code);
		request.setAttribute("url", url);

		return "board/boardCheck";
	}
	
	@RequestMapping("info")
	public String info(int board_seq, Model m,HttpSession session)  {
		/* : 게시물 상세 보기    :board/info?num=41
		  1. num 파라미터를 이용하여 db에 해당 게시물 조회
		     Board board = new BoardDao().selectOne(num); 
		  2. 조회수 증가시키기.  readcnt+1
		      new BoardDao().readcntadd(num);
		  3. 1번에서 조회한 게시물데이터를 화면에 출력하기   */  
		   String boardname = "공지사항";
		   if (sesboardid.equals("2")) boardname = "이벤트";
		   if (sesboardid.equals("3")) boardname = "QNA";
		   if (sesboardid.equals("5")) boardname = "자주묻는질문";

		//파라미터값읽기
		Board board = dao.selectOne(board_seq); //게시물 조회
		dao.readcntadd(board_seq); //조회건수증가
				
     	String login = (String)session.getAttribute("login");

		m.addAttribute("board", board);
		m.addAttribute("board_seq", board_seq);
		m.addAttribute("boardname", boardname);
		m.addAttribute("login",login);
		
		return "board/infoForm";
	}
	
	
	@RequestMapping("updateForm")
	public String updateForm(int board_seq, Model m)  {
		/*	 /WebContent/model1/board/updateForm.jsp
	    1. num 값의 게시물을 조회화여 화면 출력하기 */
	    Board board = dao.selectOne(board_seq);
	     m.addAttribute("board", board);
	     return "board/updateForm";
	}
	@RequestMapping("update")
	public String update(MultipartHttpServletRequest request, Board board, Model m)  {
		/* /WebContent/model1/board/update.jsp
		  1. 파라미터정보들을 Board 객체 저장.
		  2. 비밀번호 검증
		         비밀번호 일치 : 수정으로.
		         비밀번호 불일치 : 비밀번호 오류 메세지 출력하고, updateForm.jsp로 페이지 이동
		  3. 수정성공 : 수정성공 메시지 출력 후  list.jsp 페이지 이동
		         수정실패   : 수정실패 메시지 출력 후 updateForm.jsp 페이지 이동         */
		    
		 //파라미터 정보 Board 객체에 저장 
		   
		String uploadpath = request.getServletContext().getRealPath("/upfile") ;
		MultipartFile multiFile = request.getFile("uploadfile");
		if (!multiFile.isEmpty()) {
			File file = new File(uploadpath, multiFile.getOriginalFilename());
			try {
				multiFile.transferTo(file);
				board.setFile1(multiFile.getOriginalFilename());
			} catch (IllegalStateException e) {
				board.setFile1("");
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				board.setFile1("");
				// TODO Auto-generated catch block
				e.printStackTrace();			}
		} else {			board.setFile1("");		}
		   //비밀번호 검증
		
		   Board dbBoard = dao.selectOne(board.getBoard_seq());
		   String msg = "비밀번호가 틀렸습니다.";
		   String url = "board/updateForm?num=" + board.getBoard_seq();
		   
		   
		   if(board.getBoard_pass().equals(dbBoard.getBoard_pass())) {
			   //수정하기
		 	  if(dao.update(board)) {	  msg = "게시물 수정 완료";		  url = "board/listForm";
			  } else {		  msg = "게시물 수정 실패";	  }
		   }
		   request.setAttribute("url", url);
		   request.setAttribute("msg", msg);
		
		
		
		return "fps/alert";
	}
	@RequestMapping("deleteForm")
	public String deleteForm(int board_seq, Model m)  {
		Board board = dao.selectOne(board_seq); //게시물 조회

		m.addAttribute("board", board);
		m.addAttribute("board_seq", board_seq);
		
		return "board/deleteForm";
	}
	@RequestMapping("delete")
	public String delete(int board_seq, String board_pass, Model m) throws Throwable {
		/*	 /WebContent/model1/board/delete.jsp
		   1. num,pass 파라미터를 변수에 저장.
		   2. 입력된 비밀번호와 db 비밀번호 검증
		            틀린경우 : 비밀번호 오류 메시지 출력, deleteForm.jsp 페이지 이동
		   3. 게시물 삭제.
		           삭제 성공 : 삭제 성공 메시지 출력, list.jsp 페이지 이동
		           삭제 실패 : 삭제 실패 메시지 출력, info.jsp 페이지 이동   */           
		String msg = "비밀번호가 틀렸습니다!";String url = "board/deleteForm?board_seq=" + board_seq;
		
		Board board = dao.selectOne(board_seq);
		//board.getPass() : db에 저장된 비밀번호
		if (board_pass.equals(board.getBoard_pass())) { 
			if (dao.delete(board_seq)) {		msg = "게시글을 성공적으로 삭제하였습니다.";		
			url = "board/listForm";
			} else {		msg = "게시글을 삭제하는데 실패하였습니다!";
				url = "board/infoForm?board_seq=" + board_seq;
			}}
		
		  m.addAttribute("url", url);
		   m.addAttribute("msg", msg);
		return "fps/alert";
	}
	
	@RequestMapping("replyForm")
	public String replyForm(int board_seq, Model m)  {
		/* /WebContent/model1/board/replyForm.jsp : 답변글 쓰기 화면
		   1. 원글의 num을 파라미터로 받는다.
		   2. 원글의 num,ref,reflevel,refstep 정보를 저장
		   3. 입력 화면 표시 */
	
		Board board = dao.selectOne(board_seq); //게시물 조회
		
		m.addAttribute("board", board);
		
		return "board/replyForm";
	}
	@RequestMapping("reply")
	public String reply(Board board, Model m)  {
		/*	 /WebContent/model1/board/reply.jsp : 답글 등록
		   1. 파라미터 값을 Board 객체에 저장하기
		            원글정보 : num, ref, reflevel(ㄴ), refstep(print)
		            답글정보  : name, pass, subject, content 
		   2. 같은 ref 값을 사용하는 게시물들의 refstep 값을 1 증가 시키기
		                     1    1    0         0
		                     2    2    0         0
		                     3    1    1         2
		                     4    1    1         1 
		                     ========================  print
		                     2    2    0         0
		                     1    1    0         0
		                     4    1    1         1
		                     3    1    1         2 
		   3. Board 객체를 db에 insert 하기.
		   4. 등록 성공시 : "답변등록 완료"메시지 출력 후,  list.jsp로 페이지 이동
		            등록 실패시 : "답변등록시 오류발생"메시지 출력 후, replyForm.jsp로 페이지 이동하기 
		    1. 파라미터 값을 Board 객체에 저장하기 */
		   
		   board.setBoard_code(sesboardid);  //입력시 boardid 입력함
		   dao.refstepadd(board.getRef(),board.getRefstep());
		   
		   dao.replychange(board.getRef()); //답변

		   
		   //3. Board 객체를 db에 insert 하기.
		  String msg = "답변등록시 오류발생";
		   String url = "board/replyForm?board_seq="+board.getBoard_seq();
		  if(dao.insert(board)) {  	  msg = "답변등록 완료"; 
		  url = "board/listForm";   }
		
		m.addAttribute("url", url);
		m.addAttribute("msg", msg);
		
		return "fps/alert";
	}

	
	
	
	
	
	
	
	
}
