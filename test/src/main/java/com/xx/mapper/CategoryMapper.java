package com.xx.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.xx.entity.Category;

public interface CategoryMapper {

	@Insert("insert into category(name,sort,parentId) values(#{name},#{sort},#{parentId})")
	@Options(useGeneratedKeys=true, keyColumn="id", keyProperty="id")
	public void insert(Category category);
	
	@Delete("delete from category where id=#{id}")
	public void delete(int id);
	
	@Update("update category set name=#{name},sort=#{sort},parentId=#{parentId} where id=#{id}")
	public void update(Category category);
	
	@Select("select id,name,sort,parentId from category where sort=#{sort}")
	public Category findBySort(int sort);
	
	@Select("select id,name,sort,parentId from category")
	public List<Category> findAll();
	
	@Select("select id,name,sort,parentId from category")
	public List<Category> findByPage(RowBounds rb);
	
	@Select("select id,name,sort,parentId from category where name=#{name}")
	public Category findByName(String name);
}
