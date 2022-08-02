<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/header.jsp" %>



	<div class="container">
			<c:if test="${not empty member }">
			${member }
		</c:if>
	</div>

	

<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>