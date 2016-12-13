package com.xx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import com.xx.entity.RacerWithQuestion;

public interface RacerWithQuestionMapper {
	
	@Insert("insert into racer_question(racer_id,question_id,race) values(#{racer.id},#{question.id},#{race})")
	@Options(useGeneratedKeys=true, keyColumn="id", keyProperty="id")
	@ResultMap("racerWithQuestionMapperResultMap")
	public void insert(RacerWithQuestion racerWithQuestion);

	@Delete("delete from racer_question where racer_id=#{id}")
	public void delete(int id);
	
	@Select("select rq.*,r.*,q.* from racer_question rq "
			+ "left join racer r on rq.racer_id=r.id left join question q on rq.question_id=q.id"
			+ " where rq.racer_id=#{id} order by rq.id")
	@ResultMap("racerWithQuestionMapperResultMap")
	public List<RacerWithQuestion> findById(int id);
	
	@Select("select rq.*,r.*,q.* from racer_question rq "
			+ "left join racer r on rq.racer_id=r.id left join question q on rq.question_id=q.id")
	@ResultMap("racerWithQuestionMapperResultMap")
	public List<RacerWithQuestion> findAll();
	
	@Select("select rq.*,r.*,q.* from racer_question rq "
			+ "left join racer r on rq.racer_id=r.id left join question q on rq.question_id=q.id"
			+ " where rq.question_id=#{id} order by rq.id")
	@ResultMap("racerWithQuestionMapperResultMap")
	public List<RacerWithQuestion> findByQuestionId(int id);
}
