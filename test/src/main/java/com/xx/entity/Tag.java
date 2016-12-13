package com.xx.entity;

/*
 	id int primary key auto_increment,
	name varchar(100),
	pinyin varchar(100)
 */
public class Tag {//标签表

	private int id;
	
	private String name;
	
	private String pinyin;

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

	public String getPinyin() {
		return pinyin;
	}

	public void setPinyin(String pinyin) {
		this.pinyin = pinyin;
	}

	public Tag(int id, String name, String pinyin) {
		super();
		this.id = id;
		this.name = name;
		this.pinyin = pinyin;
	}

	public Tag() {
		super();
	}

	@Override
	public String toString() {
		return "Tag [id=" + id + ", name=" + name + ", pinyin=" + pinyin + "]";
	}
	
	
}
