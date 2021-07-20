package com.webnovel.comment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.webnovel.comment.dao.CommentDAO;
import com.webnovel.comment.domain.CommentVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service("commentService")
@Transactional(propagation = Propagation.REQUIRED)
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDAO commentDAO;

	public List<CommentVO> commentList() {
		List<CommentVO> commentlist = commentDAO.selectList();
		return commentlist;
	}

	@Override
	public int insertComment(CommentVO commentVO) throws Exception {
		return commentDAO.insertComment(commentVO);
	}
	
	@Override
	public int updateComment(CommentVO commentVO) throws Exception {
		return commentDAO.updateComment(commentVO);
	}
	
	@Override
	public int deleteComment(int replyNO) throws Exception {
		return commentDAO.deleteComment(replyNO);
	}

}
