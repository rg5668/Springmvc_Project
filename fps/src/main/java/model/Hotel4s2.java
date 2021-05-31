package model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Hotel4s2{
	@Autowired
	private Hotel_Sub4s hotel_sub4s;

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
	 
	 
	 private String option1;
	 private String option2;
	
	 
		 
		 
		public String getOption1() {
		return option1;
	}
	public void setOption1(String option1) {
		this.option1 = option1;
	}
	public String getOption2() {
		return option2;
	}
	public void setOption2(String option2) {
		this.option2 = option2;
	}
		public Hotel_Sub4s getHotel_sub4s() {
			return hotel_sub4s;
		}
		public void setHotel_sub4s(Hotel_Sub4s hotel_sub4s) {
			this.hotel_sub4s = hotel_sub4s;
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

	 
	
	
}
