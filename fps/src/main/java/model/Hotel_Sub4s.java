package model;


public class Hotel_Sub4s {
	
	private String hotel_code;
	private String room_code;
	private String room_name;
	private String room_img;
	private int price;
	private int guest;
	private String room_check;
	public String getHotel_code() {
		return hotel_code;
	}
	public void setHotel_code(String hotel_code) {
		this.hotel_code = hotel_code;
	}
	public String getRoom_code() {
		return room_code;
	}
	public void setRoom_code(String room_code) {
		this.room_code = room_code;
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
	public int getGuest() {
		return guest;
	}
	public void setGuest(int guest) {
		this.guest = guest;
	}
	public String getRoom_check() {
		return room_check;
	}
	public void setRoom_check(String room_check) {
		this.room_check = room_check;
	}
	@Override
	public String toString() {
		return "Hotel_Sub4s [hotel_code=" + hotel_code + ", room_code=" + room_code + ", room_name=" + room_name
				+ ", room_img=" + room_img + ", price=" + price + ", guest=" + guest + ", room_check=" + room_check
				+ "]";
	}
	
	
	
}
