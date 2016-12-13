package com.xx.entity;

import java.sql.Date;

public class RacerWithQuestion {//抢答试题表
	
	private int id;
	
	private Racer racer;
	
	private Question question;
	
	private boolean race;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Racer getRacer() {
		return racer;
	}

	public void setRacer(Racer racer) {
		this.racer = racer;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public boolean isRace() {
		return race;
	}

	public void setRace(boolean race) {
		this.race = race;
	}

	public RacerWithQuestion(int id, Racer racer, Question question, boolean race) {
		super();
		this.id = id;
		this.racer = racer;
		this.question = question;
		this.race = race;
	}

	public RacerWithQuestion() {
		super();
	}

	@Override
	public String toString() {
		return "RacerWithQuestion [id=" + id + ", racer=" + racer + ", question=" + question + ", race=" + race + "]";
	}

}
