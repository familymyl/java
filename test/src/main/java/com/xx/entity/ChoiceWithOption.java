package com.xx.entity;

/*
 	id int primary key auto_increment,
	question_id int references question(id),
	optionId tinyint,
	options varchar(200)
 */
public class ChoiceWithOption {//选择选项表

	private int id;
	
	private Question question;
	
	private int optionId;
	
	private String options;

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

	public int getOptionId() {
		return optionId;
	}

	public void setOptionId(int optionId) {
		this.optionId = optionId;
	}

	public String getOptions() {
		return options;
	}

	public void setOptions(String options) {
		this.options = options;
	}

	public ChoiceWithOption(int id, Question question, int optionId, String options) {
		super();
		this.id = id;
		this.question = question;
		this.optionId = optionId;
		this.options = options;
	}

	public ChoiceWithOption() {
		super();
	}
	
}
