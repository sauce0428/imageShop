<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Shop</title>
<!--  
<script type="text/javascript" src="/js/test.js"></script>
<link rel="stylesheet" href="/css/style.css">
-->
<link rel="stylesheet" href="/css/home.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />
	<div align="center" class="home">
		<h1>
			<spring:message code="common.homeWelcome" />
		</h1>
		<P>${serverTime}</P>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<!-- 별 생성 스크립트 -->
	<script>
		const starsCount = 300; // 별 수 증가
		for (let i = 0; i < starsCount; i++) {
			const star = document.createElement("div");
			star.className = "star";
			star.style.top = Math.random() * window.innerHeight + "px";
			star.style.left = Math.random() * window.innerWidth + "px";
			star.style.width = star.style.height = (Math.random() * 2 + 1)
					+ "px";
			star.style.animationDuration = (Math.random() * 3 + 2) + "s";
			star.style.animationDelay = Math.random() * 5 + "s";
			document.body.appendChild(star);
		}

	</script>
	<div class="star"
		style="top: 10%; left: 15%; width: 2px; height: 2px; --duration: 3s; --delay: 0s;"></div>
	<div class="star"
		style="top: 30%; left: 80%; width: 3px; height: 3px; --duration: 4s; --delay: 1.5s;"></div>
	<div class="star"
		style="top: 50%; left: 40%; width: 2px; height: 2px; --duration: 2s; --delay: 0.5s;"></div>
	<div class="star"
		style="top: 70%; left: 10%; width: 1px; height: 1px; --duration: 5s; --delay: 2s;"></div>
	<div class="star"
		style="top: 20%; left: 60%; width: 2px; height: 2px; --duration: 3.5s; --delay: 3s;"></div>
</body>
</html>