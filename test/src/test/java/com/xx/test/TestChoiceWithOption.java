package com.xx.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.xx.entity.ChoiceWithOption;
import com.xx.entity.Question;
import com.xx.service.ChoiceWithOptionService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class TestChoiceWithOption {

	@Autowired
	private ChoiceWithOptionService cwoService;
	
	@Test
	public void test(){
		Question q = new Question();
		q.setId(2);
		ChoiceWithOption cwOption = new ChoiceWithOption();
		cwOption.setQuestion(q);
		cwOption.setOptionId(1);
		cwOption.setOptions("abcdefg");
		cwoService.insert(cwOption);
	}
	
	
}
