package com.webnovel.member.service;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webnovel.member.dao.MemberDAO;
import com.webnovel.member.domain.MemberVO;

import lombok.Setter;

@Service("memberService")
@Transactional
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO memberDAO;
	
	// 회원가입
	@Override
	public void join(MemberVO memberVO) {
		memberDAO.join(memberVO);
	}
	
	// 아이디 중복 체크
	@Override
	public String idCK(String id) {
		return memberDAO.idCK(id);
	}

	// 아이디 찾기
	@Override
	public String idF(Map mail) throws Exception {
		return memberDAO.idF(mail);
	}
	
	//비밀번호 찾기
	@Override
	public String pwdF(MemberVO memberVO) {
		return memberDAO.pwdF(memberVO);
	}
	
	// 회원 정보
	@Override
	public MemberVO memberInfo(String id) {
		return memberDAO.memberInfo(id);
	}
	//회원정보 수정
	@Override
	public void memberUpdate(MemberVO memberVO) throws Exception {
		memberDAO.memberUpdate(memberVO);
	}

	// 회원탈퇴
	@Override
	public void memberDelete(MemberVO memberVO) throws Exception {
		//memberDAO.memberDelete(memberVO);
		try {
			memberDAO.memberDelete(memberVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 비밀번호 재확인
	@Override
	public int passChk(MemberVO memberVO) throws Exception {
		int result = memberDAO.passChk(memberVO);
		return result;
	}
	
	@Override
	public String findEmail(MemberVO memberVO) throws Exception  {
		return memberDAO.findEmail(memberVO);
	}
	

}
