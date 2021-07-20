package com.webnovel.member.service;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.webnovel.member.domain.MemberVO;

public interface MemberService {
	public void join(MemberVO memberVO);

	public String idF(Map mail) throws Exception;

	public String pwdF(MemberVO memberVO);

	public String idCK(String id);

	public MemberVO memberInfo(String id);

	public void memberUpdate(MemberVO memberVO) throws Exception;

	public void memberDelete(MemberVO memberVO) throws Exception;

	public int passChk(MemberVO memberVO) throws Exception;
	
	public String findEmail(MemberVO memberVO) throws Exception;
}
