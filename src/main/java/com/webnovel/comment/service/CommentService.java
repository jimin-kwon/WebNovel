package com.webnovel.comment.service;

import java.util.List;

import com.webnovel.comment.domain.CommentVO;

public interface CommentService {
	public List<CommentVO> commentList();
	
	public int insertComment(CommentVO commentVO) throws Exception;
	public int updateComment(CommentVO commentVO) throws Exception;
	public int deleteComment(int replyNO) throws Exception;

}
