package com.webnovel.board.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("boardVO")
public class BoardVO {

	private int articleNO; // 글 번호 - 회차
	private int parentNO; // 부모글 번호 - 작품이 부모 글
	private String title; // 제목
	private String genre; // 장르
	private String content; // 글 내용
	private String fileName; // 이미지 파일명
	private String id; // id
	private Date writeDate; // 글 쓴 날짜
	private Date modifyDate; // 글 쓴 날짜
	
	private List<BoardAttachVO> attachList;
	
	public String getFileName() {
		try {
			if (fileName != null && fileName.length() != 0) {
				fileName = URLDecoder.decode(fileName, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return fileName;
	}

	public void setFileName(String fileName) {
		try {
			if (fileName != null && fileName.length() != 0) {
				this.fileName = URLEncoder.encode(fileName, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

}
