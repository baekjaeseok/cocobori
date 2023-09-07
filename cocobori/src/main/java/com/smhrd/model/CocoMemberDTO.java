package com.smhrd.model;

import java.util.Date;

public class CocoMemberDTO {
	// 회원 DTO
	private String user_email;
	private String user_pw;
	private String user_name;
	private String user_nick;
	private String user_phone;
	private Date user_joindate;
	private String admin_yn;
	private String user_file;


	public CocoMemberDTO(String user_email, String user_pw, String user_nick, String user_phone, String user_file ) {
		this.user_email = user_email;
		this.user_pw = user_pw;
		this.user_nick = user_nick;
		this.user_phone = user_phone;
		this.user_file = user_file;		
	}

	public CocoMemberDTO(String user_email, String user_pw) {
		this.user_email = user_email;
		this.user_pw = user_pw;
	}
	
	public CocoMemberDTO() {
		
	}

	public CocoMemberDTO(String user_email, String user_pw, String user_name, String user_nick, String user_phone,
			Date user_joindate, String admin_yn, String user_file) {
		super();
		this.user_email = user_email;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_nick = user_nick;
		this.user_phone = user_phone;
		this.user_joindate = user_joindate;
		this.admin_yn = admin_yn;
		this.user_file = user_file;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_nick() {
		return user_nick;
	}

	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public Date getUser_joindate() {
		return user_joindate;
	}

	public void setUser_joindate(Date user_joindate) {
		this.user_joindate = user_joindate;
	}

	public String getAdmin_yn() {
		return admin_yn;
	}

	public void setAdmin_yn(String admin_yn) {
		this.admin_yn = admin_yn;
	}

	public String getUser_file() {
		return user_file;
	}

	public void setUser_file(String user_file) {
		this.user_file = user_file;
	}

	@Override
	public String toString() {
		return "CocoMemberDTO [user_email=" + user_email + ", user_pw=" + user_pw + ", user_name=" + user_name
				+ ", user_nick=" + user_nick + ", user_phone=" + user_phone + ", user_joindate=" + user_joindate
				+ ", admin_yn=" + admin_yn + ", user_file=" + user_file + "]";
	}

	
	
}
