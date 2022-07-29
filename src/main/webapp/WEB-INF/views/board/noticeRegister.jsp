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
			<form action="${contextPath}/register2" method="post" id="registerForm">
				 <input type="hidden" name="category" value="${criteria.category}" readonly>
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
				<button type="button" class="btn btn-primary">등록</button>
				<button type="reset" class="btn btn-info">뒤로</button>
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
		<script  src="${contextPath}/resources/js/board/noticeRegister.js" ></script>
		
<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>