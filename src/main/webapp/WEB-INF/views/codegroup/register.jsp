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
	<div class="codegroup_register" align="center">
		<h2>
			<spring:message code="codegroup.header.register" />
		</h2>
		<form:form modelAttribute="codeGroup" action="/codegroup/register"
			method="post">
			<table>
				<tr>
					<!--   
					<td><label for="groupCode">코드그룹</label> </td>
					<td><input type="text" name="groupCode" id="groupCode"/></td>
					-->
					<td><spring:message code="codegroup.groupCode" /></td>
					<td><form:input path="groupCode" /></td>
					<td><font color="red"><form:errors path="groupCode" /></font></td>
				</tr>
				<tr>
					<td><spring:message code="codegroup.groupName" /></td>
					<td><form:input path="groupName" /></td>
					<td><font color="red"><form:errors path="groupName" /></font></td>
				</tr>
			</table>
		</form:form>

		<div>
			<button type="submit" id="btnRegister">
				<spring:message code="action.register" />
			</button>
			<button type="submit" id="btnList">
				<spring:message code="action.list" />
			</button>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		$(document).ready(function() {
			<!-- form 객체찾기  -->
			let formObj = $("#codeGroup");
			$("#btnRegister").on("click", function() {
				formObj.submit();
			});
			$("#btnList").on("click", function() {
				self.location = "/codegroup/list";
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