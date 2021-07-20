<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
</head>
<script>
	// 이미지 가져오기
	function image(articleNO){
		console.log(articleNO);
		$.getJSON("${contextPath }/board/getAttachList", {articleNO: articleNO}, function(arr){
			console.log(arr);
			var str = "";
			$(arr).each(function(i, attach){
				if(attach.fileType){
					var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
					str += '${contextPath }/board/display?fileName='+fileCallPath;
				}
			});
			$("#aImg"+articleNO).attr("src", str);
		});
	}
</script>
<body>  <!--페이징 처리 하기 / css /  버튼 누르면 페이지 이동  -->
	<h3>내 작품</h3>
	<table>
		<c:forEach items="${list}" var="board">
			<tr>
				<td width="10%">
					<a href="<c:url value="/board/boardDtailList" /> ">
						<script type="text/javascript">
							location.href="javascript:image(${board.articleNO })";
						</script>
						<img id="aImg${board.articleNO }" width="121" height="154" src="" />
					</a>
				</td>
				<td>
		   			<a href="<c:url value="/board/boardDtailList" /> ">
		   				<c:out value="${board.title }" />
		   			</a>
				</td>     	
				<td>
		   			<a href="<c:url value="/board/boardDtailList" /> ">
		   				<c:out value="${board.content }" />
					</a>
				</td>
				<td>
		     		<input type="button" value="작품 정보 수정" onclick="location.href='${contextPath}/board/workInfoModify'">
				</td> 
				<td>
		     		<input type="hidden" name="articleNO" value=${board.articleNO } />
					<input type="button" value="회차 쓰기" onclick="location.href='boardDtailForm'">
				</td>   	
			</tr>     
		</c:forEach>
		<tr>
			<td>
	    		<input type="button" value="새 작품 쓰기" onclick="location.href='boardNewForm'"> 
		 	</td>
		</tr>
	</table>
	<!-- <script type="text/javascript">
		
		function modify_info(num) {
			
			var form = document.createElement("form"); //<form > </form>
			
			form.setAttribute("charset", "UTF-8");
			form.setAttribute("method", "Post");  //Post 방식
			form.setAttribute("action", "${contextPath}/board/workInfoModify"); //요청 보낼 주소
			
			var params = document.getElementsByClassName(num);
			console.log("params: " , params);
			console.log("params_innerText: " , params[1].innerText);
			console.log("params[0].childNodes[0]" , params[0].childNodes[0]);
			
			console.log("params[0].childNodes[0]: " , params[0].childNodes[0].getAttribute("src"));
			
			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "fileName");
			hiddenField.setAttribute("value", params[0].childNodes[0].getAttribute("src"));
			form.appendChild(hiddenField);
			
			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "title");
			hiddenField.setAttribute("value", params[1].innerText);
			form.appendChild(hiddenField);
			
			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "content");
			hiddenField.setAttribute("value", params[2].innerText);
			
			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "articleNO");
			hiddenField.setAttribute("value", params[3].value);
			
			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "${_csrf.parameterName}");
			hiddenField.setAttribute("value", "${_csrf.token}");
			
			form.appendChild(hiddenField);
			
			document.body.appendChild(form);
			
			form.submit();
		}
		
	</script> -->
</body>
</html>