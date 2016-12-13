package com.xx.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.xx.entity.Question;
import com.xx.entity.Racer;
import com.xx.entity.RacerWithQuestion;
import com.xx.mapper.RacerWithQuestionMapper;
import com.xx.service.RacerService;
import com.xx.service.RacerWithQuestionService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
//测试抢答试题
public class TestRacerWithQuestion {
	
	@Autowired
	private RacerWithQuestionMapper rwqMapper;
	
	@Autowired
	private RacerWithQuestionService rwqService;
	
	@Autowired
	private RacerService racerService;
	
	@Test//测试抢答试卷添加方法
	public void test1(){
		Racer racer = new Racer();
		racer.setInformation("7班抢答试题");
		racerService.insert(racer);
	}
	
	@Test//测试删除方法
	public void test11(){
		racerService.delete(1);
	}
	@Test//测试根据试卷id查询方法
	public void test12(){
		Racer racer =  racerService.findById(2);
		System.out.println(racer);
	}
	@Test//测试查询全部方法
	public void test13(){
		List<Racer> list =  racerService.findAll();
		for (Racer l : list) {
			System.out.println(l);
		}
	}
	@Test//测试添加试卷试题信息方法
	public void test2(){
		Question question = new Question();
		question.setId(1);
		Racer racer = new Racer();
		racer.setId(2);
		RacerWithQuestion rwQuestion = new RacerWithQuestion();
		rwQuestion.setQuestion(question);
		rwQuestion.setRacer(racer);
		rwqService.insert(rwQuestion);
	}
	@Test//测试根据试卷id删除方法
	public void test21(){
		rwqService.delete(2);
	}
	
	@Test//测试根据试卷id查询方法
	public void test22(){
		List<RacerWithQuestion> list =  rwqService.findByRacerId(2);
		for (RacerWithQuestion l : list) {
			System.out.println(l);
		}
	}
	@Test//测试查询全部方法
	public void test23(){
		List<RacerWithQuestion> list =  rwqService.findAll();
		for (RacerWithQuestion l : list) {
			System.out.println(l);
		}
	}
	
	@Test
	public void test3(){
		Racer racer = new Racer();
		racer.setInformation("7班抢答试题");
		racerService.insert(racer);
		Question question = new Question();
		question.setId(1);
		RacerWithQuestion rwQuestion = new RacerWithQuestion();
		rwQuestion.setQuestion(question);
		rwQuestion.setRacer(racer);
		rwqService.insert(rwQuestion);
	}
}
