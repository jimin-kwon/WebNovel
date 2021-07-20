package com.webnovel.board.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("boardAttachVO")
public class BoardAttachVO {

  private String uuid;
  private String uploadPath;
  private String fileName;
  private boolean fileType;
  
  private int articleNO;
  
}
