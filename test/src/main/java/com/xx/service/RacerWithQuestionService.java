package com.xx.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xx.entity.RacerWithQuestion;
import com.xx.mapper.RacerWithQuestionMapper;

@Service
public class RacerWithQuestionService {
	
	@Autowired
	private RacerWithQuestionMapper RWQMapper;
	
	//添加抢答试题
	public void insert(RacerWithQuestion racerWithQuestion){
		RWQMapper.insert(racerWithQuestion);
	}
	
	//删除抢答试题
	public void delete(int id){
		RWQMapper.delete(id);
	}
	
	//根据试卷id查询抢答试题
	public List<RacerWithQuestion> findByRacerId(int id){
		return RWQMapper.findById(id);
	}
	
	//查询所有抢答试题
	public List<RacerWithQuestion> findAll(){
		return RWQMapper.findAll();
	}

	public List<RacerWithQuestion> findByQuestionId(int id) {
		return RWQMapper.findByQuestionId(id);
	}
	

}
