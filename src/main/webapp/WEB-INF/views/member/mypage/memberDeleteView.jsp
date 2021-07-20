<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
</head>
<script type="text/javascript">
var csrfHeaderName ="${_csrf.headerName}"; 
var csrfTokenValue="${_csrf.token}";

	/* $(document).ready(function(){
		// 취소
		$(".cencle").on("click", function(){
			
			location.href = "/";
					    
		}) */
		
	$(document).ready(function() {
		$("#submit").click( function(){
			
			var password = $("")
			
			if($("#password").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#password").focus();
				return false;
			}
			$.ajax({
				url : "/member/passChk",
				type : "POST",
				dataType : "json",
				data : $("#delForm").serializeArray(),
				success: function(data){
					
					if(data == true){
						if(confirm("회원탈퇴하시겠습니까?")){
							$("#delForm").submit();
						
					}else{alert("패스워드가 틀렸습니다.");
					return;
						
						}
						
					}
				}
			})
			
		});
		
			
		
	})
</script>
<body>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<h2>회원탈퇴</h2>
	
	<div>
	
	<ul>
	<li>탈퇴를 하실 경우 회원님의 모든 정보가 삭제 되오니 신중하게 결정하셔서 신청해 주세요.</li>
	<li>탈퇴하신 계정의 아이디는 5일동안 동일한 ID로 가입이 불가능 합니다.</li>
	<li>잔여 포인트는 탈퇴와 함께 삭제되며, 환불되지 않습니다.</li>
	<li>사용하지 않은 쿠폰이 있는 경우, 사용하신 후 탈퇴해 주세요.</li>
	
	</ul>
	</div>
	
	<div>
	<ol>
  <li>회원탈퇴 신청 즉시 회원전용 서비스의 이용이 불가능합니다.</li>
  <li>회원탈퇴 이후에는 게시물 편집, 삭제가 불가능하므로, 게시물을 편집하거나 삭제하기 바라시는 경우 게시물 편집/삭제 후 회원탈퇴를 해주시기 바랍니다.</li>

</ol>
<br>
<br>
    
	
	
	</div>
	
	
			<form id="remove" name="remove" role="form" action="${contextPath}/member/memberDelete" onsubmit="return removeValue();" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				
			<div class="container">
				<div>
					<label for="id">아이디 : </label> 
					<input type="text" id="id" name="id" value="${memberInfo.id}" readonly="readonly"/>
				</div>
				
				<br/>
				
					<label for="password">비밀번호 : </label>
					<input type="password" id="password" name="password" placeholder="입력해주세요" />
				
				</div>	
			</form>
			
			<br>
			<br>
				
			<div id="allBtn">
				<input class="btn" type="submit" value="회원탈퇴" /> 
				<input class="btn" type="button" onclick="history.go(-1)" value="취소">
			</div>
			<div>
				<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
			</div>
	
</body>
	
</html>