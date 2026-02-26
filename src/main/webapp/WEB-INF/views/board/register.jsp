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
<link rel="stylesheet" href="/css/user.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />
	<div align="center">
		<h2>
			<spring:message code="board.header.register" />
		</h2>
		<form:form modelAttribute="board" action="/board/register"
			method="post">
			<table>
				<tr>
					<td><spring:message code="board.title" /></td>
					<td><form:input path="title" /></td>
					<td><font color="red"><form:errors path="title" /></font></td>
				</tr>
				<tr>
					<td><spring:message code="board.writer" /></td>
					<td><form:input path="writer" readonly="true" /></td>
					<td><font color="red"><form:errors path="writer" /></font></td>
				</tr>
				<tr>
					<td><spring:message code="board.content" /></td>
					<td><form:textarea path="content" /></td>
					<td><font color="red"><form:errors path="content" /></font></td>
				</tr>
			</table>
		</form:form>

		<div>
			<sec:authorize access="isAuthenticated()">
			<button type="submit" id="btnRegister">
				<spring:message code="action.register" />
			</button>
			</sec:authorize>
				<button type="submit" id="btnList">
					<spring:message code="action.list" />
				</button>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		<!-- $(document).ready(function() : html 코드가 document로 객체가 완료 -->
		$(document).ready(function() {
			<!-- form 객체찾기  -->
			let formObj = $("#board");
			<!-- $("#btnRegister").on("click", function() : 등록버튼을 클릭할때 작동하는 핸들러정의 -->
			$("#btnRegister").on("click", function() {
				<!-- action="/codedetail/register" method="get" 서버로 전송 -->
				formObj.submit();
			});
			<!-- $("#btnList").on("click", function() { : 목록버튼을 클릭할때 작동하는 핸들러정의 -->
			$("#btnList").on("click", function() {
				<!-- 서버에 페이지요청 http://localhost:8080/codedetail/list -->
				self.location = "/board/list";
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