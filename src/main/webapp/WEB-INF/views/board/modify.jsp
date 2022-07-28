<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
let bno2 = '${board.bno}';
</script>


	<div class="p-5 mb-4 bg-light rounded-3">
		<div class="d-flex justify-content-center">
			<h1 class="display-5 fw-bold">글 수정하기</h1>
			<input type="hidden" name="bno2" value="${board.bno}" id="bno2">
		</div>
	</div>

	<div class="container">
		<form action="${contextPath}/board/modify" method="post" enctype="multipart/form-data" id="modifyForm">
			<input type="hidden" name="category" value="${criteria.category}" readonly>
			<input type="hidden" name="bno" value="${board.bno}" id="bno">
			<div class="form-group">
				<label>제목 : </label> <input type="text" class="form-control"
					name="title" value="${board.title}">
			</div>
			<div class="form-group">
				<label>내용 : </label>
				<textarea rows="10" class="form-control" name="contents">${board.contents}</textarea>
			</div>
			<div class="form-group">
				<label>작성자 : </label> <input type="text" class="form-control"	name="writer" value="${board.writer}" readonly="readonly">
			</div>
			<br>
			<button class="btn btn-primary">수정하기</button>
		</form>
		
			<!-- 등록된 파일 -->
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
		  					</div> <!-- panel body -->
		  				</div> <!-- panel end-->
		  			</div><!-- col end -->
		  		</div><!-- row end -->
		  		
	</div>


			<!--  ckEditor 불러오기 + 파일업로드!-->
		<script  src="${contextPath}/resources/js/CkEditor.js" ></script> 
			<!--  update Js 불러오기 -->
		<script  src="${contextPath}/resources/js/board/update.js" ></script>


<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>