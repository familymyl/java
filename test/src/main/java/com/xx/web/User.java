package com.xx.web;

public class User {

	private int index;
	private String name;
	private String ip;

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public User(int index, String name, String ip) {
		super();
		this.index = index;
		this.name = name;
		this.ip = ip;
	}

	@Override
	public String toString() {
		return "User [index=" + index + ", name=" + name + ", ip=" + ip + "]";
	}

}
