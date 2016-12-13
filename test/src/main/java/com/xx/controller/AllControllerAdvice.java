package com.xx.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

//全局的异常处理类
@ControllerAdvice//控制器通知
public class AllControllerAdvice {

	@ExceptionHandler
	@ResponseBody
	public String ex1(Exception e) {
		System.out.println("异常类型：" + e.getClass());
		e.printStackTrace();
		return "error is:" + e.getMessage();
	}
}
