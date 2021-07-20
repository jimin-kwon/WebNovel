<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
	<style>
		table, td {
			border: 1px solid black;
		}
	</style>
<link href="${contextPath}/resources/css/member.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h2>마이페이지</h2>
	
	<div class="container">
	<table>
		<tr>
			<td id="title">아이디</td>
			<td>${memberInfo.id}</td>
		</tr>
		             
		 <tr>
			<td id="title">비밀번호</td>
			<td>${memberInfo.password}</td>
		</tr>
		        
		<tr>
			<td id="title">이름</td>
			<td>${memberInfo.name}</td>
		</tr>
		        
		<tr>
			<td id="title">성별</td>
			<td>${memberInfo.gender}</td>
		</tr>
		        
		<tr>
			<td id="title">생일</td>
			<td>
				${memberInfo.birthyy}년 
				${memberInfo.birthmm}월 
				${memberInfo.birthdd}일
			</td>
		</tr>
		        
		<tr>
			<td id="title">이메일</td>
			<td>${memberInfo.mail1}@${memberInfo.mail2}</td>
		</tr>
		        
		<tr>
			<td id="title">휴대전화</td>
			<td>${memberInfo.phone}</td>
		</tr>
		<tr>
			<td id="title">주소</td>
			<td>${memberInfo.address}</td>
		</tr>
	</table>
	</div>
	<br>
	
	<div id="allBtn">
	<input type="button" value="뒤로가기" onclick="history.go(-1)">
	<input type="button" value="회원정보 변경" onclick="location.href='memberUpdateView'"  >
	<input type="button" value="회원탈퇴" onclick="location.href='memberDeleteView'" >
	
	</div>
</body>
</html>