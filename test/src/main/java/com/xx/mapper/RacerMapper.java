package com.xx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import com.xx.entity.Racer;

public interface RacerMapper {
	
	@Insert("insert into racer(information) values(#{information})")
	@Options(useGeneratedKeys=true, keyColumn="id", keyProperty="id")
	@ResultMap("racerResultMap")
	public void insert(Racer Racer);

	@Delete("delete from racer where id=#{id}")
	public void delete(int id);
	
	@Select("select id,information,create_date from racer where id=#{id}")
	@ResultMap("racerResultMap")
	public Racer findById(int id);
	
	@Select("select id,information,create_date from racer")
	@ResultMap("racerResultMap")
	public List<Racer> findAll();

	@Select("select id,information,create_date from racer where information=#{information}")
	@ResultMap("racerResultMap")
	public Racer findByInfromation(String information);
}
