package com.webnovel.comment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.webnovel.comment.domain.CommentVO;
import com.webnovel.comment.service.CommentService;

import lombok.extern.log4j.Log4j;


@Controller("commentController")
@RequestMapping("/comment")
@Log4j
public class CommentControllerImpl implements CommentController{
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private CommentVO commentVO;
	
	

	@Override
	@GetMapping("/commentList")
	public String commentList() {
		return "/commentList";
	}


}
