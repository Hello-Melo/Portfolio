<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
<link rel="stylesheet"  href="${contextPath}/resources/css/mypage.css">


<div class="p-5 mb-4 bg-light rounded-3">
	<div class="d-flex justify-content-center">
		<h1 class="display-5 fw-bold"><spring:message code="board.join" /></h1>
	</div>
</div>

<section class="bg-light22">
	<div class="container py-2">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
			 <form:form id="joinForm" method="post" modelAttribute="memberVO" class="validation-form"> 
			<%-- <form class="validation-form" novalidate id="joinForm" action="${contextPath}/member/register" method="post">--%>
					
				
					<div class="col-md-6 mb-3">
						<label for="name">이름</label> 
							<form:input path="userName" placeholder="이름을 입력해주세요" class="form-control" />
							<form:errors path="userName" style="color:red;" />
					</div>
				
					<div class="col-md-6 mb-3">
							<label for="password">비밀번호</label>
								<form:input path="userPw" placeholder="비밀번호를 입력해주세요" class="form-control" type="password" />
								<form:errors path="userPw" style="color:red;"/>
					</div>
					
					<div class="col-md-6 mb-3">
							<label for="password">비밀번호 확인</label>
								<form:input path="confirmPassword" placeholder="비밀번호를 확인해주세요" class="form-control" type="password"/>
								<form:errors path="confirmPassword" style="color:red;"/>
					</div>

					<div class="col-md-6 mb-3">
						<label for="email">이메일</label> 
							<form:input path="userEmail" placeholder="이메일을 입력해주세요" class="form-control"/>
							<form:errors path="userEmail" style="color:red;"/>
					</div>
					
					
					<div class="mb-3">
						<label for="email">연락처</label> 
							<form:input path="userPhone" placeholder="000-0000-0000" class="form-control"/>
							<form:errors path="userPhone" style="color:red;"/>
					</div>

					<div class="mb-3">
						<label for="address">주소</label>
							<form:input path="userAddr" placeholder="경북 구미시 봉곡동" class="form-control"/>
							<form:errors path="userAddr" style="color:red;"/>
					</div>

					<div class="mb-3">
						<label for="address2">상세주소<span class="text-muted">&nbsp;(필수
								아님)</span></label>
							 <input type="text" class="form-control" id="userAddrD" name="userAddrD"
							placeholder="상세주소">
					</div>

					<div>
						<label class="form-label mt-4">생년월일</label>
						<div class="row d-flex">
							<div class="col-sm-4">
								<span class="ps_box">
									<form:input path="birth1" placeholder="0000" class="form-control"/>
									<form:errors path="birth1" style="color:red;"/>
								</span>
							</div>
							<div class=" col-sm-4">
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
							<div class="col-sm-4">
								<span class="ps_box"> 
									<form:input path="birth3" placeholder="00" class="form-control"/>
									<form:errors path="birth3" style="color:red;"/>
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
			
					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block" type="submit">가입
						완료</button>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }"> 
			<%--	</form>--%>
			 </form:form> 
			</div>
		</div>
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
        }, false);
      });
    }, false);
  </script>

<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>