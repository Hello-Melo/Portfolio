<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/header.jsp"%>

	<div class="p-5 mb-4 bg-light rounded-3">
		<div class="d-flex justify-content-center">
			<h1 class="display-5 fw-bold">글 수정하기</h1>
			<input type="hidden" name="bno2" value="${board.bno}" id="bno2">
		</div>
	</div>

	<div class="container">
			<h2>게시판</h2>
			<table class="table">
				<tr>
					<th>회원번호</th>
					<th>회원이름</th>
					<th>이메일</th>
					<th>가입일</th>
				</tr>
				<c:forEach items="${list}" var="b" varStatus="status">
					<tr>
						<td>${b.uno}</td>
						<td><a href="${b.uno}" class="get"> ${b.userName }</a></td>
						<td>${b.userEmail }</td>
						<td>
							<fmt:parseDate var="regDate" value="${b.regDate}"	pattern="yyyy-MM-dd'T'HH:mm:ss" />
							<fmt:formatDate value="${regDate}" pattern="yyyy-MM-dd" />
						 </td>
					</tr>
				</c:forEach>
				<c:if test="${empty list}">
					<tr>
						<td colspan="5">회원이 존재하지 않습니다.</td>
					</tr>
				</c:if>
			</table>
	</div>
	
	
<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>