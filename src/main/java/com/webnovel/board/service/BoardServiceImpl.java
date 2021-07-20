package com.webnovel.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.webnovel.board.dao.BoardDAO;
import com.webnovel.board.domain.BoardAttachVO;
import com.webnovel.board.domain.BoardVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service("boardService")
@Transactional(propagation=Propagation.REQUIRED)
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public List<BoardVO> boardList() {
		List<BoardVO> boardlist = boardDAO.selectList();
		return boardlist;
	}
	
	@Override
	public List<BoardVO> myBoardList(String id) {
		List<BoardVO> myBoardList = boardDAO.selectMyBoardList(id);
		return myBoardList;
	}
	
	@Override
	public List<BoardVO> genreMainList(String genre) {
		List<BoardVO> genreMainList = boardDAO.selectGenreMainList(genre);
		return genreMainList;
	}
	
	@Override
	public List<BoardVO> articleList(int articleNO) {
		List<BoardVO> articleList = boardDAO.selectArticleList(articleNO);
		return articleList;
	}

	@Override
	public void writeboard(BoardVO boardVO) {
		log.info("register......" + boardVO);
		boardDAO.insertSelectKey(boardVO);
		if (boardVO.getAttachList() == null || boardVO.getAttachList().size() <= 0) {
			return;
		}
		// 첨부파일
		boardVO.getAttachList().forEach(attach -> {
			attach.setArticleNO(boardVO.getArticleNO());
			boardDAO.insert(attach);
		});
	}

	// main
	@Override
	public Map<String,List<BoardVO>> topList() throws Exception {
		Map<String,List<BoardVO>> topListMap=new HashMap<String,List<BoardVO>>();
		List<BoardVO> topList=boardDAO.topList("romance");
		topListMap.put("romance",topList);
		topList=boardDAO.topList("fantasy");
		topListMap.put("fantasy",topList);
		topList=boardDAO.topList("martial");
		topListMap.put("martial",topList);
		topList=boardDAO.topList("thriller");
		topListMap.put("thriller",topList);
		return topListMap;
	}

	@Override
	public List<BoardAttachVO> getAttachList(int articleNO) {
		log.info("get Attach list by articleNO" + articleNO);
		return boardDAO.findByArticleNO(articleNO);
	}

}
