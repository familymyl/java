package com.xx.entity;

/*
 	id int primary key auto_increment,
	name varchar(100),
	sort int,
	parentld int
 */
public class Category {//课程进度表

	private int id;
	
	private String name;
	
	private int sort;//按课程进度排序
	
	private int parentId;

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

	public int getSort() {
		return sort;
	}

	public void setSort(int sort) {
		this.sort = sort;
	}

	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public Category() {
		super();
	}

	public Category(int id, String name, int sort, int parentId) {
		super();
		this.id = id;
		this.name = name;
		this.sort = sort;
		this.parentId = parentId;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + ", sort=" + sort
				+ ", parentId=" + parentId + "]";
	}
	
	
}
