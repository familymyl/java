package com.xx.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.xx.entity.ChoiceWithAnswer;

public interface ChoiceWithAnswerMapper {

	//向选择答案表中添加数据
	@Insert("insert into choice_answer(question_id,answer) values(#{question.id},#{answer})")
	@Options(useGeneratedKeys=true,keyProperty="id",keyColumn="id")
	@ResultMap("choiceWithAnswerResultMap")
	public void insert(ChoiceWithAnswer cwAnswer);
	
	@Update("update choice_answer set answer=#{answer} where question_id=#{question.id}")
	@ResultMap("choiceWithAnswerResultMap")
	public void update(ChoiceWithAnswer cwAnswer);
	
	
	@Select("select id,question_id,answer from choice_answer where question_id=#{id}")
	@ResultMap("choiceWithAnswerResultMap")
	public ChoiceWithAnswer findByQid(int id);

	@Delete("delete from choice_answer where question_id=#{id}")
	public void deleteByQuestionId(int id);

	
	
}
