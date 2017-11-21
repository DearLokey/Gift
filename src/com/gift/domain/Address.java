package com.gift.domain;

public class Address {
	private int id;
	private String user_account;
	private String address;

	public Address() {
		super();
	}

	public Address(String user_account, String address) {
		super();
		this.user_account = user_account;
		this.address = address;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUser_account() {
		return user_account;
	}

	public void setUser_account(String user_account) {
		this.user_account = user_account;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}
