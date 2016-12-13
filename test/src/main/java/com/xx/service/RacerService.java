package com.xx.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xx.entity.ChoiceWithAnswer;
import com.xx.entity.ChoiceWithOption;
import com.xx.entity.ProgramWithAnswer;
import com.xx.entity.Racer;
import com.xx.entity.RacerWithQuestion;
import com.xx.entity.RacerWithQuestionAll;
import com.xx.mapper.RacerMapper;

@Service
public class RacerService {
	
	@Autowired
	private RacerMapper racerMapper;
	
	//添加抢答试题
	public void insert(Racer Racer){
		racerMapper.insert(Racer);
	}
	
	//查询试卷信息查询抢答试题
	public Racer findByInformation(String information){
		return racerMapper.findByInfromation(information);
	}
	
	
	//删除抢答试题
	public void delete(int id){
		racerMapper.delete(id);
	}
	
	//根据id查询抢答试题
	public Racer findById(int id){
		return racerMapper.findById(id);
	}
	
	//查询所有抢答试题
	public List<Racer> findAll(){
		return racerMapper.findAll();
	}
	
	

}
