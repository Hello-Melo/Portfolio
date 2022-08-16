<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
	<link rel="stylesheet"  href="${contextPath}/resources/css/mypage.css">

	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.memberVO.userName" var="userId"/>
		<sec:authentication property="principal.memberVO.userStatus" var="userStatus"/>
	</sec:authorize>

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
	            	<form id="getForm">
			            <div class="lower_button clearfix">
				                <div class="modify modi"><button>수정하기</button></div>
				                <div class=" list"><button>목록으로</button></div>
				                <input type="hidden" name="uno" value="${member.uno}" id="uno"> 
			            </div>
	                </form>
        </div>
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
$('#getForm .modi').on('click', function(e) {
	e.preventDefault();
	getForm.append($('#uno'));
	getForm.attr("action", "${contextPath}/member/update");
	getForm.attr("method", "get");
	getForm.submit();
})

</script>


<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>