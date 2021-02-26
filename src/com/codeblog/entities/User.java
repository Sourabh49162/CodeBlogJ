package com.codeblog.entities;

import java.util.Date;

public class User {
	private int id;
	private String name;
	private String email;
	private String gender;
	private String profileImg;
	private String password;
	private Date created_date;
	private Date updated_date;
	private int status;
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String name, String email, String gender, String profileImg, String password) {
		super();
		this.name = name;
		this.email = email;
		this.gender = gender;
		this.profileImg = profileImg;
		this.password = password;
	}
	
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getCreated_date() {
		return created_date;
	}

	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}

	public Date getUpdated_date() {
		return updated_date;
	}

	public void setUpdated_date(Date updated_date) {
		this.updated_date = updated_date;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", email=" + email + ", gender=" + gender + ", profileImg="
				+ profileImg + ", password=" + password + ", created_date=" + created_date + ", updated_date="
				+ updated_date + ", status=" + status + "]";
	}

	
	
	
	
	

}
