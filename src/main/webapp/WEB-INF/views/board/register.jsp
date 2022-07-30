<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	
		<div class="p-5 mb-4 bg-light rounded-3">
			<div class="d-flex justify-content-center">
				<h1 class="display-5 fw-bold">관원 게시판 글쓰기</h1>
			</div>
		</div>
		
		<div class="container">
			<form  id="registerForm">
			<input type="hidden" name="category" id="category" value="${criteria.category}">
				<div class="form-group">
					<label>제목 : </label> <input type="text" class="form-control" name="title">
				</div>
				<div class="form-group">
					<label>내용 : </label>
					<textarea class="form-control" name="contents" id="contents"></textarea>
				</div>
				<div class="form-group">
					<label>작성자 : </label> <input type="text" class="form-control"	name="writer">
				</div>
				<br>
				<button type="button" class="btn btn-primary submit">등록</button>
				<button type="reset" class="btn btn-info reset">뒤로</button>
			</form>

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
		<script  src="${contextPath}/resources/js/board/register.js" ></script>
		
		<script>
			$(function() {
				let getForm = $('#registerForm');
				//목록으로 돌어가기 버튼
				$('#registerForm .reset').on('click', function(e) {
					e.preventDefault();
					//해당 태그들로 
 					getForm.append($('<input/>', {type:'hidden',name:'page',value:'${param.page}'}))
							      .append($('<input/>', {type:'hidden',name:'type',value:'${param.type}'}))
							      .append($('<input/>', {type:'hidden',name:'keyword',value:'${param.keyword}'})); 
					getForm.attr("action", "${contextPath}/list/free");
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
		$('#registerForm .submit').on('click', function(e) {
			e.preventDefault();
			getForm.attr("action", "${contextPath}/board/register");
			getForm.attr("method", "post");
			getForm.submit();
		})
	})
	</script>
		
		
<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>