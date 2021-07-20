<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("#loginBtn").click(function(){
			location.href='member/loginForm';
		})
	})
</script>
</head>
<body>
			<h3>아이디 찾기 검색결과</h3>
			
			<P>The time on the server is ${serverTime}.</P>
	
	<a href="${contextPath}/main/main">main</a>
			
			<%-- <div>
				<h5>
					${ id }
				</h5>
				<p>
					<button type="button" id=loginBtn >로그인</button>
					<button type="button" onclick="history.go(-1);">취소</button>
				</p>
			</div> --%>
		
</body>
</html>