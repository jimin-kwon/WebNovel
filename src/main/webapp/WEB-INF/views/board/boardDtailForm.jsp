<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
</head>
<body>
	
	<form name="boardForm" method="post" action="${contextPath}/board/boardList" enctype="multipart/form-data">
	<fieldset>
		<h1>새 작품 쓰기<hr></h1>
		<table>
			<tr>
				<td>작품제목 <input type="text" name="title" maxlength="20" required="required"></td>
			</tr>
			
			<tr>
				<td>표지 이미지<input name=""></td>
			</tr>
			<tr>
				<td>작품 소개 
				<textarea rows="10" cols="50" name="content"required="required"></textarea>
				</td>
			</tr>
			<tr>
				<td>필명<!-- <select>
				
				<label>필명을 입력 해주세요.
				<input type="button" value="확인" >
				</label>
				</td> -->
			</tr>
			<td colspan = "3">
			<input type="button" value="취소" onclick="location.href='boardLisr.jsp'" >
			<input type="submit" value="저장">
			<input type="button" value="저장 후 1회 쓰기">			
			</td>		
		</table>
	</fieldset>		
	</form>
</body>
</html>