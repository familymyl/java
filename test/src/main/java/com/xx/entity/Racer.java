package com.xx.entity;

import java.sql.Date;

public class Racer {//抢答试卷表
	
	private int id;
	
	private String information;
	
	private Date date;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getInformation() {
		return information;
	}

	public void setInformation(String information) {
		this.information = information;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Racer(int id, String information, Date date) {
		super();
		this.id = id;
		this.information = information;
		this.date = date;
	}

	public Racer() {
		super();
	}

	@Override
	public String toString() {
		return "Racer [id=" + id + ", information=" + information + ", date=" + date + "]";
	}

}
