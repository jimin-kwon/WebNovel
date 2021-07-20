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
			$("#aImg"+articleNO).attr("src", str);
		});
	}
</script>
<body>
	<div class="main_book">
		<div class="swiper-container" style="width: 995px; height: 200px;">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<img src="${contextPath }/resources/image/main/greatest_contest.png">
				</div>
			</div>
		</div>
	</div>
	<div class="main_book">
		<c:if test="${param.genre == 'romance'}">
			<h3>로맨스</h3>
		</c:if>
		<c:if test="${param.genre == 'fantasy'}">
			<h3>판타지</h3>
		</c:if>
		<c:if test="${param.genre == 'martial'}">
			<h3>무협</h3>
		</c:if>
		<c:if test="${param.genre == 'thriller'}">
			<h3>스릴러</h3>
		</c:if>
		
		<c:forEach var="board" items="${genreMainList}">
			<div class="book">
				<a href="${contextPath}/board/genreList?articleNO=${board.articleNO }&title=${board.title}">
					<img class="link" src="${contextPath}/resources/image/main/1px.gif">
				</a> 
				<script type="text/javascript">
					location.href="javascript:image(${board.articleNO })";
				</script>
				<img id="aImg${board.articleNO }" width="121" height="154" src="" />
				<div class="title"><c:out value="${board.title}" /></div>
			</div>
		</c:forEach>
	</div>
</body>
</html>