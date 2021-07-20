package com.webnovel.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.webnovel.board.domain.AttachFileDTO;
import com.webnovel.board.domain.BoardVO;

public interface BoardController {

	public String genreMain(String genre, Model model, HttpServletRequest request);
	
	public String genreList(int articleNO, Model model, HttpServletRequest request);
	
	public String genreDetail();
	
	public String boardForm();
	
	public String boardList(Model model, HttpServletRequest request); //보드 리스트
	
	public String boardNewForm(Model model, HttpServletRequest request); //새 글 작성
	
//	public String workInfoModify(Map map, Model model, HttpServletRequest request);//작품 정보 수정 
	
	public String workInfoModify(String title, String content, Map map, Model model, HttpServletRequest request);
	
	public String writeboard(BoardVO board, RedirectAttributes rttr); //글 쓰기
	
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile); // 파일 업로드
	
	public ResponseEntity<byte[]> getFile(String fileName); // 섬네일 데이터 전송
	
//	public ResponseEntity<Resource> downloadFile(String userAgent, String fileName); // 첨부파일 다운로드
	
	public ResponseEntity<String> deleteFile(String fileName, String type); // 첨부파일 삭제

	
	
	
}
