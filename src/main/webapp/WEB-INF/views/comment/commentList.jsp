<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
</head>
<body>
	<div class="commentBoard">
	<div class="boardTitle">댓글</div>
	<div class="commentBoardWrite">
		<textarea id="commentContent" placeholder="댓글을 작성하세요" maxlength="150"></textarea>
	</div>
	<button id="btnInsert">작성</button>
</div>
</body>
</html>