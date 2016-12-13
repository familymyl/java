package com.xx.entity;

import java.sql.Date;
import java.util.List;

public class RacerWithQuestionAll {//抢答试题总表
	
	private RacerWithQuestion racerWithQuestion;
	
	private Category category;

	private List<ChoiceWithOption> choiceWithOption;
	
	private ChoiceWithAnswer choiceWithAnswer;
	
	private ProgramWithAnswer programWithAnswer;

	public RacerWithQuestion getRacerWithQuestion() {
		return racerWithQuestion;
	}

	public void setRacerWithQuestion(RacerWithQuestion racerWithQuestion) {
		this.racerWithQuestion = racerWithQuestion;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<ChoiceWithOption> getChoiceWithOption() {
		return choiceWithOption;
	}

	public void setChoiceWithOption(List<ChoiceWithOption> choiceWithOption) {
		this.choiceWithOption = choiceWithOption;
	}

	public ChoiceWithAnswer getChoiceWithAnswer() {
		return choiceWithAnswer;
	}

	public void setChoiceWithAnswer(ChoiceWithAnswer choiceWithAnswer) {
		this.choiceWithAnswer = choiceWithAnswer;
	}

	public ProgramWithAnswer getProgramWithAnswer() {
		return programWithAnswer;
	}

	public void setProgramWithAnswer(ProgramWithAnswer programWithAnswer) {
		this.programWithAnswer = programWithAnswer;
	}

	public RacerWithQuestionAll(RacerWithQuestion racerWithQuestion, Category category,
			List<ChoiceWithOption> choiceWithOption, ChoiceWithAnswer choiceWithAnswer,
			ProgramWithAnswer programWithAnswer) {
		super();
		this.racerWithQuestion = racerWithQuestion;
		this.category = category;
		this.choiceWithOption = choiceWithOption;
		this.choiceWithAnswer = choiceWithAnswer;
		this.programWithAnswer = programWithAnswer;
	}

	public RacerWithQuestionAll() {
		super();
	}

	@Override
	public String toString() {
		return "RacerWithQuestionAll [racerWithQuestion=" + racerWithQuestion + ", category=" + category
				+ ", choiceWithOption=" + choiceWithOption + ", choiceWithAnswer=" + choiceWithAnswer
				+ ", programWithAnswer=" + programWithAnswer + "]";
	}
}
