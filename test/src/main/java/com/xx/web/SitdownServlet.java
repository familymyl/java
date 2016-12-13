package com.xx.web;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

@SuppressWarnings("serial")
public class SitdownServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HashMap<String, Object> result = new HashMap<>();
		result.put("current", RacerSection.getUserFromIP(req.getRemoteAddr()));
		ObjectMapper om = new ObjectMapper();
		resp.setContentType("application/json;charset=utf-8");
		om.writeValue(resp.getWriter(), result);
	}
}
