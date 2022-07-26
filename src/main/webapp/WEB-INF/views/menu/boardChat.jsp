<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/header.jsp"%>

<div class="p-5 mb-4 bg-light rounded-3">
	<div class="d-flex justify-content-center">
		<h1 class="display-5 fw-bold">채팅 상담</h1>
	</div>
</div>

<div class="container" style="margin-top: 50px; margin-bottom: 100px;">
	<h4>궁금한 점을 실시간으로 물어보세요</h4>

	<iframe src="https://service.dongledongle.com/killtolove"
		frameborder="0" width="100%" height="600px"></iframe>
	<input type="submit" id="btnBack" value="뒤로가기" onClick="history.back()" class="btn btn-primary">
	<input type="button" id="btnJoin" value="회원가입"	onclick="location.href='../UsersJoin/index.jsp'" class="btn btn-secondary">
</div>


<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>