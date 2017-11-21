package com.gift.domain;

import java.sql.Timestamp;

public class Comment {
	private int id;
	private int gift_id;
	private String user_account;
	private String content;
	private Timestamp time;

	public Comment(int gift_id, String user_account, String content,
			Timestamp time) {
		super();
		this.gift_id = gift_id;
		this.user_account = user_account;
		this.content = content;
		this.time = time;
	}

	public Comment() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getGift_id() {
		return gift_id;
	}

	public void setGift_id(int gift_id) {
		this.gift_id = gift_id;
	}

	public String getUser_account() {
		return user_account;
	}

	public void setUser_account(String user_account) {
		this.user_account = user_account;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}
}
