package model;

import java.util.Date;

public class hotel4s_hotel_sub4s_reservation4s_join {

	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	private int res_seq;        
	private String res_status; 
	private String sdate;            
	private String edate;          
	private int guest;        
	private String user_id; 
	private String name; 
	private String tel; 
	private String room_code;
	private String hotel_code;
    private String theme_code;
    private String hotel_option1;
    private String hotel_option2;
    private String hotel_name;
    private String hotel_addr;
    private String x;
    private String y;
    public String getX() {
		return x;
	}
	public void setX(String x) {
		this.x = x;
	}
	public String getY() {
		return y;
	}
	public void setY(String y) {
		this.y = y;
	}
	private String area_code;
    private String hotel_img;
    private String hotel_tel;
    private String hotel_intro;
    private String room_name;
    private String room_img;
    private int price;
    private String room_check;
	public int getRes_seq() {
		return res_seq;
	}
	public void setRes_seq(int res_seq) {
		this.res_seq = res_seq;
	}
	public String getRes_status() {
		return res_status;
	}
	public void setRes_status(String res_status) {
		this.res_status = res_status;
	}

	public int getGuest() {
		return guest;
	}
	public void setGuest(int guest) {
		this.guest = guest;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getRoom_code() {
		return room_code;
	}
	public void setRoom_code(String room_code) {
		this.room_code = room_code;
	}
	public String getHotel_code() {
		return hotel_code;
	}
	public void setHotel_code(String hotel_code) {
		this.hotel_code = hotel_code;
	}
	public String getTheme_code() {
		return theme_code;
	}
	public void setTheme_code(String theme_code) {
		this.theme_code = theme_code;
	}
	public String getHotel_option1() {
		return hotel_option1;
	}
	public void setHotel_option1(String hotel_option1) {
		this.hotel_option1 = hotel_option1;
	}
	public String getHotel_option2() {
		return hotel_option2;
	}
	public void setHotel_option2(String hotel_option2) {
		this.hotel_option2 = hotel_option2;
	}
	public String getHotel_name() {
		return hotel_name;
	}
	public void setHotel_name(String hotel_name) {
		this.hotel_name = hotel_name;
	}
	public String getHotel_addr() {
		return hotel_addr;
	}
	public void setHotel_addr(String hotel_addr) {
		this.hotel_addr = hotel_addr;
	}
	public String getArea_code() {
		return area_code;
	}
	public void setArea_code(String area_code) {
		this.area_code = area_code;
	}
	public String getHotel_img() {
		return hotel_img;
	}
	public void setHotel_img(String hotel_img) {
		this.hotel_img = hotel_img;
	}
	public String getHotel_tel() {
		return hotel_tel;
	}
	public void setHotel_tel(String hotel_tel) {
		this.hotel_tel = hotel_tel;
	}
	public String getHotel_intro() {
		return hotel_intro;
	}
	public void setHotel_intro(String hotel_intro) {
		this.hotel_intro = hotel_intro;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public String getRoom_img() {
		return room_img;
	}
	public void setRoom_img(String room_img) {
		this.room_img = room_img;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getRoom_check() {
		return room_check;
	}
	public void setRoom_check(String room_check) {
		this.room_check = room_check;
	}
	@Override
	public String toString() {
		return "hotel4s_hotel_sub4s_reservation4s_join [res_seq=" + res_seq + ", res_status=" + res_status + ", sdate="
				+ sdate + ", edate=" + edate + ", guest=" + guest + ", user_id=" + user_id + ", name=" + name + ", tel="
				+ tel + ", room_code=" + room_code + ", hotel_code=" + hotel_code + ", theme_code=" + theme_code
				+ ", hotel_option1=" + hotel_option1 + ", hotel_option2=" + hotel_option2 + ", hotel_name=" + hotel_name
				+ ", hotel_addr=" + hotel_addr + ", x=" + x + ", y=" + y + ", area_code=" + area_code + ", hotel_img="
				+ hotel_img + ", hotel_tel=" + hotel_tel + ", hotel_intro=" + hotel_intro + ", room_name=" + room_name
				+ ", room_img=" + room_img + ", price=" + price + ", room_check=" + room_check + "]";
	}
	
    
}
