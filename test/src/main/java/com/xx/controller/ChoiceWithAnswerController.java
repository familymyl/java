package com.xx.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xx.entity.ChoiceWithAnswer;
import com.xx.service.ChoiceWithAnswerService;

@Controller
public class ChoiceWithAnswerController {
	
	@Autowired
	private ChoiceWithAnswerService cwaService;
	
	/*@RequestMapping("/question/{question.id}/addCwAnswer")
	public String addCwAnswer(ChoiceWithAnswer cwAnswer){
		if(cwaService.findByQid(cwAnswer.getQuestion().getId())==null){
			cwaService.insert(cwAnswer);
		}else{
			cwaService.update(cwAnswer);
		}
		return "success";
	}*/
}
