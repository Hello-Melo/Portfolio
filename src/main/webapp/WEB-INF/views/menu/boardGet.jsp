<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
<script  src="${pageContext.request.contextPath}/resources/js/reply/reply.js" ></script>
<script  src="${pageContext.request.contextPath}/resources/js/reply/get.js" ></script>
<script  src="${contextPath}/resources/js/board/get.js" ></script>

		<!--  아래 코드는 로그인이 되었을시에 sername을 불러와 userId에 저장한는 의미
		이 부분이 없으면 겟을 부를때 에러가 남-->
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.memberVO.userName" var="userId"/>
	</sec:authorize>

		<div class="p-5 mb-4 bg-light rounded-3">
		    <div class="d-flex justify-content-center">
		      <h1 class="display-5 fw-bold">관원 게시판</h1>
			      
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

		<div class="container">
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
								${board.contents}
							</div>
					</div>
					<div class="card-footer d-flex justify-content-between">
						<div>
						<c:if test="${userId eq board.writer">
							<button class="btn btn-warning modify">수정</button>
							<button class="btn btn-info remove">삭제</button>
						</c:if>
							<button class="btn btn-secondary list">목록</button>
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
				
			<!-- 댓글 -->
		<div class="container">
			<div class="row mt-5">
				<div class="col-lg-12">
					<div class="card card-default">
					
						<div class="card-heading">
							<i class="fa fa-comments fa-fw"></i>
							<span>댓글</span>
								<!--  댓글동록버튼-->	
								<span class="float-right">
									<sec:authorize access="isAuthenticated()">
										<button class="btn btn-primary btn-sm"  data-target="#replyForm" id="addReplyBtn">
											 댓글 달기
										</button>
									</sec:authorize>
									<sec:authorize access="Anonymous">
										로그인 필요
									</sec:authorize>
								</span>
						</div>
		
						<div class="card-body">
							<ul class="chat">
								<!--  start reply-->
								
							</ul>
						</div>
						<!--  /panel-body-->
					</div>
					<!--  /panel-->
				</div>
				<!--  /col-lg12 -->
			</div>
			<!--  /row-->
		</div>
		
		<!-- 등록된 파일 -->
		<div class="row my-5">
  			<div class="col-lg-12">
  				<div class="card">
  					<div class="card-header">
  						<h4>파일 첨부 내용</h4>	
  					</div>
  					<div class="card-body">
  						<div class="uploadResult">
  							<ul class="list-group">
  							</ul>
  						</div>
  					</div> <!-- panel body -->
  				</div> <!-- panel end-->
  			</div><!-- col end -->
  		</div><!-- row end -->
		
		<!-- 댓글 -->
		<%@ include file="/WEB-INF/views/common/modal2.jsp" %>
		<!--  댓글 종료-->
		
</div><!--  container 끝 -->	

<script>
	let userId = "${userId}";
	let bWriter = "${board.writer}" 
		
	$(function() {
		
		let getForm = $('#getForm');
		
		//목록으로 돌어가기 버튼
		$('#getForm .list').on('click', function(e) {
			e.preventDefault();
			//해당 태그들로 
			getForm.append($('<input/>', {type:'hidden',name:'page',value:'${param.page}'}))
					      .append($('<input/>', {type:'hidden',name:'type',value:'${param.type}'}))
					      .append($('<input/>', {type:'hidden',name:'keyword',value:'${param.keyword}'}));
			getForm.attr("action", "${contextPath}/list/${board.category}");
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
			getForm.append($('#bno'));
			getForm.attr("action", "board/modify");
			getForm.attr("method", "get");
			getForm.submit();
		})
		//해당 글의 삭제 버튼
		$('#getForm .remove').on('click', function(e) {
			e.preventDefault();
			getForm.append($('#bno'));
			getForm.append($('<input/>', {type:'hidden',name:'page',value:'${board.category}'}))
			getForm.attr("action", "board/remove");
			getForm.attr("method", "post");
			getForm.submit();
		})
		
		//댓글 불러오기
		$(function () {
			let bnoValue = $('input[name="bno"]').val();
			replyService.getList({bno:bnoValue, page:1}, function(list) {
					for(let reply of list){
						console.log(list);
					}
			})
		});
	})
	

</script>


<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>