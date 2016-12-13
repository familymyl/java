package com.xx.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xx.entity.ChoiceWithOption;
import com.xx.mapper.ChoiceWithOptionMapper;

@Service
public class ChoiceWithOptionService {

	
	@Autowired
	private ChoiceWithOptionMapper cwoMapper;
	
	public void insert(ChoiceWithOption cwOption){
		cwoMapper.insert(cwOption);
	}
	
	public void deleteByQuestionId(int id){
		cwoMapper.deleteByQuestionId(id);
	}
	
	public void update(ChoiceWithOption cwOption){
		cwoMapper.update(cwOption);
	}
	public List<ChoiceWithOption> findByQid(int id){
		return cwoMapper.findByQid(id);
	}

	public Object findById(ChoiceWithOption cwOption) {
		return cwoMapper.findById(cwOption);
	}

}
