package model;

public class Member_Card 
{
	private String card_num;
	private String user_id;
	private String card_password;
	private String company;
	public String getCard_num() {
		return card_num;
	}
	public void setCard_num(String card_num) {
		this.card_num = card_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCard_password() {
		return card_password;
	}
	public void setCard_password(String card_password) {
		this.card_password = card_password;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	@Override
	public String toString() {
		return "Member_Card [card_num=" + card_num + ", user_id=" + user_id + ", card_password=" + card_password
				+ ", company=" + company + "]";
	}
	
}
