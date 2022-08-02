<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/header.jsp" %>



	<div class="container">
	
		<sec:authentication property="principal.memberVO.uno" var="uno"/>
		<h2>회원 페이지</h2>
		
		<a href="${contextPath }/logout">로그아웃하러 가자</a>
		<a href="${contextPath }/sec/myPage/${uno}">마이 페이지</a>
	</div>

	

<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>