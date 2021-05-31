package model;

public class Guest_Date {//체크인,체크아웃,게스트
	private String sdate;
	private String edate;
	private int guest;
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
	@Override
	public String toString() {
		return "Guest_Date [sdate=" + sdate + ", edate=" + edate + ", guest=" + guest + "]";
	}

}
