package com.xx.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xx.entity.ProgramWithAnswer;
import com.xx.mapper.ProgramWithAnswerMapper;

@Service
public class ProgramWithAnswerService {

	@Autowired
	private ProgramWithAnswerMapper pwaMapper;
	
	public void insert(ProgramWithAnswer pwAnswer){
		pwaMapper.insert(pwAnswer);
	}
	
	public void delete(int id){
		pwaMapper.deleteByQuestion(id);
	}
	
	public void update(ProgramWithAnswer pwAnswer){
		pwaMapper.update(pwAnswer);
	}
	
	public ProgramWithAnswer findByQid(int id){
		return pwaMapper.findByQid(id);
	}
}
