package com.gift.domain;

import java.sql.Timestamp;

public class Gift {
	private int id;
	private int who_id;
	private int what_id;
	private String name;
	private double price;
	private String picture;
	private int stock_num;
	private int sales_num;
	private int evaluation_num;
	private Timestamp selling_time;
	private String introduction;

	public Gift() {
		super();
	}

	public Gift(int who_id, int what_id, String name, double price,
			String picture, int stock_num, int sales_num, int evaluation_num,
			Timestamp selling_time, String introduction) {
		super();
		this.who_id = who_id;
		this.what_id = what_id;
		this.name = name;
		this.price = price;
		this.picture = picture;
		this.stock_num = stock_num;
		this.sales_num = sales_num;
		this.evaluation_num = evaluation_num;
		this.selling_time = selling_time;
		this.introduction = introduction;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getWho_id() {
		return who_id;
	}

	public void setWho_id(int who_id) {
		this.who_id = who_id;
	}

	public int getWhat_id() {
		return what_id;
	}

	public void setWhat_id(int what_id) {
		this.what_id = what_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public int getStock_num() {
		return stock_num;
	}

	public void setStock_num(int stock_num) {
		this.stock_num = stock_num;
	}

	public int getSales_num() {
		return sales_num;
	}

	public void setSales_num(int sales_num) {
		this.sales_num = sales_num;
	}

	public int getEvaluation_num() {
		return evaluation_num;
	}

	public void setEvaluation_num(int evaluation_num) {
		this.evaluation_num = evaluation_num;
	}

	public Timestamp getSelling_time() {
		return selling_time;
	}

	public void setSelling_time(Timestamp selling_time) {
		this.selling_time = selling_time;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

}
