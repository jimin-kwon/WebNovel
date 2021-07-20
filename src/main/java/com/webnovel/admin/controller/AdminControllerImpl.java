package com.webnovel.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/*")
public class AdminControllerImpl implements AdminController{

	@RequestMapping("/adminMain")
	public String adminMain(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.setAttribute("menu", "admin");
		return "/adminMain";
	}
}
