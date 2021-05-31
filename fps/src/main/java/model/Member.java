package model;

public class Member {
	private String user_id;
	private String password;
	private String name;
	private String birth;
	private String tel;
	private String email;
	private String addr;
	
	public void setAddr(String addr) {
		this.addr = addr;
	}
	//getter, setter, toString
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getBirthyy() {
		return birth;
	}
	public void setBirthyy(String birthyy) {
		this.birth = birthyy;
	}
	public String getBirthmm() {
		return birth;
	}
	public void setBirthmm(String birthmm) {
		this.birth = birthmm;
	}
	public String getBirthdd() {
		return birth;
	}
	public void setBirthdd(String birthdd) {
		this.birth = birthdd;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddress(String addr) {
		this.addr = addr;
	}
	public String getAddress1() {
		return addr;
	}
	public void setAddress1(String addr1) {
		this.addr = addr1;
	}
	public String getAddr2() {
		return addr;
	}
	public void setAddr2(String addr2) {
		this.addr = addr2;
	}
	@Override
	public String toString() {
		return "Member [uesr_id=" + user_id + ", password=" + password + ", name=" + name + ", birth=" + birth + ", tel=" + tel
				+ ", email=" + email + ", addr=" + addr + "]";
	}
	
}
