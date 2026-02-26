<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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
			<spring:message code="user.header.list" />
		</h2>
		<a href="/user/register"><spring:message code="action.new" /></a>
		<table border="1" class="user_table">
			<tr>
				<th align="center" width="70"><spring:message code="user.no" /></th>
				<th align="center" width="70"><spring:message
						code="user.userId" /></th>
				<th align="center" width="400"><spring:message
						code="user.userPw" /></th>
				<th align="center" width="150"><spring:message
						code="user.userName" /></th>
				<th align="center" width="280"><spring:message code="user.job" /></th>
				<th align="center" width="280"><spring:message
						code="user.regdate" /></th>
			</tr>
			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td colspan="6"><spring:message code="common.listEmpty" /></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list}" var="member">
						<tr>
							<td align="center">${member.userNo}</td>
							<td align="center"><a href='/user/read?userNo=${member.userNo}'>${member.userId}</a></td>
							<td align="left">${member.userPw}</td>
							<td align="right">${member.userName}</td>
							<td align="right">${member.job}</td>
							<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${member.regDate}" /></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>

	</div>
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