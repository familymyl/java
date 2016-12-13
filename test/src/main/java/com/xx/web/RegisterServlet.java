package com.xx.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class RegisterServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String name = req.getParameter("name");
		if(name == null || name.trim().equals("")) {
			req.getSession().setAttribute("error", "姓名不能为空");
			resp.sendRedirect(req.getContextPath()+"/index.jsp");
			return;
		}
		Integer idx = Integer.valueOf(req.getParameter("index"));
		String ip = req.getRemoteAddr();
		RacerSection.register(idx, name, ip);
		resp.sendRedirect(req.getContextPath()+"/racer/racer.jsp");
	}

}
