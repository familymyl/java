package com.xx.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.xx.entity.ProgramWithAnswer;
import com.xx.entity.Question;
import com.xx.service.ProgramWithAnswerService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class TestProgramWithAnswer {

	@Autowired
	private ProgramWithAnswerService pwaService;
	
	@Test
	public void test(){
		ProgramWithAnswer pwa = new ProgramWithAnswer();
		Question q = new Question();
		q.setId(1);
		pwa.setQuestion(q);
		pwa.setAnswer("java中保留的关键字");
		pwaService.insert(pwa);
	}
	
	@Test
	public void test2(){
		ProgramWithAnswer pwa = new ProgramWithAnswer();
		Question q = new Question();
		q.setId(1);
		pwa.setQuestion(q);
		pwa.setAnswer("java中保留的关键字");
		int id = 1;
		
		System.out.println(pwaService.findByQid(pwa.getQuestion().getId())==null);
	}
}
