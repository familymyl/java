package com.xx.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xx.entity.QuestionWithTag;
import com.xx.mapper.QuestionWithTagMapper;

@Service
public class QuestionWithTagService {

	@Autowired
	private QuestionWithTagMapper QTMapper;
	
	public void insert(QuestionWithTag qt){
		QTMapper.insert(qt);
	}
	
	public void delete(int id){
		QTMapper.delete(id);
	}
	
	public void update(QuestionWithTag qt){
		QTMapper.update(qt);
	}
	
	//根据题号查找标签
	public List<QuestionWithTag> findByQid(int id,RowBounds rb){
		return QTMapper.findByQid(id, rb);
	}
	
	//根据标签查找题号
	public List<QuestionWithTag> findByTid(int id,RowBounds rb){
		return QTMapper.findByQid(id, rb);
	}
}
