package com.xx.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xx.entity.ChoiceWithAnswer;
import com.xx.mapper.ChoiceWithAnswerMapper;

@Service
public class ChoiceWithAnswerService {

	@Autowired
	private ChoiceWithAnswerMapper cwaMapper;
	
	public void insert(ChoiceWithAnswer cwAnswer){
		cwaMapper.insert(cwAnswer);
	}
	
	public void update(ChoiceWithAnswer cwAnswer){
		cwaMapper.update(cwAnswer);
	}
	public ChoiceWithAnswer findByQid(int id){
		return cwaMapper.findByQid(id);
	}

	public void deleteByQuestionId(int id) {
		cwaMapper.deleteByQuestionId(id);
	}
}
