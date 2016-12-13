package com.xx.test;


import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.xx.entity.Category;
import com.xx.entity.Question;
import com.xx.service.QuestionService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class TestQuestion {

	@Autowired
	private QuestionService questionService;
	
	@Test
	public void test(){
		Question q = new Question();
		q.setDescription("java中有goto么");
		q.setDifficulty(1);
		Category c = new Category();
		c.setId(1);
		q.setCategory(c);
		q.setChoice(true);
		q.setProgram(true);
//		for(int i=0;i<=6;i++){
			questionService.insert(q);
//		}
	}
	@Test
	public void test2(){
		int id = 2;
		questionService.delete(id);
	}
	
	@Test
	public void test3(){
		Question q = new Question();
		q.setId(3);
		q.setDescription("简述多线程");
		q.setDifficulty(3);
		Category c = new Category();
		c.setId(2);
		q.setCategory(c);
		q.setChoice(true);
		q.setProgram(false);
		questionService.update(q);
	}
	
	@Test
	public void test4(){
		RowBounds rb = new RowBounds(1,3);
		List<Question> list = questionService.findByPage(rb);
		for(Question l:list){
			System.out.println(l);
		}
	}
	
	@Test
	public void Test5(){
		PageBounds rb = new PageBounds(1, 3, true);
		List<Question> list = questionService.findByPage(rb);
		for(Question l:list){
			System.out.println(l);
		}
		PageList<Question> pagelist =(PageList<Question>) list;
		int page = pagelist.getPaginator().getTotalPages();
		int count = pagelist.getPaginator().getTotalCount();
		System.out.println("记录页数"+page);
		System.out.println("记录总数"+count);
	}
	@Test
	public void test6(){
		int id = 1;
		Question q = questionService.findById(id);
		System.out.println(q);
	}
	
}
