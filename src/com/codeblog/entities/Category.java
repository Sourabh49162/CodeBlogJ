package com.codeblog.entities;

import java.sql.Timestamp;

public class Category {
	private int id;
	private String name;
	private String description;
	private String image;
	private Timestamp createdDate;
	private Timestamp updatedDate;
	private int status;
	
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Category(String name, String description, String image, Timestamp createdDate, Timestamp updatedDate,
			int status) {
		super();
		this.name = name;
		this.description = description;
		this.image = image;
		this.createdDate = createdDate;
		this.updatedDate = updatedDate;
		this.status = status;
	}

	public Category(int id, String name, String description, String image, Timestamp createdDate, Timestamp updatedDate,
			int status) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.image = image;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
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
		return "Category [id=" + id + ", name=" + name + ", description=" + description + ", image=" + image
				+ ", createdDate=" + createdDate + ", updatedDate=" + updatedDate + ", status=" + status + "]";
	}
	
	

}
