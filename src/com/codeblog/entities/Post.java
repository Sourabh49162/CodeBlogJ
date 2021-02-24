package com.codeblog.entities;

import java.sql.Timestamp;

public class Post {
	private int id;
	private String title;
	private String content;
	private String code;
	private String picture;
	private int catId;
	private int userId;
	private Timestamp createdDate;
	private Timestamp updatedDate;
	private int status;
	
	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Post(String title, String content, String code, String picture, int catId, int userId, Timestamp createdDate,
			Timestamp updatedDate, int status) {
		super();
		this.title = title;
		this.content = content;
		this.code = code;
		this.picture = picture;
		this.catId = catId;
		this.userId = userId;
		this.createdDate = createdDate;
		this.updatedDate = updatedDate;
		this.status = status;
	}

	public Post(int id, String title, String content, String code, String picture, int catId, int userId,
			Timestamp createdDate, Timestamp updatedDate, int status) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.code = code;
		this.picture = picture;
		this.catId = catId;
		this.userId = userId;
		this.createdDate = createdDate;
		this.updatedDate = updatedDate;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public int getCatId() {
		return catId;
	}

	public void setCatId(int catId) {
		this.catId = catId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Timestamp getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}

	public Timestamp getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Timestamp updatedDate) {
		this.updatedDate = updatedDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Post [id=" + id + ", title=" + title + ", content=" + content + ", code=" + code + ", picture="
				+ picture + ", catId=" + catId + ", userId=" + userId + ", createdDate=" + createdDate
				+ ", updatedDate=" + updatedDate + ", status=" + status + "]";
	}
	
	
	
	
}
