package com.xx.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xx.entity.Question;
import com.xx.mapper.QuestionMapper;

@Service
public class QuestionService {
	
	@Autowired
	private QuestionMapper questionMapper;
	
	public void insert(Question question){
		questionMapper.insert(question);
	}
	
	public void delete(int id){
		questionMapper.delete(id);
	}
	
	public void update(Question question){
		questionMapper.update(question);
	}
	
	public Question findById(int id){
		return questionMapper.findById(id);
	}
	
	public List<Question> findByPage(RowBounds rb){
		return questionMapper.findByPage(rb);
	}

	public List<Question> findByCategoryId(int id) {

		return questionMapper.findByByCategoryId(id);
	}
}

