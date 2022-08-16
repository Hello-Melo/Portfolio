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
   		 <form:form modelAttribute="memberVO" method="post" id="getForm">
		        <div class="personal_info">
		            <div class="title"  >개인 정보</div>
			            <p class="name">회원번호</p>
			          	  	<input type="text" value="${memberVO.uno}"  name="uno" readonly>
			            <p class="gender">이름</p>
			           		<form:input path="userName" value="${memberVO.userName}" class="form-control" />
							<form:errors path="userName" style="color:red;" />
			            <p class="gender">성별</p>
			           	 <input type="text" value="${memberVO.userGender}" name="userGender" >
			            <p class="email">이메일</p>
			           	 	<form:input path="userEmail" value="${memberVO.userEmail}" class="form-control"/>
							<form:errors path="userEmail" style="color:red;"/>
			           	 <p class="email">비밀번호</p>
			         		<form:input path="userPw" value="${memberVO.userPw}" class="form-control" type="password" />
					 		<form:errors path="userPw" style="color:red;"/>
			            <p class="phone_num">연락처</p>
			           	 	<form:input path="userPhone" value="${memberVO.userPhone}" class="form-control"/>
							<form:errors path="userPhone" style="color:red;"/>
			            <p class="adress">주소</p>
			            	<form:input path="userAddr"  class="form-control" value="${memberVO.userAddr}" />
							<form:errors path="userAddr" style="color:red;"/>
			             <p class="adress">상세 주소</p>
			            	<input type="text" value="${memberVO.userAddrD}"  name="userAddrD">
		            	<p class="adress">생년월일</p>
			            	<input type="text" value="${memberVO.userBirth}"  name="userBirth">
			             <p class="gender">가입일</p>
			             	<fmt:parseDate var="regDate" value="${memberVO.regDate}" 	pattern="yyyy-MM-dd'T'HH:mm:ss" type="both" />
			           	 	<input type="text" value="<fmt:formatDate	value="${regDate}" pattern="yyyy년 MM월 dd일"/>" readonly>
			            <div class="lower_button clearfix">
			                <div class="modify"><button>수정하기</button></div>
			                <div class="back_to_list"><button>목록으로</button></div>
			            </div>
		        </div>
        </form:form>
    </div>

<script>

let getForm = $('#getForm');

//목록으로 돌어가기 버튼
$('#getForm .list').on('click', function(e) {
	e.preventDefault();
	//해당 태그들로 
	getForm.append($('<input/>', {type:'hidden',name:'page',value:'${param.page}'}))
			      .append($('<input/>', {type:'hidden',name:'type',value:'${param.type}'}))
			      .append($('<input/>', {type:'hidden',name:'keyword',value:'${param.keyword}'}));
	getForm.attr("action", "${contextPath}/member/list");
	getForm.attr("method", "get");
	
	//이건 키워드가 없을 경우 주소창 초기화 코드!
	let keyword = getForm.find('input[name="keyword"]').val();
	//만약 keyword가 null이라면, page input을 복사해서 getform을 비우고 page만 복사하는 코드!
	if(keyword.trim() ==  '' ){
		let pageCut = getForm.find('input[name="page"]').clone();
		getForm.empty();
		getForm.append(pageCut);
	}
	getForm.submit();
})

//해당 글의 수정 버튼
$('#getForm .modify').on('click', function(e) {
	e.preventDefault();
	getForm.append($('#uno'));
	getForm.attr("action", "${contextPath}/member/update");
	getForm.attr("method", "post");
	getForm.submit();
})

</script>

<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>