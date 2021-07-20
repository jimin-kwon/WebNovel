package com.webnovel.comment.dao;

import java.util.List;

import com.webnovel.comment.domain.CommentVO;

public interface CommentDAO {
	
	public List<CommentVO> selectList();
	
	public int insertComment(CommentVO commentVO) throws Exception;
	public int updateComment(CommentVO commentVO) throws Exception;
	public int deleteComment(int replyNO) throws Exception;
}
