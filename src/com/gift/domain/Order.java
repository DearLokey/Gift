package com.gift.domain;

import java.sql.Timestamp;

public class Order {
	private int id;
	private String order_state;
	private String user_account;
	private int address_id;
	private Timestamp order_time;
	private int gift_id;

	public Order() {
		super();
	}

	public Order(String order_state, String user_account, int address_id,
			Timestamp order_time, int gift_id) {
		super();
		this.order_state = order_state;
		this.user_account = user_account;
		this.address_id = address_id;
		this.order_time = order_time;
		this.gift_id = gift_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOrder_state() {
		return order_state;
	}

	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}

	public String getUser_account() {
		return user_account;
	}

	public void setUser_account(String user_account) {
		this.user_account = user_account;
	}

	public int getAddress_id() {
		return address_id;
	}

	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}

	public Timestamp getOrder_time() {
		return order_time;
	}

	public void setOrder_time(Timestamp order_time) {
		this.order_time = order_time;
	}

	public int getGift_id() {
		return gift_id;
	}

	public void setGift_id(int gift_id) {
		this.gift_id = gift_id;
	}

}
