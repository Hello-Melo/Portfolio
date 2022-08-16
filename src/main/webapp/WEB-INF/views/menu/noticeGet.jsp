<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/layouts/header.jsp"%>

<script  src="${contextPath}/resources/js/board/get.js" ></script>

	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.memberVO.userName" var="userId"/>
		<sec:authentication property="principal.memberVO.userStatus" var="userStatus"/>
	</sec:authorize>


		<div class="p-5 mb-4 bg-light rounded-3">
		    <div class="d-flex justify-content-center">
		      <h1 class="display-5 fw-bold">공지사항</h1>
			      
						<input type="hidden" name="page" id="page" value="${param.page}">
						<input type="hidden" name="type" id="type" value="${param.type}">
						<input type="hidden" name="keyword" id="keyword" value="${param.keyword}">
						<input type="hidden" name="bno" id="bno" value="${board.bno}">
						<input type="hidden" name="title" id="title" value="${board.title}">
						<input	type="hidden" name="writer" id="writer" value="${board.writer}">
						<input type="hidden" name="category" id="category" value="${board.category}">
						<input	type="hidden" name="regDate" id="regDate" value="${board.regDate}">
						<input	type="hidden" name="updateDate" id="updateDate" value="${board.updateDate}">
					
		     </div>
		  </div>


		<div class="container mb-5 mt-3">
			<form id="getForm">
				<div class="card">
					<div class="card-header">
						<div class="row">
							<div class="col-sm-1">${board.bno}</div>
							<div class="col-sm-11">${board.title}</div>
						</div>
					</div>
					<div class="card-body">
							<div class="fixedimg">
							<c:choose>
							<c:when test="${list[0].fileType == 'true'}">
								<img src="${contextPath}/display?fileName=${list[0].imageName}" class="card-img-top"
								style="width:400px;">
							</c:when>
							<c:otherwise>
							<img src="${contextPath}/resources/img/attach.png" class="card-img-top"
								style="width:400px;">
							</c:otherwise>
							</c:choose>
									
									${board.contents}
							</div>
					</div>
					<div class="card-footer d-flex justify-content-between">
						<div>
							<c:if test="${userId eq board.writer or userStatus eq 2 or userStatus eq 3}">
								<button class="btn btn-warning modify">수정</button>
								<button class="btn btn-info remove">삭제</button>
								<button class="btn btn-secondary list">목록</button>
							</c:if>
						</div>
						<div>
							<fmt:parseDate var="regDate" value="${board.regDate}"	 pattern="yyyy-MM-dd'T'HH:mm:ss" type="both" />
							등록일 :	<fmt:formatDate value="${regDate}" pattern="yyyy년 MM월 dd일 HH:mm" />
							<br>
							<fmt:parseDate var="updateDate" value="${board.updateDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" type="both" />
							수정일 :	<fmt:formatDate value="${updateDate}" pattern="yyyy년 MM월 dd일 HH:mm" />
							<br>
						</div>
					</div>
				</div>
			</form>
	

		
</div><!--  container 끝 -->	

<script>
	$(function() {
		
		let getForm = $('#getForm');
		
		//목록으로 돌어가기 버튼
		$('#getForm .list').on('click', function(e) {
			e.preventDefault();
			//해당 태그들로 
		/* 	getForm.append($('<input/>', {type:'hidden',name:'page',value:'${param.page}'}))
					      .append($('<input/>', {type:'hidden',name:'type',value:'${param.type}'}))
					      .append($('<input/>', {type:'hidden',name:'keyword',value:'${param.keyword}'})); */
			getForm.attr("action", "${contextPath}/notice/notice");
			getForm.attr("method", "get");
			
			/* //이건 키워드가 없을 경우 주소창 초기화 코드!
			let keyword = getForm.find('input[name="keyword"]').val();
			//만약 keyword가 null이라면, page input을 복사해서 getform을 비우고 page만 복사하는 코드!
			if(keyword.trim() ==  '' ){
				let pageCut = getForm.find('input[name="page"]').clone();
				getForm.empty();
				getForm.append(pageCut);
			} */
			getForm.submit();
		})
		
		//해당 글의 수정 버튼
		$('#getForm .modify').on('click', function(e) {
			e.preventDefault();
			getForm.append($('#bno'));
			getForm.attr("action", "${contextPath}/board/modify2");
			getForm.attr("method", "get");
			getForm.submit();
		})
		//해당 글의 삭제 버튼
		$('#getForm .remove').on('click', function(e) {
			e.preventDefault();
			getForm.append($('#bno'));
			getForm.append($('<input/>', {type:'hidden',name:'page',value:'${board.category}'}))
			getForm.append($('<input/>', {type:'hidden',name:'${_csrf.parameterName}',value:'${_csrf.token }'}));
			getForm.attr("action", "${contextPath}/board/remove2");
			getForm.attr("method", "post");
			getForm.submit();
		})
		
})
	

</script>


<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>