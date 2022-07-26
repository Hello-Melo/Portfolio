<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
	<link rel="stylesheet"  href="${contextPath}/resources/css/login.css">

<div class="p-5 mb-4 bg-light rounded-3">
	<div class="d-flex justify-content-center">
		<h1 class="display-5 fw-bold">로 그 인</h1>
	</div>
</div>

 <div class="container">
		<div id="logreg-forms">
			<form class="form-signin">
				<h1 class="h3 mb-3 font-weight-normal" style="text-align: center">
					LOGIN</h1>
								
				<input type="email" id="inputEmail" class="form-control"
					placeholder="Email address" required="" autofocus=""> <input
					type="password" id="inputPassword" class="form-control"
					placeholder="Password" required="">
				<span class="d-flex justify-content-center">
					<button class="btn btn-success btn-block" type="submit">
						<i class="fas fa-sign-in-alt"></i> Login
					</button>
				</span>
				<a href="#" id="forgot_pswd">비밀번호 찾기</a>
				<hr>
				<!-- <p>Don't have an account!</p>  -->
			
			<div class="social-login">
					<button class="btn facebook-btn social-btn" type="button">
						<span><i class="fab fa-facebook-f"></i> FaceBook 로그인</span>
					</button>
					<button class="btn google-btn social-btn" type="button">
						<span><i class="fab fa-google-plus-g"></i>Google+ 로그인</span>
					</button>
				</div>
			</form>
		
			<form action="/reset/password/" class="form-reset">
				<input type="email" id="resetEmail" class="form-control"
					placeholder="Email address" required="" autofocus="">
				<button class="btn btn-primary btn-block" type="submit">Reset
					Password</button>
				<a href="#" id="cancel_reset"><i class="fas fa-angle-left"></i>
					Back</a>
			</form>

			<br>
		
		</div>
</div>




<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>