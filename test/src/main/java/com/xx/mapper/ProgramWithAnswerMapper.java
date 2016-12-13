package com.xx.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.xx.entity.ProgramWithAnswer;

public interface ProgramWithAnswerMapper {

	@Insert("insert into program_answer(question_id,answer) values(#{question.id},#{answer})")
	@Options(useGeneratedKeys=true,keyProperty="id",keyColumn="id")
	@ResultMap("programWithAnswerResultMap")
	public void insert(ProgramWithAnswer pwAnswer);
	
	@Delete("delete from program_answer where question_id = #{id}")
	@ResultMap("programWithAnswerResultMap")
	public void deleteByQuestion(int id);
	
	@Update("update program_answer set answer=#{answer} where question_id=#{question.id}")
	@ResultMap("programWithAnswerResultMap")
	public void update(ProgramWithAnswer pwAnswer);
	
	@Select("select id,question_id,answer from program_answer where question_id=#{id}")
	@ResultMap("programWithAnswerResultMap")
	public ProgramWithAnswer findByQid(int id);
}
