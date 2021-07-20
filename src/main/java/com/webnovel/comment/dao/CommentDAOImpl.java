package com.webnovel.comment.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webnovel.comment.domain.CommentVO;

@Repository("commentDAO")
public class CommentDAOImpl implements CommentDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<CommentVO> selectList(){
		List<CommentVO> commentlist = sqlSession.selectList("mapper.comment.selectCommentList");
		return commentlist;
	}
	
	@Override
	public int insertComment(CommentVO commentVO) throws Exception{
		return sqlSession.insert("mapper.comment.insertComment", commentVO);
	}
	
	@Override
	public int updateComment(CommentVO commentVO) throws Exception{
		return sqlSession.update("mapper.comment.updateComment", commentVO);
	}
	
	@Override
	public int deleteComment(int replyNO) throws Exception{
		return sqlSession.delete("mapper.comment.deleteComment", replyNO);
	}
}
