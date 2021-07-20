<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
</head>
<body>
	<nav>
		<c:choose>
			<c:when test="${menu=='admin' }">
				<ul>
					<li><a href="${contextPath}/admin/adminMember">회원관리</a></li>
					<li><a href="${contextPath}/admin/adminBoard">작품관리</a></li>
					<li><a href="${contextPath}/admin/adminComment">댓글관리</a></li>
				</ul>
			</c:when>
			<c:when test="${menu=='mypage' }">
				<ul>
					<li><a href="${contextPath}/member/mypage/myInfo">나의 정보</a></li>
					<li><a href="${contextPath}/board/boardList">나의 작품</a></li>
					<li><a href="${contextPath}/member/mypage/mycomment">나의 댓글</a></li>
					<li><a href="${contextPath}/board/boardNewForm">작품 올리기</a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul>
					<li><a href="${contextPath}/board/genreMain?genre=romance">로맨스</a></li>
					<li><a href="${contextPath}/board/genreMain?genre=fantasy">판타지</a></li>
					<li><a href="${contextPath}/board/genreMain?genre=martial">무협</a></li>
					<li><a href="${contextPath}/board/genreMain?genre=thriller">스릴러</a></li>
					<li><a href="${contextPath}/board/boardList">나의 작품</a></li>
					<li><a href="${contextPath}/board/boardNewForm">작품 올리기</a></li>
				</ul>
			</c:otherwise>
		</c:choose>
	</nav>
</body>
</html>