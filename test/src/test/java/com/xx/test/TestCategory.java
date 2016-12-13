package com.xx.test;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.xx.entity.Category;
import com.xx.service.CategoryService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class TestCategory {
	
	@Autowired
	private CategoryService categoryService;
	
	@Test
	public void test1(){
		Category c = new Category();
		c.setName("第二阶段");
		c.setId(1);
		c.setSort(2);
		categoryService.update(c);
	}
	@Test
	public void test2(){
		 int i = 3;
		 Category c = categoryService.findBySort(i);
		 System.out.println(c);
	}
	@Test
	public void test3(){
		Category c = new Category();
		c.setName("第三阶段");
		c.setParentId(2);
		for(int i=0;i<=3;i++){
			categoryService.insert(c);
		}
	}
	
	@Test // 测试mybatis自带的分页
	public void test() {
		RowBounds rb = new RowBounds(3, 3); 
		List<Category> list = categoryService.findByPage(rb);
		for(Category p: list) {
			System.out.println(p);
		}
	}
	@Test
	public void test4(){
		PageBounds rb = new PageBounds(1,3,true);
		List<Category> list = categoryService.findByPage(rb);
		for(Category c: list) {
			System.out.println(c);
		}
		PageList<Category> pagelist = (PageList<Category>) list;
		int count = pagelist.getPaginator().getTotalCount();
		System.out.println("记录总数:" + count);
	}
		
}
