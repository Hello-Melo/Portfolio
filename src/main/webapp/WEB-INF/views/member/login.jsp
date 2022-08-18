<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
	<link rel="stylesheet"  href="${contextPath}/resources/css/login.css">

<div class="p-5 mb-4 bg-light rounded-3">
	<div class="d-flex justify-content-center">
		<h1 class="display-5 fw-bold"><spring:message code="board.login" /></h1>
	</div>
</div>

 <div class="container">
		<div id="logreg-forms">
			<form class="form-signin" action="${contextPath}/member/login" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }"> 
				<h1 class="h3 mb-3 font-weight-normal" style="text-align: center">
					LOGIN</h1>
								
				<input type="email" name="loginEmail" id="loginEmail" class="form-control" placeholder="Email address"  autofocus="" value="">
				<input	type="password" name="loginPw" id="loginPw" class="form-control" placeholder="Password"  value="">
				<span class="d-flex justify-content-center">
					<button class="btn btn-success btn-block" type="submit">
						<i class="fas fa-sign-in-alt"></i> Login
					</button>
				</span>
				<div class="d-flex justify-content-between">
				<span><input type="checkbox" name="remember-me">E-Mail 기억하기</span><br>
				</div>
				<hr>
				<!-- <p>Don't have an account!</p>  -->
				<div>
					<c:if test="${not empty errorMessage}">
							<p> Your login attempt was not successful due to <br></p>
						<p style="color:red;">	${ errorMessage}</p>
					</c:if>
				</div>
			</form>
		
		
			<br>
		
		</div>
</div>




<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>