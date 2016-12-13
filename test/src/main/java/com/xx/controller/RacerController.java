package com.xx.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xx.entity.Category;
import com.xx.entity.ChoiceWithAnswer;
import com.xx.entity.ChoiceWithOption;
import com.xx.entity.ProgramWithAnswer;
import com.xx.entity.Question;
import com.xx.entity.Racer;
import com.xx.entity.RacerWithQuestion;
import com.xx.entity.RacerWithQuestionAll;
import com.xx.service.CategoryService;
import com.xx.service.ChoiceWithAnswerService;
import com.xx.service.ChoiceWithOptionService;
import com.xx.service.ProgramWithAnswerService;
import com.xx.service.QuestionService;
import com.xx.service.RacerService;
import com.xx.service.RacerWithQuestionService;

@Controller
public class RacerController {
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ProgramWithAnswerService pwaService;
	
	@Autowired
	private ChoiceWithOptionService cwoService;
	
	@Autowired
	private ChoiceWithAnswerService cwaService;
	
	@Autowired
	private RacerService racerService;
	
	@Autowired
	private RacerWithQuestionService rwqService;
	
	//进入抢答器选择题目页面
	@RequestMapping("question/selectRacer")
	public String selectRacer(Model model){
		List<Category> categorys = categoryService.findAll();
		model.addAttribute("categorys", categorys);
		List<Question> questions = questionService.findByCategoryId(categorys.get(0).getId());
		model.addAttribute("questions", questions);
		return "questionracer";
	}
	
	//添加抢答试卷
	@RequestMapping("question/racer")
	@ResponseBody
	public String racer(@RequestParam("id")List<Integer> ids,@RequestParam("race")List<Boolean> races, Racer racer){
		if(racerService.findByInformation(racer.getInformation())==null){
			racerService.insert(racer);
			for(int i=0;i<ids.size();i++){
				Question question = new Question();
				question.setId(ids.get(i));
				boolean race = races.get(i);
				RacerWithQuestion racerWithQuestion = new RacerWithQuestion();
				racerWithQuestion.setRacer(racer);
				racerWithQuestion.setQuestion(question);
				racerWithQuestion.setRace(race);
				rwqService.insert(racerWithQuestion);
			}
			
			return "success";
		}else{
			return "该试卷已存在";
		}
		
	}
	
	//判断试卷名是否存在
	@RequestMapping("question/checkInformation")
	@ResponseBody
	public Map<String, Object> checkInformation(String information,Model model){
		Map<String,Object> map = new HashMap<>();
		if(racerService.findByInformation(information)!=null){
			map.put("rows", "该试卷名已存在");
		}else{
			map.put("rows", "");
		}
		return map;
	}
	
	//修改抢答试卷
	@RequestMapping("question/racerUpdate")
	@ResponseBody
	public String racerUpdate(@RequestParam("id")List<Integer> ids,@RequestParam("race")List<Boolean> races, Racer racer){
		//根据试卷信息获取到需要修改抢答试卷的uid
		int uid = racerService.findByInformation(racer.getInformation()).getId();
		//根据uid删除抢答试卷
		racerService.delete(uid);
		//根据uid删除抢答试题
		rwqService.delete(uid);
		//添加修改后的抢答试卷
		racerService.insert(racer);
		//添加修改后的抢答试卷试题
		for(int i=0;i<ids.size();i++){
			Question question = new Question();
			question.setId(ids.get(i));
			boolean race = races.get(i);
			RacerWithQuestion racerWithQuestion = new RacerWithQuestion();
			racerWithQuestion.setRacer(racer);
			racerWithQuestion.setQuestion(question);
			racerWithQuestion.setRace(race);
			rwqService.insert(racerWithQuestion);
		}
		return "success";
	}
	
	//选择试卷界面
	@RequestMapping("question/testPaper")
	public String testPaper(Model model){
		List<Racer> racerList = racerService.findAll();
		model.addAttribute("racerList", racerList);
		return "testPaper";
	}
	
	//试卷详情页
	@RequestMapping("question/racerdetails/{id}")
	public String updateRacer(@PathVariable("id")int id,Model model){
		List<Category> categorys = categoryService.findAll();
		model.addAttribute("categorys", categorys);
		List<RacerWithQuestion> rwQuestion = rwqService.findByRacerId(id);
		model.addAttribute("rwQuestion", rwQuestion);
		List<Racer> racerList = racerService.findAll();
		model.addAttribute("racerList", racerList);
		model.addAttribute("racerId", id);
		return "racerdetails";
	}
	
	//根据试卷id查询题目
	@RequestMapping("question/selectByRacerId/{id}")
	public List<RacerWithQuestion> selectByRacerId(@PathVariable("id")int id){
		Racer racer = racerService.findById(id);
		List<RacerWithQuestion> racerQuestion = rwqService.findByRacerId(id);
		return racerQuestion;
	}
	
	//进入抢答器主页面
	@RequestMapping("question/admin/{id}")
	public String admin(@PathVariable("id")int id,Model model){
		//抢答试题总表集合
		List<RacerWithQuestionAll> racerWithQuestionAll = new ArrayList<>();
		//抢答试题表集合
		List<RacerWithQuestion> racerQuestion = rwqService.findByRacerId(id);
		for (RacerWithQuestion racerWithQuestion : racerQuestion) {
			//单个抢答试题
			RacerWithQuestionAll rwq = new RacerWithQuestionAll();
			rwq.setRacerWithQuestion(racerWithQuestion);
			int questionId = racerWithQuestion.getQuestion().getId();
			//根据试题id查询试题选项
			List<ChoiceWithOption> choiceWithOption = cwoService.findByQid(questionId);
			rwq.setChoiceWithOption(choiceWithOption);
			//根据试题id查询选择答案
			ChoiceWithAnswer choiceWithAnswer = cwaService.findByQid(questionId);
			rwq.setChoiceWithAnswer(choiceWithAnswer);
			//根据试题id查询简答答案
			ProgramWithAnswer programWithAnswer = pwaService.findByQid(questionId);
			rwq.setProgramWithAnswer(programWithAnswer);
			racerWithQuestionAll.add(rwq);
			
		}
		
		model.addAttribute("racerWithQuestionAll", racerWithQuestionAll);
		return "admin/index";
	}
	
	//根据试卷名删除试卷
	@RequestMapping("question/deleteRacer")
	@ResponseBody
	public String deleteRacerByName(String information){
		if(racerService.findByInformation(information)!=null){
			int id = racerService.findByInformation(information).getId();
			racerService.delete(id);
			rwqService.delete(id);
		}
		return "";
	}
	
	@RequestMapping("question/selectByInformation")
	@ResponseBody
	public List<RacerWithQuestion> selectByInformation(String information,Model model){
		if(information==null||racerService.findByInformation(information)==null){
			return Collections.emptyList();
		}else{
			int id = racerService.findByInformation(information).getId();
			//抢答试题表集合
			List<RacerWithQuestion> racerQuestion = rwqService.findByRacerId(id);
			List<Question> questionByI = new ArrayList<>();
			
			return racerQuestion;
		}
	}

}
