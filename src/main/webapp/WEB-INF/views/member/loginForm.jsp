<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
	<script type="text/javascript">
		//아이디 찾기
		 $(function(){
			$('#find_id_btn').click(function(){
				location.href="member/idF_Form";
			})
		})
		
		//비밀번호 찾기
		$(function(){
			$('#pwdCK').click(function(){
				location.href='member/pwdF';
			})
		}) 
	</script>
</head>
<body>
	<h2>로그인</h2>
	
	<h2><c:out value="${error}"/></h2>
	<h2><c:out value="${logout}"/></h2>
	
	<form action="${contextPath}/login" method="post">
		<label for="id">아이디: </label> &nbsp;
		<span title="아이디 찾기" id="find_id_btn"></span>
		<input type="text" name="username" id="id"/><br>
		<br/>
		<label for="password">비밀번호: </label> &nbsp;
		<input type="password" name="password" id="password"/><br>
		<span title="비밀번호 찾기" id="find_pw_btn"></span>
		<br/>
		<input type="submit" value="로그인">&nbsp;&nbsp;
		<input type="reset" value="취소">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
   </form>
   
	<a href="${contextPath}/member/idF_Form" id="find_id_btn">아이디 찾기</a>
	<a href="${contextPath}/member/pwdF" id="find_pw_btn">비밀번호 찾기</a>
	<a href="${contextPath}/member/joinForm" id="registerBtn">회원가입</a>
</body>
</html>