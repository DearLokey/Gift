package com.gift.domain;

public class WhoCategory {
	private int id;
	private String name;
	private int bigWho_id;

	public WhoCategory(String name, int bigWho_id) {
		super();
		this.name = name;
		this.bigWho_id = bigWho_id;
	}

	public WhoCategory() {
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

	public int getBigWho_id() {
		return bigWho_id;
	}

	public void setBigWho_id(int bigWho_id) {
		this.bigWho_id = bigWho_id;
	}
}
