package com.gift.domain;

import java.sql.Timestamp;

public class CommentUser extends Comment {
	private String head;
	private String name;

	public CommentUser(int gift_id, String user_account, String content,
			Timestamp time, String head, String name) {
		super(gift_id, user_account, content, time);
		this.head = head;
		this.name = name;
	}

	public CommentUser(int gift_id, String user_account, String content,
			Timestamp time) {
		super(gift_id, user_account, content, time);
	}

	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
