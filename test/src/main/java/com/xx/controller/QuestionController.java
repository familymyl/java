package com.xx.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.RowSetWarning;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.xx.entity.Category;
import com.xx.entity.ChoiceWithAnswer;
import com.xx.entity.ChoiceWithOption;
import com.xx.entity.Options;
import com.xx.entity.ProgramWithAnswer;
import com.xx.entity.Question;
import com.xx.entity.RacerWithQuestion;
import com.xx.entity.RacerWithQuestionAll;
import com.xx.service.CategoryService;
import com.xx.service.ChoiceWithAnswerService;
import com.xx.service.ChoiceWithOptionService;
import com.xx.service.ProgramWithAnswerService;
import com.xx.service.QuestionService;
import com.xx.service.RacerWithQuestionService;

@Controller
public class QuestionController {

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
	private RacerWithQuestionService rwqService;
	
	//进入试题管理页面
	@RequestMapping("/question/all")
	public String question(Model model){
		List<Category> categorys = categoryService.findAll();
		model.addAttribute("categorys", categorys);
		List<Question> questions = questionService.findByCategoryId(categorys.get(0).getId());
		model.addAttribute("questions", questions);
		return "questionall";
	}

	// 查看单个题目
	@RequestMapping("/question/{id}")
	public String findQuestion(@PathVariable("id") int id, Model model) {
		Question q = questionService.findById(id);
		if (q != null) {
			model.addAttribute("question", q);
			if (q.getChoice()) {
				List<ChoiceWithOption> options = cwoService.findByQid(id);
				model.addAttribute("options", options);
				ChoiceWithAnswer cwAnswer = cwaService.findByQid(id);
				model.addAttribute("cwAnswer", cwAnswer);
			}
			if(q.getProgram()){
				ProgramWithAnswer pwAnswer = pwaService.findByQid(id);
				model.addAttribute("pwAnswer", pwAnswer);
			}
			Boolean can = false;
			if(rwqService.findByQuestionId(id).isEmpty()){
				can = true;
			}
			model.addAttribute("can", can);
			return "question";
		} else {
			model.addAttribute("message", "该试题不存在");
			return "result";
		}
	}

	// 进入编辑题目页面
	@RequestMapping("question/editquestion")
	public String editQuestion(Model model) {
		List<Category> categorys = categoryService.findAll();
		model.addAttribute("categorys", categorys);
		return "questionedit";
	}

	// 添加题目
	@RequestMapping("/question/addQuestion")
	public String addQuestion(Question question, String name,
			Options options, String cwhAnswer, String answer) {

		// 添加试题
		Category category = categoryService.findByName(name);
		question.setCategory(category);
		questionService.insert(question);

		// 添加选项及答案
		if (question.getChoice()) {
			ChoiceWithOption cwOption = new ChoiceWithOption();
			cwOption.setQuestion(question);
			int count = 1;
			List<String> list = options.getOptions();
			for (String option : list) {
				cwOption.setOptionId(count);
				cwOption.setOptions(option);
				cwoService.insert(cwOption);
				count++;
			}

			// 添加选择答案
			ChoiceWithAnswer cwAnswer = new ChoiceWithAnswer();
			cwAnswer.setQuestion(question);
			cwAnswer.setAnswer(cwhAnswer);
			cwaService.insert(cwAnswer);
		}

		// 添加编程答案
		if (question.getProgram()) {
			ProgramWithAnswer pwAnswer = new ProgramWithAnswer();
			pwAnswer.setQuestion(question);
			pwAnswer.setAnswer(answer);
			pwaService.insert(pwAnswer);
		}
		return "redirect:/question/all";
	}
	
	//删除题目
	@RequestMapping("question/questionDelete/{id}")
	@ResponseBody
	public Map<String, Object> questionDelete(@PathVariable("id") int id){
		Map<String,Object> map = new HashMap<>();
		if(rwqService.findByQuestionId(id).isEmpty()){
			Question q = questionService.findById(id);
			if(q!=null){
				questionService.delete(id);
				if(q.getChoice()){
					cwoService.deleteByQuestionId(id);
					cwaService.deleteByQuestionId(id);
				}
				if(q.getProgram()){
					pwaService.delete(id);
				}
			}
			map.put("rows", "");
		}else{
			map.put("rows", "该试题被引用，无法删除！！！");
		}
		
		return map;
	}

	// 进入修改题目页面
	@RequestMapping("question/questionUpdate/{id}")
	public String QuestionUpdate(@PathVariable("id") int id, Model model) {
		List<Category> categorys = categoryService.findAll();
		model.addAttribute("categorys", categorys);
		Question q = questionService.findById(id);
		if (q != null) {
			model.addAttribute("question", q);
			if (q.getChoice()) {
				List<ChoiceWithOption> options = cwoService.findByQid(id);
				model.addAttribute("options", options);
			}
			return "questionupdate";
		} else {
			model.addAttribute("message", "该试题不存在");
			return "result";
		}
	}

	@RequestMapping("/question/updateQuestion/{id}")
	public String updateQuestion(@PathVariable("id") int id, Question question, String name, Options options,
			String cwhAnswer, String answer) {

		// 修改试题
		Category category = categoryService.findByName(name);
		question.setCategory(category);
		question.setId(id);
		questionService.update(question);

		// 修改选项及答案
		if (question.getChoice()) {
			if (cwoService.findByQid(question.getId()) != null) {
				cwoService.deleteByQuestionId(id);
			}
			ChoiceWithOption cwOption = new ChoiceWithOption();
			cwOption.setQuestion(question);
			int count = 1;
			List<String> list = options.getOptions();
			for (String option : list) {
				cwOption.setOptionId(count);
				cwOption.setOptions(option);
				cwoService.insert(cwOption);
				count++;
			}

			// 修改选择答案
			ChoiceWithAnswer cwAnswer = new ChoiceWithAnswer();
			cwAnswer.setQuestion(question);
			cwAnswer.setAnswer(cwhAnswer);
			cwaService.update(cwAnswer);
		}

		// 修改编程答案
		if (question.getProgram()) {
			ProgramWithAnswer pwAnswer = new ProgramWithAnswer();
			pwAnswer.setQuestion(question);
			pwAnswer.setAnswer(answer);
			// 如果之前没有编程答案则插入答案，反之先删除后修改
			if (pwaService.findByQid(pwAnswer.getQuestion().getId()) == null) {
				pwaService.insert(pwAnswer);
			} else {
				pwAnswer.setId(pwaService.findByQid(pwAnswer.getQuestion().getId()).getId());
				pwaService.update(pwAnswer);
			}
		}

		return "redirect:/question/all";

	}

	// 根据课程进度查询题目
	@RequestMapping("question/selectByCategory")
	@ResponseBody
	public List<Question> selectByCategory(String name) throws Exception {
		if(name==null){
			List<Question> questionByC = new ArrayList<>();
			return questionByC;
		}
		Category category = categoryService.findByName(name);
		List<Question> questionByC = new ArrayList<>();
		questionByC = questionService.findByCategoryId(category.getId());
		return questionByC;
	}
	
	
	//题目详情内嵌界面
	@RequestMapping("/questiond/{id}")
	public String QuestionD(@PathVariable("id") int id, Model model) {
		Question q = questionService.findById(id);
		if (q != null) {
			model.addAttribute("question", q);
			if (q.getChoice()) {
				List<ChoiceWithOption> options = cwoService.findByQid(id);
				model.addAttribute("options", options);
				ChoiceWithAnswer cwAnswer = cwaService.findByQid(id);
				model.addAttribute("cwAnswer", cwAnswer);
			}
			if(q.getProgram()){
				ProgramWithAnswer pwAnswer = pwaService.findByQid(id);
				model.addAttribute("pwAnswer", pwAnswer);
			}
			Boolean can = false;
			if(rwqService.findByQuestionId(id).isEmpty()){
				can = true;
			}
			model.addAttribute("can", can);
			return "questiondetails";
		} else {
			model.addAttribute("message", "该试题不存在");
			return "result";
		}
	}

}
