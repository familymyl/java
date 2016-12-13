package com.xx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.xx.entity.QuestionWithTag;

public interface QuestionWithTagMapper {

	@Insert("insert into question_tag(question_id,tag_id) values(#{question.id},#{tag.id})")
	@Options(useGeneratedKeys=true, keyColumn="id", keyProperty="id")
	@ResultMap("questionWithTagResultMap")
	public void insert(QuestionWithTag qt);
	
	@Delete("delete from question_tag where id = #{id}")
	public void delete(int id);
	
	@Update("update question_tag set tag_id = #{tag.id},question_id=#{question.id} where id=#{id}")
	@ResultMap("questionWithTagResultMap")
	public void update(QuestionWithTag qt);
	
	//根据题号查找标签
	@Select("select question_id,tag_id from question_tag where question_id=#{id}")
	@ResultMap("questionWithTagResultMap")
	public List<QuestionWithTag> findByQid(int id,RowBounds rb);
	
	//根据标签查找题号
	@Select("select question_id,tag_id from question_tag where tag_id=#{tag.id}")
	@ResultMap("questionWithTagResultMap")
	public List<QuestionWithTag> findByTid(int id,RowBounds rb);
}
