<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/header.jsp" %>

	<div class="p-5 mb-4 bg-light rounded-3">
		<div class="d-flex justify-content-center">
			<h1 class="display-5 fw-bold"><spring:message code="board.memberPage" /></h1>
			<input type="hidden" name="bno2" value="${board.bno}" id="bno2">
			  <input type="hidden" name="page" value="${pageMaker.criteria.page}" id="page">
		</div>
	</div>

		<!--  검색창  -->
		<div class="container d-flex justify-content-end">
			<div class="searchArea ">
				<form  id="searchForm">
					<select name="type" id="type">
						<option value="">=====</option>
						<option value="N" ${pageMaker.criteria.type eq 'N' ? 'selected' : '' }>이름</option>
						<option value="E" ${pageMaker.criteria.type eq 'E' ? 'selected' : '' }>이메일</option>
					</select>
					<input type="search" name="keyword" value="${pageMaker.criteria.keyword}" id="keyword">
					<input type="hidden" name="category" value="${pageMaker.criteria.category}" id="category">
					<button class="btn btn-secondary button"> <spring:message code="board.find" /></button>
				</form>
			</div>
		</div>
	<!--  검색창  종료 -->



	<div class="container">
			<h2>게시판</h2>
			<table class="table">
				<tr>
					<th>회원번호</th>
					<th>회원상태</th>
					<th>이름</th>
					<th>이메일</th>
					<th>주소</th>
					<th>생일</th>
					<th>가입일</th>
					<th>가입승인</th>
				</tr>
				<c:forEach items="${list}" var="b" varStatus="status">
				<input type="hidden" name="uno" value="${b.uno}" id="uno">
					<tr>
						<td>${b.uno}</td>
						<td>
							<c:choose>
								<c:when test="${b.userStatus == 0}">손님</c:when>
								<c:when test="${b.userStatus == 1}">관원</c:when>
								<c:when test="${b.userStatus == 2}">사범</c:when>
								<c:when test="${b.userStatus == 3}">관장</c:when>
							</c:choose>
						</td>
						<td><a href="${b.uno}" class="get"> ${b.userName}</a></td>
						<td>${b.userEmail }</td>
						<td>${b.userAddr} ${b.userAddrD}</td>
						<td>${b.userBirth}</td>
						<td>
							<fmt:parseDate var="regDate" value="${b.regDate}"	pattern="yyyy-MM-dd'T'" />
							<fmt:formatDate value="${regDate}" pattern="yyyy-MM-dd" />
						 </td>
							<c:choose>
								<c:when test="${b.userPass == 0 }">
									<td>
										<button class="btn btn-primary appro" value="승인"  name="appro"  data-userid="${b.uno}">승인</button>
										<button class="btn btn-warning deni" value="거부" name="deni"   data-userid="${b.uno}">거부</button>
									</td>
								</c:when>
								<c:when test="${b.userPass == 1 }">
									<td>
										<button class="btn btn-secondary drop" value="탈퇴" name="drop"  data-userid="${b.uno}">회원 탈퇴</button>
									</td>
								</c:when>				
								<c:when test="${b.userPass == 3 }">
										<td>탈퇴 회원</td>
								</c:when>					
								<c:when test="${b.userPass == 2 }">
										<td>승인 거절 회원</td>
								</c:when>
							</c:choose>
					</tr>
				</c:forEach>
				<c:if test="${empty list}">
					<tr>
						<td colspan="5">회원이 존재하지 않습니다.</td>
					</tr>
				</c:if>
			</table>
	</div>
	
	
	
		<%@ include file="/WEB-INF/views/common/pagenationMember.jsp" %>
	
		<!-- 모달 -->
		<%@ include file="/WEB-INF/views/common/modalMember.jsp" %>
		
		<!-- 모달 -->
		<%@ include file="/WEB-INF/views/common/modal.jsp" %>

<script>
	console.log(obj);
		
		
	$(function() {
		//get페이지로 들어갈때 코드
		$('.table a').on('click',function(e){
			e.preventDefault();
			let getUno = $(this).attr("href");
			let pageForm = $('<form></form>');
			//input 태그를 여기서 붙여주는 것. So Easy~~ uno를 붙여줘야 페이지로 이동함
			pageForm.append($('<input/>', {type:'hidden',name:'uno',value:getUno}))
							.append($('<input/>', {type:'hidden',name:'page',value:'${pageMaker.criteria.page}'}))
							.append($('<input/>', {type:'hidden',name:'type',value:'${pageMaker.criteria.type}'}))
							.append($('<input/>', {type:'hidden',name:'keyword',value:'${pageMaker.criteria.keyword}'}));
			
			pageForm.attr("action", "${contextPath}/sec/get");
			pageForm.attr("method", "get");
			pageForm.appendTo('body');
			pageForm.submit();
		})
		
		//가입승인 버튼(누를시 관원 상태로 변경 및 가입 승인 상태 부여)
		$('.appro').click(function(e){
			e.preventDefault();
			
			if(regList() == true){
			let Uno = $(this).data("userid");
			let pageForm = $('<form></form>');
			pageForm.append($('<input/>', {type:'hidden',name:'uno',value:Uno}))
			pageForm.attr("action", "${contextPath}/member/approve");
			pageForm.attr("method", "post");
			pageForm.appendTo('body');
			pageForm.submit();
			}
		})
		
		  // 가입거부 버튼 클릭시 요청 삭제
		  $('.deni').click(function(e){
				e.preventDefault();
				if(deniList() == true){
				let Uno = $(this).data("userid");
				let pageForm = $('<form></form>');
				pageForm.append($('<input/>', {type:'hidden',name:'uno',value:Uno}))
				pageForm.attr("action", "${contextPath}/member/deni");
				pageForm.attr("method", "post");
				pageForm.appendTo('body');
				pageForm.submit();
				}
		  });
		  
		  // 회원탈퇴 버튼 클릭시 탈퇴
		  $('.drop').click(function(e){
				e.preventDefault();
				let Uno = $(this).data("userid");
				
				if(dropList() == true){
				let pageForm = $('<form></form>');
				pageForm.append($('<input/>', {type:'hidden',name:'uno',value:Uno}))
				pageForm.attr("action", "${contextPath}/member/drop");
				pageForm.attr("method", "post");
				pageForm.appendTo('body');
				pageForm.submit();
				}
		  });
		  
		  $('#searchForm .button').on('click', function(e) {
				e.preventDefault();
				// 각각 아이디로 지역 변수 선언
				let option = $('#type').val();
				let keyword = $('#keyword').val();
				
				// if문(return 반드시 설정), 그리고 필드 객체로 선언한 obj의 항목들입력
				// 그리고 마지막에 play 함수로 입력한 값들을 모달창에 주입!!!!
				if(option==""){
					obj.titleName = "경고";
					obj.message = "검색조건을 입력하세요.";
					play()
					return;
				};
				//검색조건이 잇어도, 검색창에 값이 없으면 뜨는 코드!
				if(keyword.trim()==""){
					obj.titleName = "경고";
					obj.message = "검색어를 입력하세요.";
					play()
					return;
				};
				//if문이 둘다 false일때 그냥 검색 실행되는 코드!
				$('#searchForm').attr('action','${contextPath}/member/list/${pageMaker.criteria.category}')
				$('#searchForm').submit();
			});
		  
		  
	})
	
	function regList() {
		 if (confirm("정말 등록하시겠습니까??") == true){    //확인
		     return true;
		 }else{   //취소
		     return false;
		 }
	}	
	
	function deniList() {
		 if (confirm("정말 거부하시겠습니까??") == true){    //확인
		     return true;
		 }else{   //취소
		     return false;
		 }
	}
	
	function dropList() {
		 if (confirm("정말 탈퇴처리 하시겠습니까??") == true){    //확인
		     return true;
		 }else{   //취소
		     return false;
		 }
	}
	
	
	
	
	
</script>							


<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>