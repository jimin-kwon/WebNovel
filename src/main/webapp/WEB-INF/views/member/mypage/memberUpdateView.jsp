<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${contextPath}/resources/css/member.css" rel="stylesheet" type="text/css">
<title>회원 정보 수정</title>
</head>
<script type="text/javascript">
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	function updateValue() {
	
		var form = document.update;
		
		if (!form.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		
		 // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
		if (form.password.value != form.pwdcheck.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
		
		if (!form.birthyy.value) {
			alert("년도를 입력하세요.");
			return false;
		}
		
		if (isNaN(form.birthyy.value)) {
			alert("년도는 숫자만 입력가능합니다.");
			return false;
		}
		
		if (form.birthmm.value == "00") {
			alert("월을 선택하세요.");
			return false;
		}
		
		if (!form.birthdd.value) {
			alert("날짜를 입력하세요.");
			return false;
		}
		
		if (isNaN(form.birthdd.value)) {
			alert("날짜는 숫자만 입력가능합니다.");
			return false;
		}
		
		if (!form.mail1.value) {
			alert("메일 주소를 입력하세요.");
			return false;
		}
		if (!form.mail2.value) {
			alert("메일 도메인을 입력하세요.");
			return false;
		}
		
		if (!form.phone.value) {
			alert("전화번호를 입력하세요.");
			return false;
		}
		
		if (isNaN(form.phone.value)) {
			alert("전화번호는 - 제외한 숫자만 입력해주세요.");
			return false;
		}
		
		if (!form.address.value) {
			alert("주소를 입력하세요.");
			return false;
		}  
		alert('회원정보가 수정되었습니다.')
		//form.action = "${contextPath}/member/mypage/memberUpdate"
		//form.submit();
	}
</script>
<body>
	<form id="update" name="update" role="form" action="${contextPath}/member/memberUpdate" onsubmit="return updateValue();" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<h2>마이페이지</h2>
			<div class ="update">
			<div>
				<label for="id">아이디</label> 
				<input type="text" id="id" name="id" value="${memberInfo.id}" readonly="readonly" />
			</div>
			
			<div>
				<label for="name">이름</label> 
				<input type="text" value="${memberInfo.name }" readonly="readonly" id="name" name="name" />
			</div>
			<div>
				<label for="password">비밀번호</label> 
				<input type="password" id="password" name="password" placeholder="입력해주세요"/>
			</div>
			<div>
				<label for="title">비밀번호 확인</label>
				<input type="password" name="pwdcheck" maxlength="100" placeholder="입력해주세요"/>
			</div>
			
			<div>
				<label for="title">생일</label>
				
					<input type="text" name="birthyy" maxlength="4" placeholder="년(4자)" size="6"> 
					<select name="birthmm">
						<option value="00">월</option>
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select>
					<input type="text" name="birthdd" maxlength="2" placeholder="일" size="4">
				
			</div>
			<div>
				<label for="title">이메일</label>
				
					<input type="text" name="mail1" maxlength="30">
					@
					<input type="text" name="mail2" maxlength="30">
						<select name="select_mail"  onChange="selectmail(this)">
								<option value="" selected>선택하세요</option>
								<option>naver.com</option>
								<option>daum.net</option>
								<option>gmail.com</option>
								<option>nate.com</option>
								<option value="1">직접입력</option>
						</select>
				
			</div>
			<div>
				<label for="title">휴대전화</label>
				<input type="text" name="phone" placeholder="입력해주세요"/>
			</div>
			<div>
				<label for="title">주소</label>
				<input type="text" size="50" name="address" placeholder="입력해주세요"/>
			</div>
			
			<div>
				<label>회원가입일자</label>
				<input class="form-control" name='regDate' 
				value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${memberInfo.regDate }"/>' readonly = "readonly" >
			</div>
			
			<div>
				<label>회원정보 수정일자</label>
				<input class="form-control" name='updateDate' 
				value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${memberInfo.updateDate }"/>' readonly = "readonly" >
			</div>



			
			<div>
			<br>
				<input type="submit" value="회원 정보 수정"/> 
				<input type="button" onclick="history.go(-1)" value="뒤로가기">
				
				
				
			</div>
			</div>
		</form>
</body>
	
</html>