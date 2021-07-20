<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${contextPath}/resources/css/main.css" rel="stylesheet" type="text/css" media="screen">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" type="text/css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<%-- <script src="${contextPath}/resources/jquery/jquery-1.6.2.min.js" type="text/javascript"></script> --%>
<title><tiles:insertAttribute name="title" /></title>
</head>
<body>
	<div id="outer_wrap">
		<div id="wrap">
			<header>
				<tiles:insertAttribute name="header" />
			</header>
			<div class="clear"></div>
			<menu>
				<tiles:insertAttribute name="menu" />
			</menu>
			<div class="clear"></div>
			<article>
				<tiles:insertAttribute name="body1" />
			</article>
			<div class="clear"></div>
			<article>
				<tiles:insertAttribute name="body2" />
			</article>
			<div class="clear"></div>
			<footer>
				<tiles:insertAttribute name="footer" />
			</footer>
		</div>
	</div>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js" type="text/javascript"></script>
	<script src="${contextPath}/resources/jquery/slider.js" type="text/javascript"></script>
</body>
</html>