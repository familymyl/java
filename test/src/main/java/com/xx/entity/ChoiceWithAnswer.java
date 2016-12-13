package com.xx.entity;

/*
 	id int primary key auto_increment,
	question_id int references question(id),
	answer varchar(100)
 */
public class ChoiceWithAnswer {//选择答案表

	private int id;
	
	private Question question;
	
	private String answer;

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

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public ChoiceWithAnswer(int id, Question question, String answer) {
		super();
		this.id = id;
		this.question = question;
		this.answer = answer;
	}

	public ChoiceWithAnswer() {
		super();
	}
}
