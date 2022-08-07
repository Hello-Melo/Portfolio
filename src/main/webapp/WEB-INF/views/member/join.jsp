<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/header.jsp"%>



<div class="p-5 mb-4 bg-light rounded-3">
	<div class="d-flex justify-content-center">
		<h1 class="display-5 fw-bold">회원 가입</h1>
	</div>
</div>

<section class="bg-light22">
	<div class="container py-2">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<form class="validation-form" novalidate id="joinForm" action="${contextPath}/member/register" method="post">
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="name">이름</label> <input type="text"
								class="form-control" id="userName" name="userName" placeholder="" value="" required>
							<div class="invalid-feedback">성을 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="password">비밀번호</label> <input type="password"
								class="form-control" id="userPw" name="userPw" placeholder="" value=""
								required>
							<div class="invalid-feedback">이름을 입력해주세요.</div>
						</div>
					</div>

					<div class="mb-3">
						<label for="email">이메일</label> <input type="email"
							class="form-control" id="email" name="userEmail" placeholder="you@example.com"
							required>
						<div class="invalid-feedback">이메일을 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="email">연락처</label> <input type="text"
							class="form-control" id="userPhone" name="userPhone" placeholder="000-0000-0000"
							required>
						<div class="invalid-feedback">연락처를 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="address">주소</label> <input type="text"
							class="form-control" id="userAddr" name="userAddr" placeholder="경상북도 구미시 봉곡동"
							required>
						<div class="invalid-feedback">주소를 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="address2">상세주소<span class="text-muted">&nbsp;(필수
								아님)</span></label> <input type="text" class="form-control" id="userAddrD" name="userAddrD"
							placeholder="상세주소를 입력해주세요.">
					</div>

					<div>
						<label class="form-label mt-4">생년월일</label>
						<div class="d-flex row">
							<div class="bir_yy col-sm-4">
								<span class="ps_box"> <input type="text"
									class="form-control" id="birth1" placeholder="년(4자)" maxlength="4" name="birth1"
									required>
								</span>
							</div>
							<div class="bir_mm col-sm-4">
								<span class="ps_box focus"> <select class="form-select"
									id="birth2" name="birth2">
										<option>월</option>
										<option>01</option>
										<option>02</option>
										<option>03</option>
										<option>04</option>
										<option>05</option>
										<option>06</option>
										<option>07</option>
										<option>08</option>
										<option>09</option>
										<option>10</option>
										<option>11</option>
										<option>12</option>
								</select>
								</span>
							</div>
							<div class="bir_dd col-sm-4">
								<span class="ps_box"> <input type="text"
									class="form-control" id="birth3" placeholder="일" maxlength="2" name="birth3"
									required>
								</span>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="exampleFormControlSelect1" class="form-label mt-4">성별</label>
						<select class="form-select" id="exampleFormControlSelect1" name="userGender"
							required>
							<option value="M"  >남자</option>
							<option value="F">여자</option>
						</select>
					</div>

					<hr class="mb-4">

					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="aggrement"
							required> <label class="custom-control-label"
							for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
					</div>
					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block" type="submit">가입
						완료</button>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }"> 
				</form>
			</div>
		</div>

	
				<form action="/signup/" class="form-signup">
					<div class="social-login">
							<button class="btn facebook-btn social-btn" type="button">
								<span><i class="fab fa-facebook-f"></i> FaceBook으로 가입하기</span>
							</button>
							<button class="btn google-btn social-btn" type="button">
								<span><i class="fab fa-google-plus-g"></i>Google+로 가입하기</span>
							</button>
						</div>
				</form>
	
	</div>
</section>

<link rel="stylesheet" href="${contextPath}/resources/css/join.css">
<script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  </script>

<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>