<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Shop</title>
<link rel="stylesheet" href="/css/codegroup.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />
	<!-- 메인화면 작업시작 -->
	<div align="center">
		<h2>
			<spring:message code="coin.header.listPay" />
		</h2>

		<table border="1">
			<tr>
				<th align="center" width="80"><spring:message code="coin.no" /></th>
				<th align="center" width="120"><spring:message code="coin.itemName" /></th>
				<th align="center" width="120"><spring:message code="coin.payAmount" /></th>
				<th align="center" width="180"><spring:message code="coin.regdate" /></th>
			</tr>
			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td colspan="4"><spring:message code="common.listEmpty" /></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list}" var="payCoin">
						<tr>
							<td align="center">${payCoin.historyNo}</td>
							<td align="left">${payCoin.itemName}</td>
							<td align="left">${payCoin.amount}</td>
							<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${payCoin.regDate}" /></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		<!-- 메인화면 작업끝 -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />

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
</body>
</html>