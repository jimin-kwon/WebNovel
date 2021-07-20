package com.webnovel.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webnovel.board.domain.BoardVO;
import com.webnovel.board.service.BoardService;

@Controller
@RequestMapping(value = {"/", "/main"})
public class MainController {
	
	@Autowired
	private BoardVO boardVO;
	
	@Autowired
	private BoardService boardService;

	@RequestMapping(value = {"", "/main"})
	public String main(Model model, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		session.setAttribute("menu", "");
		model.addAttribute("toplist", boardService.topList());
		return "/main";
	}
}
