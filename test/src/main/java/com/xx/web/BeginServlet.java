package com.xx.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

@SuppressWarnings("serial")
public class BeginServlet extends HttpServlet {
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("enter............");
		User win = RacerSection.take();
		System.out.println("win..." + win);
		ObjectMapper om = new ObjectMapper();
		resp.setContentType("application/json;charset=utf-8");
		om.writeValue(resp.getWriter(), win);
	}

}
