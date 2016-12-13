package com.xx.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xx.entity.Category;
import com.xx.mapper.CategoryMapper;

@Service
public class CategoryService {
	
	@Autowired
	private CategoryMapper categoryMapper;
	
	public void insert(Category category){
		categoryMapper.insert(category);
	}
	
	public void delete(int id){
		categoryMapper.delete(id);
	}
	
	public void update(Category category){
		categoryMapper.update(category);
	}
	
	public Category findBySort(int sort){
		return categoryMapper.findBySort(sort);
	}
	
	public List<Category> findAll(){
		return categoryMapper.findAll();
	}
	
	public List<Category> findByPage(RowBounds rb){
		return categoryMapper.findByPage(rb);
	}

	public Category findByName(String name) {
		return categoryMapper.findByName(name);
	}
}
