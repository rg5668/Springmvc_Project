package model;

public class Payment {
	private int pay_seq;
	private String user_id;
	private String card_num;
	private String room_code;
	private int pay_price;
	private String pay_date;
	private int res_seq;
	
	public int getPay_seq() {
		return pay_seq;
	}
	public void setPay_seq(int pay_seq) {
		this.pay_seq = pay_seq;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCard_num() {
		return card_num;
	}
	public void setCard_num(String card_num) {
		this.card_num = card_num;
	}
	public String getRoom_code() {
		return room_code;
	}
	public void setRoom_code(String room_code) {
		this.room_code = room_code;
	}
	public int getPay_price() {
		return pay_price;
	}
	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	public int getRes_seq() {
		return res_seq;
	}
	public void setRes_seq(int res_seq) {
		this.res_seq = res_seq;
	}
	@Override
	public String toString() {
		return "Payment [pay_seq=" + pay_seq + ", user_id=" + user_id + ", card_num=" + card_num + ", room_code="
				+ room_code + ", pay_price=" + pay_price + ", pay_date=" + pay_date + ", res_seq=" + res_seq + "]";
	}

}
