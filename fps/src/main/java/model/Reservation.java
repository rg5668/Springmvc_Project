package model;

public class Reservation 
{
	private int res_seq;
	private String res_status;
	private String sdate;
	private String edate;
	private int guest;
	private String name;
	private String tel;
	private String room_code;
	private String res_date;
	private String user_id;

	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
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
	public int getGuest() {
		return guest;
	}
	public void setGuest(int guest) {
		this.guest = guest;
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
	public String getRes_date() {
		return res_date;
	}
	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}
	@Override
	public String toString() {
		return "Reservation [res_seq=" + res_seq + ", res_status=" + res_status + ", sdate=" + sdate + ", edate="
				+ edate + ", guest=" + guest + ", name=" + name + ", tel=" + tel + ", room_code=" + room_code
				+ ", res_date=" + res_date + ", user_id=" + user_id + "]";
	}
	
}
