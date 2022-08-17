<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	
		<div class="p-5 mb-4 bg-light rounded-3">
			<div class="d-flex justify-content-center">
				<h1 class="display-5 fw-bold">공지사항 작성</h1>
			</div>
		</div>
		
		<div class="container">
			<form:form id="registerForm" modelAttribute="boardVO" method="post" action="/register2">
				<input type="hidden" name="category" id="category" value="${criteria.category}">
				<div class="form-group">
					<label>제목 : </label>
					<form:input type= "text" path ="title" class="form-control" /><br>
					<form:errors path="title" class="error" style="color:red;"/>
				</div>
				<div class="form-group">
					<label>내용 : </label>
					<form:textarea  path="contents" class="form-control"  />
					<form:errors path="contents" class="error" style="color:red;"/>
				</div>
				<div class="form-group">
					<label>작성자 : </label> 
					<sec:authentication property="principal.memberVO.userName" var="name" />
					<form:input type= "text"  path ="writer" value="${name}" class="form-control"   readonly="true" />
					<form:errors path="writer"  style="color:red;"  />
				</div>
				<br>
				<button type="button" class="btn btn-primary submit">등록</button>
				<button type="reset" class="btn btn-info reset">뒤로</button>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }"> 
	</form:form>

		<div class="row my-5">
  			<div class="col-lg-12">
  				<div class="card">
  					<div class="card-header">
  						<h4>파일 첨부</h4>	
  					</div>
  					<div class="card-body">
  						<div class="form-group uploadDiv">
  							<input type="file" name="uploadFile" multiple>
  						</div>
  						<div class="uploadResult">
  							<ul class="list-group">
  							</ul>
  						</div>
  						<div class="oImg">
  						</div>
  					</div> <!-- panel body -->
  				</div> <!-- panel end-->
  			</div><!-- col end -->
  		</div><!-- row end -->

	</div><!--  container 끝 -->

		<!--  ckEditor 불러오기 + 파일업로드!-->
		<script  src="${contextPath}/resources/js/CkEditor.js" ></script> 
		<!-- register js 파일 -->
		<script  src="${contextPath}/resources/js/board/noticeRegister.js" ></script>
		
		<script>
			$(function() {
				let getForm = $('#registerForm');
				//목록으로 돌어가기 버튼
				$('#registerForm .reset').on('click', function(e) {
					e.preventDefault();
					//해당 태그들로 
					getForm.append($('<input/>', {type:'hidden',name:'page',value:'${param.page}'})) ;
							/*       .append($('<input/>', {type:'hidden',name:'type',value:'${param.type}'}))
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
					}*/
					getForm.submit();
				})
				
				//글 등록 버튼
		$('#registerForm .submit').on('click', function(e) {
			e.preventDefault();
			
			if(regList() == true){
			getForm.attr("action", "${contextPath}/register2");
			getForm.attr("method", "post");
			getForm.submit();
			}
		})
	})
	
	
		function regList() {
		 if (confirm("정말 등록하시겠습니까??") == true){    //확인
		     return true;
		 }else{   //취소
		     return false;
		 }
	}	
	</script>
		
<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>