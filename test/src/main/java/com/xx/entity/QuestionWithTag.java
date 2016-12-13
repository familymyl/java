package com.xx.entity;

/*
 	question_id int references question(id),
	tag_id int references tag(id)
 */
public class QuestionWithTag {//中间表
	
	private int id;
	
	private Question question;
	
	private Tag tag;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public Tag getTag() {
		return tag;
	}

	public void setTag(Tag tag) {
		this.tag = tag;
	}

	public QuestionWithTag(Question question, Tag tag) {
		super();
		this.question = question;
		this.tag = tag;
	}

	public QuestionWithTag() {
		super();
	}
	
	
}
