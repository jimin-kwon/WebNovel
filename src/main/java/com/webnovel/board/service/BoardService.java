package com.webnovel.board.service;

import java.util.List;
import java.util.Map;

import com.webnovel.board.domain.BoardAttachVO;
import com.webnovel.board.domain.BoardVO;

public interface BoardService {
	public List<BoardVO> boardList();
	
	public List<BoardVO> myBoardList(String id);
	
	public List<BoardVO> genreMainList(String genre);
	
	public List<BoardVO> articleList(int articleNO);
	
	public void writeboard(BoardVO boardVO);

	// main
	public Map<String,List<BoardVO>> topList() throws Exception;

	public List<BoardAttachVO> getAttachList(int articleNO);
}
