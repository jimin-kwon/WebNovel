package com.webnovel.member.domain;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("memberVO")
public class MemberVO {
	
	private String id;            // 아이디
    private String password;     // 비밀번호
    private String name;        // 이름
    private String gender;        // 성별
    private String birthyy;        // 생일 - 년
    private String birthmm;        // 생일 - 월
    private String birthdd;        // 생일 - 일
    private String mail1;        // 이메일 - @ 앞부분
    private String mail2;        // 이메일 - @ 뒷부분
    private String phone;        // 전화
    private String address;        // 주소
    private boolean enabled;
    
    private Date regDate;
    private Date updateDate;
    private List<AuthVO> authList;
    
}
