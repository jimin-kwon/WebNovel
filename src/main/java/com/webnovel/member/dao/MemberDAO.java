package com.webnovel.member.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.webnovel.member.domain.MemberVO;

public interface MemberDAO {
	// 회원 가입
	public void join(MemberVO memberVO);

	// 아이디 중복체크
	public String idCK(String id) throws DataAccessException;

	// 아이디 찾기
	public String idF(Map mail) throws Exception;
	
	public String findEmail(MemberVO memberVO) throws Exception;

	// 비밀번호 찾기
	public String pwdF(MemberVO memberVO);

	// 회원 정보 조회
	public MemberVO memberInfo(String id);
	   
	// 회원정보 수정
	public void memberUpdate(MemberVO memberVO) throws Exception;

	// 회원 탈퇴
	public void memberDelete(MemberVO memberVO) throws Exception;

	// 비밀번호 재확인 (회원 탈퇴시 필요)
	public int passChk(MemberVO memberVO) throws Exception;
	
	// 비밀번호 변경
	public int update_pwd(MemberVO memberVO) throws Exception;
}
