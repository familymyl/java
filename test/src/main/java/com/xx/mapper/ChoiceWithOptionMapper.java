package com.xx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.xx.entity.ChoiceWithOption;

public interface ChoiceWithOptionMapper {

	@Insert("insert into choice_option(question_id,optionId,options) values(#{question.id},#{optionId},#{options})")
	@Options(useGeneratedKeys=true,keyProperty="id",keyColumn="id")
	public void insert(ChoiceWithOption cwOption);
	
	@Delete("delete from choice_option where question_id = #{id}")
	public void deleteByQuestionId(int id);
	
	@Select("select id,question_id,optionId,options from choice_option where question_id=#{id}")
	public List<ChoiceWithOption> findByQid(int id);
	
	@Update("update choice_option set options =#{options} where optionId = #{optionId} and question_id=#{question.id}")
	public void update(ChoiceWithOption cwOption);

	@Select("select id,question_id,optionId,options from choice_option where optionId = #{optionId} and question_id=#{question.id}")
	public Object findById(ChoiceWithOption cwOption);
	
}
