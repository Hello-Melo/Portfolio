<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
	<link rel="stylesheet"  href="${contextPath}/resources/css/mypage.css">

	<div class="p-5 mb-4 bg-light rounded-3">
		<div class="d-flex justify-content-center">
			<h1 class="display-5 fw-bold">회원 정보 수정</h1>
		</div>
	</div>

    <div class="mypage_wrap">
       <div class="profile_pic">프로필 사진</div>
      		 <button class="pic_modify">프로필 변경</button>
   		 <form:form action="modify" modelAttribute="membervo">
		        <div class="personal_info">
		            <div class="title"  >개인 정보</div>
			            <p class="name">회원번호</p>
			          	  <input type="text" value="${member.uno}"  name="uno">
			            <p class="gender">이름</p>
			           	 <input type="text" value="${member.userName}"  name="userName">
			            <p class="gender">성별</p>
			           	 <input type="text" value="${member.userGender}" name="userGender" >
			            <p class="email">이메일</p>
			           	 <input type="text" value="${member.userEmail}"  name="userEmail" >
			           	 <p class="email">비밀번호</p>
			           	 <input type="text" value="${member.userPw}"  name="userPw" >
			            <p class="phone_num">연락처</p>
			           	 <input type="text" value="${member.userPhone}"  name="userPhone" >
			            <p class="adress">주소</p>
			            	<input type="text" value="${member.userAddr}" name="userAddr" >
			             <p class="adress">상세 주소</p>
			            	<input type="text" value="${member.userAddrD}"  name="userAddrD">
		            	<p class="adress">생년월일</p>
			            	<input type="text" value="${member.userBirth}"  name="userBirth">
			             <p class="gender">가입일</p>
			             	<fmt:parseDate var="regDate" value="${member.regDate}" 	pattern="yyyy-MM-dd'T'HH:mm:ss" type="both" />
			           	 <input type="text" value="<fmt:formatDate	value="${regDate}" pattern="yyyy년 MM월 dd일"/>" readonly>	
			            <div class="lower_button clearfix">
			                <div class="modify"><button>수정하기</button></div>
			                <div class="back_to_list"><button>목록으로</button></div>
			            </div>
		        </div>
        </form:form>
    </div>

<script>




</script>

<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>