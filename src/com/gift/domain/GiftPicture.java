package com.gift.domain;

public class GiftPicture {
	private int id;
	private int gift_id;
	private String picture;

	public GiftPicture(int gift_id, String picture) {
		super();
		this.gift_id = gift_id;
		this.picture = picture;
	}

	public GiftPicture() {
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

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

}
