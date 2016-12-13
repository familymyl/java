package com.xx.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.xx.entity.ChoiceWithAnswer;
import com.xx.entity.Question;
import com.xx.service.ChoiceWithAnswerService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class TestChoiceWithAnswer {

	@Autowired
	private ChoiceWithAnswerService cwaService;
	
	@Test
	public void test1(){
		Question q = new Question();
		q.setId(2);
		ChoiceWithAnswer cwAnswer = new ChoiceWithAnswer();
		cwAnswer.setQuestion(q);
		cwAnswer.setAnswer("A,B");
		cwaService.insert(cwAnswer);
	}
	
	@Test
	public void test2(){
		int id = 2;
		System.out.println(cwaService.findByQid(id).getAnswer());
	}
}
