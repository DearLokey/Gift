package com.gift.domain;

public class User {
	private int id;
	private String account;
	private String password;
	private String isAdmin;
	private String head;
	private double balance;
	private String name;

	public User() {
		super();
	}

	public User(String account, String password, String isAdmin, String head,
			double balance, String name) {
		super();
		this.account = account;
		this.password = password;
		this.isAdmin = isAdmin;
		this.head = head;
		this.balance = balance;
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}

	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
