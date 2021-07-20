package com.webnovel.board.dao;

import java.util.List;

import com.webnovel.board.domain.BoardAttachVO;
import com.webnovel.board.domain.BoardVO;

public interface BoardDAO {
	
	public List<BoardVO> selectList();
	
	public List<BoardVO> selectMyBoardList(String id);
	
	public List<BoardVO> selectGenreMainList(String genre);
	
	public List<BoardVO> selectArticleList(int articleNO);
	
	public Integer insertSelectKey(BoardVO boardVO);
	
	// 첨부파일
	public void insert(BoardAttachVO boardAttachVO);

	public void delete(String uuid);

	public List<BoardAttachVO> findByArticleNO(int articleNO);

	public void deleteAll(int articleNO);

	public List<BoardAttachVO> getOldFiles();
	
	// main
	public List<BoardVO> topList(String genre);
	
}
