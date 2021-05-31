package model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Board {
	private int board_seq;
	private String board_code;
	private int hotel_grade;
	private String hotel_code;
	private String user_id;
	private String board_pass;
	private String subject;
	private String content;
	private String file1;
	private Date regdate;
	private int readcnt;
	private int ref;
	private int reflevel;
	private int refstep;
	private int reply_chk;

	// getter, setter, toString
	public int getBoard_seq() {
		return board_seq;
	}

	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}

	public String getBoard_code() {
		return board_code;
	}

	public void setBoard_code(String board_code) {
		this.board_code = board_code;
	}

	public int getHotel_grade() {
		return hotel_grade;
	}

	public void setHotel_grade(int hotel_grade) {
		this.hotel_grade = hotel_grade;
	}

	public String getHotel_code() {
		return hotel_code;
	}

	public void setHotel_code(String hotel_code) {
		this.hotel_code = hotel_code;
	}
	

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getBoard_pass() {
		return board_pass;
	}

	public void setBoard_pass(String board_pass) {
		this.board_pass = board_pass;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFile1() {
		return file1;
	}

	public void setFile1(String file1) {
		this.file1 = file1;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getReflevel() {
		return reflevel;
	}

	public void setReflevel(int reflevel) {
		this.reflevel = reflevel;
	}

	public int getRefstep() {
		return refstep;
	}

	public void setRefstep(int refstep) {
		this.refstep = refstep;
	}


	
	public int getReply_chk() {
		return reply_chk;
	}

	public void setReply_chk(int reply_chk) {
		this.reply_chk = reply_chk;
	}

	//오늘 입력한자료 인지 확인
	public boolean getToday() {
		SimpleDateFormat dateFormat = new SimpleDateFormat ("yyyy-MM-dd");
		
		return dateFormat.format(new Date())
				.equals(dateFormat.format(regdate));
	}

	@Override
	public String toString() {
		return "Board [board_seq=" + board_seq + ", board_code=" + board_code + ", hotel_grade=" + hotel_grade
				+ ", hotel_code=" + hotel_code + ", user_id=" + user_id + ", board_pass=" + board_pass + ", subject="
				+ subject + ", content=" + content + ", file1=" + file1 + ", regdate=" + regdate + ", readcnt="
				+ readcnt + ", ref=" + ref + ", reflevel=" + reflevel + ", refstep=" + refstep + ", reply_chk="
				+ reply_chk + "]";
	}




}