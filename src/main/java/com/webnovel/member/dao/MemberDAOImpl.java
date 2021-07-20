package com.webnovel.member.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.webnovel.member.domain.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlsession;

	// 회원가입
	@Override
	public void join(MemberVO memberVO) throws DataAccessException {
		sqlsession.insert("mapper.member.join", memberVO);
	}
	
	// 아이디 중복체크
	@Override
	public String idCK(String id) throws DataAccessException {
		String result = sqlsession.selectOne("mapper.member.idCK",id);
		return result;
	}
		
	// 아이디 찾기
	@Override
	public String idF(Map mail) throws Exception {
		return sqlsession.selectOne("mapper.member.idF", mail);
	}

	// 비밀번호 찾기
	@Override
	public String pwdF(MemberVO memberVO) {
		System.out.println("pwd_Find");
		return sqlsession.selectOne("mapper.member.pwdF", memberVO);

	}

	// 비밀번호 변경
	@Override
	public int update_pwd(MemberVO memberVO) throws Exception {
		return sqlsession.update("mapper.member.update_pwd", memberVO);
	}
	
	// 회원 정보
	@Override
	public MemberVO memberInfo(String id) {
		MemberVO memberVO = sqlsession.selectOne("mapper.member.memberInfo", id);
		return memberVO;
	}

	// 회원정보 수정
	@Override
	public void memberUpdate(MemberVO memberVO) throws Exception {
		sqlsession.update("mapper.member.memberUpdate", memberVO);
	}

	// 회원 탈퇴
	@Override
	public void memberDelete(MemberVO memberVO) throws Exception {
		int check = sqlsession.delete("mapper.member.memberDelete", memberVO);
		System.out.println("DAO : deleteMember() "+check);	
	}
	
	// 비밀번호 재확인
	@Override
	public int passChk(MemberVO memberVO) throws Exception {
		int result = sqlsession.selectOne("mapper.member.passChk", memberVO);
		return result;
	}
	
	@Override
	public String findEmail(MemberVO memberVO) throws Exception {
		String result = sqlsession.selectOne("mapper.member.findEmail", memberVO);
		return result;
	}

}
