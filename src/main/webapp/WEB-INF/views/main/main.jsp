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
	<!-- Swiper -->
	<div class="main_book">
		<h3>이 달의 신작</h3>
		<div class="swiper-container mySwiper" style="width: 995px; height: 200px;">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<img src="${contextPath }/resources/image/main/slider_romance1.jpg">
				</div>
				<div class="swiper-slide">
					<img src="${contextPath }/resources/image/main/slider_romance2.jpg">
				</div>
				<div class="swiper-slide">
					<img src="${contextPath }/resources/image/main/slider_fantasy.jpg">
				</div>
				<div class="swiper-slide">
					<img src="${contextPath }/resources/image/main/BackgroundFront.png">
				</div>
				<div class="swiper-slide">
					<img src="${contextPath }/resources/image/main/BackgroundBack.png">
				</div>
			</div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-pagination"></div>
		</div>
	</div>
	<div class="clear"></div>
	<div class="main_book">
		<h3>로맨스 TOP 5</h3>
		<c:forEach var="board" items="${toplist.romance}">
			<div class="book">
				<a href="${contextPath}/board/genreList?articleNO=${board.articleNO }&title=${board.title}">
					<img class="link" src="${contextPath}/resources/image/main/1px.gif">
				</a> 
				<script type="text/javascript">
					location.href="javascript:image(${board.articleNO })";
				</script>
				<img id="aImg${board.articleNO }" width="121" height="154" src="" />
				<div class="title"><c:out value="${board.title}" /></div>
				<%-- <div class="price">
					<fmt:formatNumber value="${item.goods_price}" type="number"
						var="goods_price" />${goods_price}원
				</div> --%>
			</div>
		</c:forEach>
	</div>
	<div class="clear"></div>
	<div class="main_book">
		<h3>판타지 TOP 5</h3>
		<c:forEach var="board" items="${toplist.fantasy}">
			<div class="book">
				<a href="${contextPath}/board/genreList?articleNO=${board.articleNO }&title=${board.title}">
					<img class="link" src="${contextPath}/resources/image/main/1px.gif">
				</a> 
				<script type="text/javascript">
					location.href="javascript:image(${board.articleNO })";
				</script>
				<img id="aImg${board.articleNO }" width="121" height="154" src="" />
				<div class="title"><c:out value="${board.title}" /></div>
				<%-- <div class="price">
					<fmt:formatNumber value="${item.goods_price}" type="number"
						var="goods_price" />${goods_price}원
				</div> --%>
			</div>
		</c:forEach>
	</div>
	<div class="clear"></div>
	<div class="main_book">
		<h3>무협 TOP 5</h3>
		<c:forEach var="board" items="${toplist.martial}">
			<div class="book">
				<a href="${contextPath}/board/genreList?articleNO=${board.articleNO }&title=${board.title}">
					<img class="link" src="${contextPath}/resources/image/main/1px.gif">
				</a> 
				<script type="text/javascript">
					location.href="javascript:image(${board.articleNO })";
				</script>
				<img id="aImg${board.articleNO }" width="121" height="154" src="" />
				<div class="title"><c:out value="${board.title}" /></div>
				<%-- <div class="price">
					<fmt:formatNumber value="${item.goods_price}" type="number"
						var="goods_price" />${goods_price}원
				</div> --%>
			</div>
		</c:forEach>
	</div>
	<div class="clear"></div>
	<div class="main_book">
		<h3>스릴러 TOP 5</h3>
		<c:forEach var="board" items="${toplist.thriller}">
			<div class="book">
				<a href="${contextPath}/board/genreList?articleNO=${board.articleNO }&title=${board.title}">
					<img class="link" src="${contextPath}/resources/image/main/1px.gif">
				</a> 
				<script type="text/javascript">
					location.href="javascript:image(${board.articleNO })";
				</script>
				<img id="aImg${board.articleNO }" width="121" height="154" src="" />
				<div class="title"><c:out value="${board.title}" /></div>
				<%-- <div class="price">
					<fmt:formatNumber value="${item.goods_price}" type="number"
						var="goods_price" />${goods_price}원
				</div> --%>
			</div>
		</c:forEach>
	</div>
	<div class="clear"></div>
	<%-- <div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">Board List Page</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>#번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>수정일</th>
							</tr>
						</thead>
						<c:forEach items="${list}" var="board">
							<tr>
								<td><c:out value="${board.articleNO}" /></td>
								<td><c:out value="${board.title}" /></td>
								<td><c:out value="${board.id}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.writeDate}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.modifyDate}" /></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!--  end Pagination -->
			</div>
			<!-- end panel -->
		</div>
	</div> --%>
</body>
</html>