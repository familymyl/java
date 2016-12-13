package com.xx.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xx.entity.Tag;
import com.xx.mapper.TagMapper;

@Service
public class TagService {
	
	@Autowired
	private TagMapper tagMapper;
	
	public void insert(Tag tag){
		tagMapper.insert(tag);
	}
	
	public void delete(int id){
		tagMapper.delete(id);
	}
	
	public void update(Tag tag){
		tagMapper.update(tag);
	}
	
	public List<Tag> findByPage(RowBounds rb){
		return tagMapper.findByPage(rb);
	}
}
