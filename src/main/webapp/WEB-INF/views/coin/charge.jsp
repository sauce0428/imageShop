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
	<div align="center">
		<h2>
			<spring:message code="coin.header.chargeCoin" />
		</h2>
		<form:form modelAttribute="chargeCoin" action="charge"
			enctype="multipart/form-data" method="post">
			<table>
				<tr>
					<td><spring:message code="coin.amount" /></td>
					<td><form:input path="amount" /></td>
					<td><font color="red"><form:errors path="amount" /></font></td>
				</tr>
			</table>
		</form:form>

		<div>
			<sec:authorize access="hasRole('ROLE_MEMBER')">
				<button type="submit" id="btnCharge">
					<spring:message code="action.charge" />
				</button>
			</sec:authorize>
			<button type="submit" id="btnList">
				<spring:message code="action.list" />
			</button>
		</div>

		<script>
			$(document).ready(function() {
				var formObj = $("#chargeCoin");

				$("#btnCharge").on("click", function() {
					formObj.submit();
				});

				$("#btnList").on("click", function() {
					self.location = "/coin/list";
				});
			});
		</script>
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

			var result = "${msg}";
			if (result === "SUCCESS") {
				alert("<spring:message code='common.processSuccess' />");
			} else if (result === "FAIL") {
				alert("삭제처리 실패");
			}
		</script>
</body>
</html>