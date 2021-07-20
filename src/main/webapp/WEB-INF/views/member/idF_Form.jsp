<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기</title>
<script>
	var csrfHeaderName ="${_csrf.headerName}"; 
	var csrfTokenValue="${_csrf.token}";
		
	$(document).ready(function() {
		$('#findBtn').click(function(){	
			
			var mail1 = $("#mail1").val();
			var mail2 = $("#mail2 option:selected").val();
			
			if(mail1=="" || mail2=="") {
				alert("이메일을 입력해주세요.");
				return false;
			}
			
			$.ajax({
				beforeSend: function(xhr) {
	                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				url : "${contextPath}/member/findEmail",
				type : "POST",
				dataType : "json",
				data : {"mail1" : mail1
						,"mail2": mail2 },
				success: function(data){
					alert(data.code);
					alert(data.msg);
				},
				error : function(xhr,status,error) {
					//오류 발생 시 처리
				},
				complete:function(data,textStatus) {
					//작업 완료 후 처리
				}	
			});
		});
	});
</script>
</head>
<body>
	<form action="${contextPath}/member/idF" method="post" onsubmit="return false">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<h3>아이디 찾기</h3>
		<div>
			<p>
				<input type="text" name="mail1" id="mail1" maxlength="30" required >
				@
				<select name="mail2" id="mail2">
					<option>naver.com</option>
					<option>daum.net</option>
					<option>gmail.com</option>
					<option>nate.com</option>
				</select>
			</p>
			<p>
				<button type="button" id="findBtn" >아이디 찾기</button>
				<button type="button" onclick="history.go(-1);">취소</button>
			</p>
		</div>
	</form>
	
	<script type="text/javascript">
		function closethewindow(){
			self.close();
		}
	</script>
</body>
</html>