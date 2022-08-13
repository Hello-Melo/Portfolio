<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
	<link rel="stylesheet"  href="${contextPath}/resources/css/mypage.css">

	<div class="p-5 mb-4 bg-light rounded-3">
		<div class="d-flex justify-content-center">
			<h1 class="display-5 fw-bold">회원 정보</h1>
		</div>
	</div>


    <div class="mypage_wrap">
       <div class="profile_pic">프로필 사진</div>
      		 <button class="pic_modify">프로필 변경</button>
        <div class="personal_info">
            <div class="title"  >개인 정보</div>
	            <p class="name">회원번호</p>
	          	  <input type="text" value="${member.uno}" readonly>
	            <p class="gender">이름</p>
	           	 <input type="text" value="${member.userName}" readonly>
	            <p class="gender">성별</p>
	           	 <input type="text" value="${member.userGender}" readonly>
	            <p class="email">이메일</p>
	           	 <input type="text" value="${member.userEmail}" readonly>
	            <p class="phone_num">연락처</p>
	           	 <input type="text" value="${member.userPhone}" readonly>
	            <p class="adress">주소</p>
	            	<input type="text" value="${member.userAddr} ${member.userAddrD}" readonly>
	             <p class="gender">가입일</p>
	             	<fmt:parseDate var="regDate" value="${member.regDate}" 	pattern="yyyy-MM-dd'T'HH:mm:ss" type="both" />
	           	 <input type="text" value="<fmt:formatDate	value="${regDate}" pattern="yyyy년 MM월 dd일"/>" readonly>	
	            <div class="lower_button clearfix">
	                <div class="modify"><button>수정하기</button></div>
	                <div class="back_to_list"><button>목록으로</button></div>
	            </div>
        </div>
    </div>

<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>