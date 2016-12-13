package com.xx.entity;

/*
 	id int primary key auto_increment,
	description text,
	difficulty tinyint,
	category_id int references category(id),
	choice tinyint,
	program tinyint
 */
public class Question {//题库表

	private int id;
	
	private String description;
	
	private int difficulty;
	
	private Category category;
	
	private boolean choice;
	
	private boolean program;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(int difficulty) {
		this.difficulty = difficulty;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public boolean getChoice() {
		return choice;
	}

	public void setChoice(boolean choice) {
		this.choice = choice;
	}

	public boolean getProgram() {
		return program;
	}

	public void setProgram(boolean program) {
		this.program = program;
	}

	public Question(int id, String description, int difficulty,
			Category category, boolean choice, boolean program) {
		super();
		this.id = id;
		this.description = description;
		this.difficulty = difficulty;
		this.category = category;
		this.choice = choice;
		this.program = program;
	}

	public Question() {
		super();
	}

	@Override
	public String toString() {
		return "Question [id=" + id + ", description=" + description + ", difficulty=" + difficulty + ", category="
				+ category + ", choice=" + choice + ", program=" + program + "]";
	}

	
}
