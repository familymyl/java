package com.xx.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.xx.entity.Question;

public interface QuestionMapper {
	
	@Insert("insert into question(description,difficulty,category_id,choice,program) values(#{description},#{difficulty},#{category.id},#{choice},#{program})")
	@Options(useGeneratedKeys=true, keyColumn="id", keyProperty="id")
	@ResultMap("questionResultMap")
	public void insert(Question question);
	
	@Delete("delete from question where id =#{id}")
	public void delete(int id);
	
	@Update("update question set description=#{description},difficulty=#{difficulty},category_id=#{category.id},choice=#{choice},program=#{program} where id=#{id}")
	@ResultMap("questionResultMap")
	public void update(Question question);
	
	@Select("select q.id,q.description,q.difficulty,q.category_id,q.choice,q.program,c.* from question q inner join category c on q.category_id = c.id where q.id= #{id}")
	@ResultMap("questionResultMap")
	public Question findById(int id);
	
	@Select("select id,description,difficulty,category_id,choice,program from question")
	@ResultMap("questionResultMap")
	public List<Question> findByPage(RowBounds rb);

	@Select("select id,description,difficulty,category_id,choice,program from question where category_id=#{id}")
	@ResultMap("questionResultMap")
	public List<Question> findByByCategoryId(int id);
	
}
