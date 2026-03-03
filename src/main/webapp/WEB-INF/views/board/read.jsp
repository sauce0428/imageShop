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
			<spring:message code="board.header.read" />
		</h2>

		<form:form modelAttribute="board">
			<form:hidden path="boardNo" />
			<!-- 현재 페이지 번호와 페이징 크기를 숨겨진 필드 요소를 사용하여 전달한다. -->
			<input type="hidden" id="page" name="page" value="${pgrq.page}">
			<input type="hidden" id="sizePerPage" name="sizePerPage"
				value="${pgrq.sizePerPage}">
			<table>
				<tr>
					<td><spring:message code="board.title" /></td>
					<td><form:input path="title" readonly="true" /></td>
					<td><font color="red"><form:errors path="title" /></font></td>
				</tr>
				<tr>
					<td><spring:message code="board.writer" /></td>
					<td><form:input path="writer" readonly="true" /></td>
					<td><font color="red"><form:errors path="writer" /></font></td>
				</tr>
				<tr>
					<td><spring:message code="board.content" /></td>
					<td><form:textarea path="content" readonly="true" /></td>
					<td><font color="red"><form:errors path="content" /></font></td>
				</tr>
			</table>
		</form:form>

		<div>
			<!-- 사용자정보를 가져온다. -->
			<sec:authentication property="principal" var="principal" />
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<button type="submit" id="btnEdit">
					<spring:message code="action.edit" />
				</button>
				<button type="submit" id="btnRemove">
					<spring:message code="action.remove" />
				</button>
			</sec:authorize>

			<sec:authorize access="hasRole('ROLE_MEMBER')">
				<c:if test="${principal.username eq board.writer}">
					<button type="submit" id="btnEdit">
						<spring:message code="action.edit" />
					</button>
					<button type="submit" id="btnRemove">
						<spring:message code="action.remove" />
					</button>
				</c:if>
			</sec:authorize>

			<button type="submit" id="btnList">
				<spring:message code="action.list" />
			</button>
		</div>
	</div>
	
	<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal" var="pinfo" />
		</sec:authorize>

	<!-- 댓글 보기 -->
	<div class="reply_view">
		<table>
			<c:choose>
				<c:when test="${empty replyList}">
					<tr>
						<td colspan="4">여러분의 소중한 댓글을 남겨주세요.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${replyList}" var="reply">
						<tr>
							<td align="center">${reply.member.userId}</td>
							<td align="center">${reply.content}</td>
							<td align="center"><fmt:formatDate
									pattern="yyyy-MM-dd HH:mm" value="${reply.regDate}" /></td>

							<sec:authorize access="isAuthenticated()">
								<c:if test="${pinfo.username eq reply.member.userId}">
									<td>
										<form action="/reply/remove" method="post"
											style="display: inline;">
											<input type="hidden" name="replyNo" value="${reply.replyNo}">
											<input type="hidden" name="boardNo" value="${board.boardNo}">
											<button type="submit" id="btnRemove"
												onclick="return confirm('정말 삭제하시겠습니까?')">삭제</button>
										</form>
									</td>
								</c:if>
							</sec:authorize>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>

	<sec:authorize access="hasAnyRole('ROLE_MEMBER', 'ROLE_ADMIN')">
		<div class="reply_register">
			<form action="/reply/replyRegister" method="get">
				<input type="hidden" name="username" value="${pinfo.username}" /> <input
					type="hidden" name="boardNo" value="${board.boardNo}" /> <label
					for="reply_content">댓글작성</label>
				<textarea id="reply_content" name="content"></textarea>
				<button type="submit">댓글작성</button>
			</form>
		</div>
	</sec:authorize>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		$(document).ready(
				function() {
					let formObj = $("#board");

					$("#btnEdit").on(
							"click",
							function() {
								let boardNo = $("#boardNo").val();
								let page = $("#page").val();
								let sizePerPage = $("#sizePerPage").val();
								self.location = "/board/modify?page=" + page
										+ "&sizePerPage=" + sizePerPage
										+ "&boardNo=" + boardNo;
							});

					$("#btnRemove").on(
							"click",
							function() {
								let boardNo = $("#boardNo").val();
								let page = $("#page").val();
								let sizePerPage = $("#sizePerPage").val();
								self.location = "/board/remove?page=" + page
										+ "&sizePerPage=" + sizePerPage
										+ "&boardNo=" + boardNo;
							});

					$("#btnList").on(
							"click",
							function() {
								let page = $("#page").val();
								let sizePerPage = $("#sizePerPage").val();
								self.location = "/board/list?page=" + page
										+ "&sizePerPage=" + sizePerPage;
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
	</script>
</body>
</html>