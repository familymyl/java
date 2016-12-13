package com.xx.web;

import java.io.IOException;
import java.util.concurrent.ConcurrentMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

@SuppressWarnings("serial")
public class AdminServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		ConcurrentMap<Integer, User> all = RacerSection.getIdxMap();
		ObjectMapper om = new ObjectMapper();
		resp.setContentType("application/json;charset=utf-8");
		om.writeValue(resp.getWriter(), all);
	}

}
