<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			$(".aImg"+articleNO).attr("src", str);
		});
	}
</script>
<body>
	<div class="main_book">
		<h3>${param.title }</h3>
		<script type="text/javascript">
			location.href="javascript:image(${param.articleNO })";
		</script>
		<c:forEach var="board" items="${articleList}">
			<a href="${contextPath}/board/genreDetail?detail=${board.articleNO }">
				<div class="book" style="height: 160px; width: 995px; text-align: left;">
					<img class="aImg${param.articleNO }" width="121" height="154" src="" />
					<span><c:out value="${board.title}" /></span>
				</div>
			</a>
			<div class="clear"></div>
		</c:forEach>
	</div>
	
	<%-- <from method="POST" enctype="multipart/form-data">
		<table align="center" border="1" width="80%">
			<c:choose>
				<c:when test="${boarlist !=null }">
					<tr height="10">
						<td colspan="4">
							<p align="center">
								<b><span style="font-size: 9pt;">등록된 글이 없습니다.</span></b>
							</p>
						</td>
					</tr>
				</c:when>
				<c:when test="${boarlist !=null }">
					<c:forEach var="novel" items="${boardlist }">
						<tr align="center">
							<td width="10%"><img src="${contextPath }/upload/${boardlist.imageFileName}" /></td>
							<td>"${novelNum.title }"</td>
							<td>>작품 정보 수정 <input type="button" value="<%=request.getParameter("boardDtaliForm")%>"></td>
							<td>>회차/공지쓰기 <input type="button" value="${boardDtaliForm }"></td>
						</tr>
						<tr>
							<td>새 작품쓰기<input type="button" value="${boardNewForm}"></td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
	</from> --%>
</body>
</html>