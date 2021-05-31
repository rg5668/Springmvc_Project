package model;

public class Member_Coupon 
{
	private int cpn_seq;
	private String user_id;
	private String cpn_number;
	private String cpn_sdate;
	private String cpn_edate;
	private String cpn_check;
	private String cpn_content;
	private float discount;
	private int max_discount;
	private int min_discount;
	

	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}
	public int getMax_discount() {
		return max_discount;
	}
	public void setMax_discount(int max_discount) {
		this.max_discount = max_discount;
	}
	public int getMin_discount() {
		return min_discount;
	}
	public void setMin_discount(int min_discount) {
		this.min_discount = min_discount;
	}
	public String getCpn_content() {
		return cpn_content;
	}
	public void setCpn_content(String cpn_content) {
		this.cpn_content = cpn_content;
	}
	public int getCpn_seq() {
		return cpn_seq;
	}
	public void setCpn_seq(int cpn_seq) {
		this.cpn_seq = cpn_seq;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCpn_number() {
		return cpn_number;
	}
	public void setCpn_number(String cpn_number) {
		this.cpn_number = cpn_number;
	}
	public String getCpn_sdate() {
		return cpn_sdate;
	}
	public void setCpn_sdate(String cpn_sdate) {
		this.cpn_sdate = cpn_sdate;
	}
	public String getCpn_edate() {
		return cpn_edate;
	}
	public void setCpn_edate(String cpn_edate) {
		this.cpn_edate = cpn_edate;
	}
	public String getCpn_check() {
		return cpn_check;
	}
	public void setCpn_check(String cpn_check) {
		this.cpn_check = cpn_check;
	}
	
	
}
