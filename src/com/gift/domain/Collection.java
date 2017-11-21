package com.gift.domain;

import java.sql.Timestamp;

public class Collection {
	private int id;
	private int gift_id;
	private String user_account;
	private Timestamp collect_time;

	public Collection(int gift_id, String user_account, Timestamp collect_time) {
		super();
		this.gift_id = gift_id;
		this.user_account = user_account;
		this.collect_time = collect_time;
	}

	public Collection() {
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

	public Timestamp getCollect_time() {
		return collect_time;
	}

	public void setCollect_time(Timestamp collect_time) {
		this.collect_time = collect_time;
	}
}
