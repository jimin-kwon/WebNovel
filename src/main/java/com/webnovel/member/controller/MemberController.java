package com.webnovel.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.webnovel.member.domain.MemberVO;

public interface MemberController {
	
	public String loginForm(String error, String logout, Model model);
	
	public void logout();
	
	//회원가입
	public String joinForm();
	public String join(MemberVO memberVO);
	
	//아이디 중복체크
	public ResponseEntity<String> idCK(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//아이디 찾기
	public String idF_Form();
	public Map<String, Object> findEmail(MemberVO memberVO, Model model);
	public String idF(Map mail, Model model) throws Exception;
	
	//비밀번호 찾기
	public String pwdF();
	public String findPasswordAction(MemberVO memberVO, Model model);
	
	//회원정보수정
	public String memberUpdateView(Model model, HttpServletRequest request) throws Exception;
	public String memberUpdate(MemberVO memberVO, HttpSession session, Model model) throws Exception;
	
	// 회원 탈퇴
	public String memberDeleteView(Model model) throws Exception;
	public String memberDelete(MemberVO memberVO, HttpSession session, Model model) throws Exception;
	public boolean passChk(MemberVO memberVO) throws Exception;
	
	public String mypageMain(Model model, HttpServletRequest request);
}
