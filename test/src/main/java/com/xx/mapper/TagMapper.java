package com.xx.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.xx.entity.Tag;

public interface TagMapper {
	
	@Insert("insert into tag(name,pinyin) values(#{name},#{pinyin})")
	@Options(useGeneratedKeys=true, keyColumn="id", keyProperty="id")
	public void insert(Tag tag);
	
	@Delete("delete from tag where id = #{id}")
	public void delete(int id);
	
	@Update("update tag set name=#{name},pinyin=#{pinyin} where id =#{id}")
	public void update(Tag tag);
	
	@Select("select id,name,pinyin from tag where pinyin=#{pinyin}")
	public Tag findByPinyin(String pinyin);
	
	@Select("select id,name,pinyin from tag")
	public List<Tag> findByPage(RowBounds rb);
}
