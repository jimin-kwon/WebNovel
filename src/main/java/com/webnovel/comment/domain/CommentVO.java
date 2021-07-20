package com.webnovel.comment.domain;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("commentVO")
public class CommentVO {
	private Integer replyNO;
	private Integer articleNO;
    private String replyer;
    private String reply;
    private Date replyDate;
    private Date reply_update_Date;
    
}
