package model;

import java.util.Arrays;

public class ArrHotel4s {
	private String hotel_code;
	 private String theme_code;
	 private String[] hotel_option1;
	 private String[] hotel_option2;
	 private String hotel_name;
	 private String hotel_addr;
	 private String area_code;
	 private String hotel_img;
	 private String hotel_tel;
	 private String hotel_intro;
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
	public String[] getHotel_option1() {
		return hotel_option1;
	}
	public void setHotel_option1(String[] hotel_option1) {
		this.hotel_option1 = hotel_option1;
	}
	public String[] getHotel_option2() {
		return hotel_option2;
	}
	public void setHotel_option2(String[] hotel_option2) {
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
	@Override
	public String toString() {
		return "ArrHotel4s [hotel_code=" + hotel_code + ", theme_code=" + theme_code + ", hotel_option1="
				+ Arrays.toString(hotel_option1) + ", hotel_option2=" + Arrays.toString(hotel_option2) + ", hotel_name="
				+ hotel_name + ", hotel_addr=" + hotel_addr + ", area_code=" + area_code + ", hotel_img=" + hotel_img
				+ ", hotel_tel=" + hotel_tel + ", hotel_intro=" + hotel_intro + "]";
	}
	 
	 
}
