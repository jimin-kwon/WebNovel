<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입창</title>
</head>
<body>
	<script type="text/javascript">
		var csrfHeaderName ="${_csrf.headerName}"; 
		var csrfTokenValue="${_csrf.token}";

	 	function checkValue() {

			var form = document.join;

			if (!form._id.value) {
				alert("아이디를 입력하세요.");
				return false;
			}

			if (form.idDuplication.value == "idUncheck") {
				alert("아이디 중복체크를 해주세요.");
				return false;
			}

			if (!form.password.value) {
				alert("비밀번호를 입력하세요.");
				return false;
			}

			// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
			if (form.password.value != form.pwdcheck.value) {
				alert("비밀번호를 동일하게 입력하세요.");
				return false;
			}

			if (!form.name.value) {
				alert("이름을 입력하세요.");
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
			form.action = "${contextPath}/member/join"
		    form.submit();
		} 

		function fn_idCK() {
			var _id = $("#_id").val();
			if (_id == '') {
				alert("ID를 입력하세요");
				return;
			}
			$.ajax({
				beforeSend: function(xhr) {
	                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				type : "post",
				url : "${contextPath}/member/idCK",
				dataType : "text",
				data : { id : _id },
				success : function(data, textStatus) {
					if (data == 'false') {
						alert("사용할 수 있는 ID입니다.");
						$('#btnidCK').prop("disabled", true);
						$('#_id').prop("disabled", true);
						$('#idDuplication').val("idCheck");
						$('#id').val(_id);
					} else {
						alert("사용할 수 없는 ID입니다.");
					}
				},
				error : function(data, textStatus) {
					alert("에러가 발생했습니다.");
				},
				complete : function(data, textStatus) {
				}
			}); 
		}
	</script>
<body>
	<br>
	<br>
	<b><font size="6" color="gray">회원가입</font></b>
	<br>
	<br>
	<br>

	<form role="form" name="join" action="javascript:checkValue()" method="post" >
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<table>
			<tr>
				<td id="title">아이디</td>
				<td>
					<input type="text" name="_id" id="_id" maxlength="50" >
					<input type="hidden" name="idDuplication"  id="idDuplication" value="idUncheck"> 
					<input type="hidden" name="id"  id="id" > 
					<input type="button" id="btnidCK" value="중복확인" onclick="fn_idCK()">
				</td>
			</tr>
			<tr>
				<td id="title">비밀번호</td>
				<td><input type="password" name="password" id="password" maxlength="100"></td>
			</tr>
			<tr>
				<td id="title">비밀번호 확인</td>
				<td><input type="password" name="pwdcheck" maxlength="100"></td>
			</tr>
			<tr>
				<td id="title">이름</td>
				<td><input type="text" name="name" maxlength="30"></td>
			</tr>
			<tr>
				<td id="title">성별</td>
				<td>
					<input type="radio" name="gender" value="남" checked>남
					<input type="radio" name="gender" value="여">여
				</td>
			</tr>
			<tr>
				<td id="title">생일</td>
				<td>
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
				</td>
			</tr>
			<tr>
				<td id="title">이메일</td>
				<td>
					<input type="text" name="mail1" maxlength="30">@
					<select name="mail2">
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
						<option>nate.com</option>
					</select>
				</td>
			</tr>
			<tr>
				<td id="title">휴대전화</td>
				<td><input type="text" name="phone" /></td>
			</tr>
			<tr>
				<td id="title">주소</td>
				<td><input type="text" size="50" name="address" /></td>
			</tr>
		</table>
		<br> 
		<input type="submit" value="회원가입" > 
		<input type="button" value="취소" onClick="history.go(-1)" >
		
	</form>
</body>
</html>






