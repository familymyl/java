package com.xx.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xx.entity.ProgramWithAnswer;
import com.xx.service.ProgramWithAnswerService;

@Controller
public class ProgramWithAnswerController {

	@Autowired
	private ProgramWithAnswerService pwaService;
	
	//编辑编程答案
	@RequestMapping("/question/editAnswer")
	public String editAnswer(Model model){
		return "programedit";
	} 
	
	//修改编程答案
	@RequestMapping("/question/updateAnswer/{id}")
	public String updateAnswer(@PathVariable("id")int id,Model model){
		ProgramWithAnswer pwAnswer = pwaService.findByQid(id);
		model.addAttribute("pwAnswer", pwAnswer);
		return "programupdate";
	} 
	
	@RequestMapping("/question/{question.id}/addPwAnswer")
	public String addPwAnswer(ProgramWithAnswer pwAnswer){
		
		if(pwaService.findByQid(pwAnswer.getQuestion().getId())==null){
			pwaService.insert(pwAnswer);
		}else{
			pwAnswer.setId(pwaService.findByQid(pwAnswer.getQuestion().getId()).getId());
			pwaService.update(pwAnswer);
		}
		return "success";
	}
}
