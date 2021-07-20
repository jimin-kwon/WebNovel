<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
</head>
<body>
	<div id="logo">
		<a href="${contextPath}/main/main">
			<h2>웹소설 메인</h2>
		</a>
	</div>
	
	<div id="head_link">
		<ul>
			<c:choose>
				<c:when test="${isLogOn==true and auth=='ROLE_MEMBER' or auth=='ROLE_ADMIN' }">
					<li>
						<form name="logout" action="${contextPath}/member/logout" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<a href="javascript:logout();">로그아웃</a>
						</form>
					</li>
					<li><a href="${contextPath}/member/mypage/mypageMain">마이페이지</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${contextPath}/member/loginForm">로그인</a></li>
					<li><a href="${contextPath}/member/joinForm">회원가입</a></li>
				</c:otherwise>
			</c:choose>
			<c:if test="${isLogOn==true and auth=='ROLE_ADMIN' }">
					<li class="no_line"><a href="${contextPath}/admin/adminMain">관리자</a></li>
			</c:if>
		</ul>
	</div>
	<div id="search">
		<form action="#">
			<input name="searchWord" class="main_input" type="text">
			<input type="submit" class="btn1" value="검색">
		</form>
	</div>
	<script>
		function logout() {
			var f = document.logout;
			f.action = "${contextPath}/member/logout"
			f.submit();
		};
	</script>
</body>
</html>