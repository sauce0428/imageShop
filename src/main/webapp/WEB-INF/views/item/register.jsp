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
			<spring:message code="item.header.register" />
		</h2>
		<form:form modelAttribute="item" action="register" enctype="multipart/form-data" method="post">
			<table>
				<tr>
					<td><spring:message code="item.itemName" /></td>
					<td><form:input path="itemName" /></td>
					<td><font color="red"><form:errors path="itemName" /></font></td>
				</tr>
				<tr>
					<td><spring:message code="item.itemPrice" /></td>
					<td><form:input path="price" />&nbsp;원</td>
					<td><font color="red"><form:errors path="price" /></font></td>
				</tr>
				<tr>
					<td><spring:message code="item.itemFile" /></td>
					<td><input type="file" name="picture" /></td>
					<td></td>
				</tr>
				<tr>
					<td><spring:message code="item.itemPreviewFile" /></td>
					<td><input type="file" name="preview" /></td>
					<td></td>
				</tr>
				<tr>
					<td><spring:message code="item.itemDescription" /></td>
					<td><form:textarea path="description" /></td>
					<td><form:errors path="description" /></td>
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
		
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
		
		<script>
			$(document).ready(function() {
				var formObj = $("#item");
				$("#btnRegister").on("click", function() {
					formObj.submit();
				});
				$("#btnList").on("click", function() {
					self.location = "/item/list";
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