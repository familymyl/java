package com.xx.test;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.xx.entity.Tag;
import com.xx.service.TagService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class TestTag {
	
	@Autowired
	private TagService tagService;
	
	@Test
	public void test(){
		Tag tag = new Tag();
		tag.setName("循环");
		tag.setPinyin("xunhuan");
		for(int i=0;i<=5;i++){
			tagService.insert(tag);
		}
	}
	
	@Test
	public void test2(){
		int id = 2;
		tagService.delete(id);
	}
	
	@Test
	public void test3(){
		Tag tag = new Tag();
		tag.setId(4);
		tag.setName("反射");
		tag.setPinyin("fanshe");
		tagService.update(tag);
	}
	
	@Test
	public void test4(){
		RowBounds rb = new RowBounds(3,2);
		List<Tag> list = tagService.findByPage(rb);
		for(Tag l:list){
			System.out.println(l);
		}
		System.out.println("=========================");
		rb = new RowBounds(2,2);
		list = tagService.findByPage(rb);
		for(Tag l:list){
			System.out.println(l);
		}
		System.out.println("=========================");
		rb = new RowBounds(4,2);
		list = tagService.findByPage(rb);
		for(Tag l:list){
			System.out.println(l);
		}
	}
	
	@Test
	public void test5(){
		PageBounds rb = new PageBounds(1,3,true);
		List<Tag> list = tagService.findByPage(rb);
		for(Tag t: list) {
			System.out.println(t);
		}
		PageList<Tag> pagelist = (PageList<Tag>) list;
		int count = pagelist.getPaginator().getTotalCount();
		System.out.println("记录总数:" + count);
	}
}
