<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<Form action="${contextPath}/board/boardList" name="boardList" method="post" enctype="multipart/form-data" >
	<fieldset>
	<table>
	<div id="novel_image"> 
		<figure>
			<img alt="HTML5 &amp; CSS3"
				src="${contextPath}/thumbnails.do?novbel_id=${novel_id}&fileName=${novel_fileName}">
		</figure>
	</div>
	<h3><%=(String)session.getAttribute("title")%>"></h3>
	
	<tr>
	작품 정보 수정<input type="button">
	회차/공지쓰기<input type="button">	
	</tr>
	<hr>
	<tr> 회차(0)
	 <c:fotEach item="${boardList}" var="boardList">
	 	<c:out value="${boardList.list }"/>
	 </c:fotEach>
	</tr>
		
	
	</table>
	</fieldset>
</Form>



</body>
</html>