<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/header.jsp" %>

	<div class="p-5 mb-4 bg-light rounded-3">
		<div class="d-flex justify-content-center">
			<h1 class="display-5 fw-bold"><spring:message code="board.errorPage" /></h1>
			<input type="hidden" name="bno2" value="${board.bno}" id="bno2">
		</div>
	</div>
	
	<div class="container d-flex" style="margin-top : 50px; margin-bottom:20px;">
		<div style="justify-content : center;">
			<img  src="${contextPath}/resources/img/error.png">
		</div>
	</div>


		<div class="row" style="margin-bottom:150px;">
				<form action="${contextPath}" class="col text-center" >
					<button class="btn btn-warning">돌아가기</button>
				</form>
		</div>
	
<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>