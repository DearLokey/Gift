package com.gift.domain;

public class BigWhoCategory {
	private int id;
	private String name;
	private String picture;

	public BigWhoCategory(String name, String picture) {
		super();
		this.name = name;
		this.picture = picture;
	}

	public BigWhoCategory() {
		super();
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

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

}
