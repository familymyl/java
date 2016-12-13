package com.xx.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.xx.entity.QuestionWithTag;
import com.xx.entity.Question;
import com.xx.entity.QuestionWithTag;
import com.xx.entity.Tag;
import com.xx.service.QuestionWithTagService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class TestQuestionWithTag {

	@Autowired
	private QuestionWithTagService qtService;
	
	@Test
	public void test(){
		Question q = new Question();
		q.setId(1);
		Tag tag = new Tag();
		tag.setId(2);
		QuestionWithTag qt = new QuestionWithTag();
		qt.setQuestion(q);
		qt.setTag(tag);
		for(int i=0;i<5;i++){
		qtService.insert(qt);
		}
	}
	
	@Test
	public void test2(){
		int id = 2;
		qtService.delete(id);
	}
	
	@Test
	public void test3(){
		Question q = new Question();
		q.setId(2);
		Tag tag = new Tag();
		tag.setId(2);
		QuestionWithTag qt = new QuestionWithTag();
		qt.setId(3);
		qt.setQuestion(q);
		qt.setTag(tag);
		qtService.update(qt);
	}
	
	@Test
	public void test4(){
		PageBounds rb = new PageBounds(1,3,true);
		int id = 1;
		List<QuestionWithTag> list = qtService.findByQid(id, rb);
		System.out.println(list);
		for(QuestionWithTag l:list){
			System.out.println(l.getTag().getId());
		}
		PageList<QuestionWithTag> pagelist = (PageList<QuestionWithTag>)list;
		int count = pagelist.getPaginator().getTotalCount();
		System.out.println(count);
	}
	
	@Test
	public void test5(){
		PageBounds rb = new PageBounds(1,3,true);
		int id = 2;
		List<QuestionWithTag> list = qtService.findByTid(id,rb);
		for(QuestionWithTag c: list) {
			System.out.println(c.getTag().getId());
		}
		PageList<QuestionWithTag> pagelist = (PageList<QuestionWithTag>) list;
		int count = pagelist.getPaginator().getTotalCount();
		System.out.println("记录总数:" + count);
	}
	
}
