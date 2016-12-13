package com.xx.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.xx.entity.ChoiceWithAnswer;
import com.xx.entity.ChoiceWithOption;
import com.xx.service.ChoiceWithAnswerService;
import com.xx.service.ChoiceWithOptionService;

@Controller
public class ChoiceWithOptionController {

	@Autowired
	private ChoiceWithOptionService cwoService;
	
	@Autowired
	private ChoiceWithAnswerService cwaService;
	
	//编辑选择选项
	@RequestMapping("/question/editChoice")
	public String editChoice(){
		return "choiceedit";
	}
	
	//修改选择选项
	@RequestMapping("/question/updateChoice/{id}")
	public String updateChoice(@PathVariable("id")int id,Model model){
		List<ChoiceWithOption> options = cwoService.findByQid(id);
		model.addAttribute("options", options);
		ChoiceWithAnswer cwAnswer = cwaService.findByQid(id);
		model.addAttribute("cwAnswer", cwAnswer);
		return "choiceupdate";
	}
	
	//删除单个选择选项
	@RequestMapping("/question/delete")
	public void deleteChoice(ChoiceWithOption cwOption){
		cwoService.deleteByQuestionId(cwOption.getId());
	}
	
}
