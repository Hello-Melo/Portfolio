<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/header.jsp"%>


<div class="p-5 mb-4 bg-light rounded-3">
	<div class="d-flex justify-content-center">
		<h1 class="display-5 fw-bold">로 그 아 웃</h1>
	</div>
</div>


<div class="container">
		<h2>로그아웃 페이지</h2>
			<form action="${contextPath }/logout" method="post">
				<button class="btn btn-danger">로그아웃</button>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }"> 
			</form>
</div>


<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>