package com.webnovel.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webnovel.board.domain.BoardAttachVO;
import com.webnovel.board.domain.BoardVO;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BoardVO> selectList(){
		List<BoardVO> boardlist = sqlSession.selectList("mapper.board.selectBoardList");
		return boardlist;
	}
	
	@Override
	public List<BoardVO> selectMyBoardList(String id){
		List<BoardVO> myBoardList = sqlSession.selectList("mapper.board.selectMyBoardList", id);
		return myBoardList;
	}
	
	@Override
	public List<BoardVO> selectGenreMainList(String genre) {
		List<BoardVO> genreMainList = sqlSession.selectList("mapper.board.selectGenreList", genre);
		return genreMainList;
	}
	
	@Override
	public List<BoardVO> selectArticleList(int articleNO) {
		List<BoardVO> articleList = sqlSession.selectList("mapper.board.selectArticleList", articleNO);
		return articleList;
	}
	
	@Override
	public Integer insertSelectKey(BoardVO boardVO) {
		Integer articleNO = (Integer)sqlSession.insert("mapper.board.insertSelectKey", boardVO);
		return articleNO;
	}

	// 첨부파일
	@Override
	public void insert(BoardAttachVO boardAttachVO) {
		sqlSession.insert("mapper.board.insert", boardAttachVO);
	}

	@Override
	public void delete(String uuid) {
		sqlSession.delete("mapper.board.delete", uuid);
	}

	@Override
	public List<BoardAttachVO> findByArticleNO(int articleNO) {
		List<BoardAttachVO> boardAttachVO = sqlSession.selectList("mapper.board.findByArticleNO", articleNO);
		return boardAttachVO;
	}

	@Override
	public void deleteAll(int articleNO) {
	}

	@Override
	public List<BoardAttachVO> getOldFiles() {
		return null;
	}

	// main
	@Override
	public List<BoardVO> topList(String genre) {
		List<BoardVO> topList = sqlSession.selectList("mapper.board.mainTopList", genre);
		return topList;
	}

}
