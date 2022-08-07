<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/header.jsp" %>

	<div class="p-5 mb-4 bg-light rounded-3">
		<div class="d-flex justify-content-center">
			<h1 class="display-5 fw-bold">회원 관리 게시판</h1>
			<input type="hidden" name="bno2" value="${board.bno}" id="bno2">
		</div>
	</div>

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
										<button class="btn btn-primary appro" value="승인"  name="userPass1" id="appro" data-user-id="${b.uno}">승인</button>
										<button class="btn btn-warning deni" value="거부" name="userPass2"  id="deni" data-user-id="${b.uno}">거부</button>
									</td>
								</c:when>
								<c:when test="${b.userPass == 1 }">
									<td>
										<button class="btn btn-secondary drop" value="승인" name="userPass3" id="drop" data-user-id="${b.uno}">회원 탈퇴</button>
									</td>
								</c:when>				
								<c:when test="${b.userPass == 2 }">
										<td>탈퇴 회원</td>
								</c:when>					
								<c:when test="${b.userPass == 3 }">
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
	

<script>

		
		
	$(function() {
		//get페이지로 들어갈때 코드
		$('.table a').on('click',function(e){
			e.preventDefault();
			let getUno = $(this).attr("href");
			let pageForm = $('<form></form>');
			//input 태그를 여기서 붙여주는 것. So Easy~~ bno를 붙여줘야 페이지로 이동함
			pageForm.append($('<input/>', {type:'hidden',name:'uno',value:getUno}))
							.append($('<input/>', {type:'hidden',name:'page',value:'${pageMaker.criteria.page}'}))
							.append($('<input/>', {type:'hidden',name:'type',value:'${pageMaker.criteria.type}'}))
							.append($('<input/>', {type:'hidden',name:'keyword',value:'${pageMaker.criteria.keyword}'}));
			
			pageForm.attr("action", "${contextPath}/member/get");
			pageForm.attr("method", "get");
			pageForm.appendTo('body');
			pageForm.submit();
		})
		
		//가입승인 버튼(누를시 관원 상태로 변경 및 가입 승인 상태 부여)
		$('.appro').click(function(e){
			e.preventDefault();
			let Uno = $('.table a').attr("href");
			let pageForm = $('<form></form>');
			pageForm.append($('<input/>', {type:'hidden',name:'uno',value:Uno}))
			pageForm.attr("action", "${contextPath}/member/approve");
			pageForm.attr("method", "post");
			pageForm.appendTo('body');
			pageForm.submit();
		})
		
		  // 가입거부 버튼 클릭시 요청 삭제
		  $('.deni').click(function(e){
				e.preventDefault();
				let Uno = $('.table a').attr("href");
				let pageForm = $('<form></form>');
				pageForm.append($('<input/>', {type:'hidden',name:'uno',value:Uno}))
				pageForm.attr("action", "${contextPath}/member/deni");
				pageForm.attr("method", "post");
				pageForm.appendTo('body');
				pageForm.submit();
			  
		  });
		  
		  // 회원탈퇴 버튼 클릭시 탈퇴
		  $('.drop').click(function(e){
				e.preventDefault();
				let Uno = $('.table a').attr("href");
	
				let pageForm = $('<form></form>');
				pageForm.append($('<input/>', {type:'hidden',name:'uno',value:Uno}))
				pageForm.attr("action", "${contextPath}/member/drop");
				pageForm.attr("method", "post");
				pageForm.appendTo('body');
				pageForm.submit();
			  
		  });
		  
			// 함수를 만들어서 모달창에 입력받을때만 실행되게 만듬!
			function play() {
				//이건 해당 모달창의 내용이 입력되기 전에 해당내용을 삭제 
				$('.close').on('click', function (e) {
					$('.message').find('span').remove();
					$('.titleName').find('span').remove();
				});
				//입력받은 내용을 제목과 내용으로 모달에 넣어주기!
				//append는 계속 추가(enter입력시 무한 추가) html은 대체해버림! 즉 이런 상황에선 html쓸것!
				$(".titleName").html('<span>'+obj.titleName+'</span>');
				$(".message").html('<span>'+obj.message+'</span>');
				//모달창 실행하는 코드
				$('#feedback').modal('show');
			};
			
			$('.table button').on('click', function(e) {
				e.preventDefault();
			//이것은 컨트롤러 단에서 넘겨준 result 값을 베이스로 모달창에
			// 헤더와 바디 값을 입력 후 주입해준다!
			if (obj.result.trim() != '') {
				if (obj.result == "approve") {
					obj.titleName = "회원 가입 승인";
					obj.message = "${bno}번 회원님의 가입을 승인하였습니다.";
					play() 
				} else if (obj.result == "deni") {
					obj.titleName = "회원 가입 거부";
					obj.message = "${bno}번 회원님의 가입을 거부하였습니다.";
					play() 
				} else if (obj.result == "drop") {
					obj.titleName = "회원 탈퇴";
					obj.message = "${bno}번 회원님이 탈퇴하셨습니다.";
					play() 
				}
			}
		})

	})
</script>							


<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>