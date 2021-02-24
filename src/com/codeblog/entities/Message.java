package com.codeblog.entities;

public class Message {
	private String message;
	private String messageType;
	private String messageClass;
	
	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Message(String message, String messageType, String messageClass) {
		super();
		this.message = message;
		this.messageType = messageType;
		this.messageClass = messageClass;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getMessageType() {
		return messageType;
	}

	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}

	public String getMessageClass() {
		return messageClass;
	}

	public void setMessageClass(String messageClass) {
		this.messageClass = messageClass;
	}

}
