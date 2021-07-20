<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
</head>
	<script type="text/javascript">
		function updatePassword(){
			if(document.findform.pwd.value==""){
				alert("비밀번호를 입력해주세요.");
				document.findform.pwd.focus();
			} else if(document.findform.pwd.value != document.findform.confirmpwd.value){
				alert("비밀번호가 일치하지 않습니다.");
				document.findform.confirmpwd.focus();
			} else {
				document.findform.action="update_password";
				document.findform.submit();
			}
		}
	</script>
<body>
	<h2>비밀번호 찾기</h2>
	<form method="post" class="form-signin" action="pwdF" name="findform">
		<div class="form-label-group">
			아이디 : <input type="text" id="id" name="id" placeholder="입력해주세요" /> <label for="id"></label>
		</div>

		<div class="form-label-group">
			이름 :<input type="text" id="name" name="name" placeholder="입력해주세요" /> <label for="name"></label>
		</div>
		
		<div class="form-label-group">
			메일 :<input type="text" id="mail1" name="mail1" placeholder="입력해주세요" /> @ 
				<select name="mail2" id="mail2">
					<option>naver.com</option>
					<option>daum.net</option>
					<option>gmail.com</option>
					<option>nate.com</option>
				</select>
				<label for="mail1"></label>
		</div>

		<!-- 정보가 일치하지 않을 때-->
		<c:if test="${check == 1}">
			<script>
				opener.document.findform.id.value = "";
				opener.document.findform.name.value = "";
			</script>
			<label>일치하는 정보가 존재하지 않습니다.</label>
		</c:if>

		<!-- 이름과 비밀번호가 일치하지 않을 때 -->
		<c:if test="${check == 0 }">
			<div>
				<label>비밀번호를 변경해주세요.</label>
			</div>
			<div class="form-label-group">
				<input type="hidden" id="id" name="updateid" value="${updateid }">
				<input type="password" id="password" name="password"
					class="form-control" /> 
				<label for="password">비밀번호</label>
			</div>

			<div class="form-label-group">
				<input type="password" id="confirmpassword" name="confirmpwd"
					class="form-control" /> 
				<label for="confirmpassword">비밀번호 확인</label>
			</div>

			<div class="form-label-group">
				<input class="btn btn-lg btn-secondary btn-block text-uppercase"
					type="button" value="update password" onclick="updatePassword()">
			</div>
		</c:if>
	</form>

	<input class="btn" type="submit" value="아이디 찾기" onclick="location.href='idF_Form'" /> 
	<button class="btn" type="button" onclick="history.go(-1);">뒤로가기</button>
</body>
</html>
