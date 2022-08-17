<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
let bno2 = '${boardVO.bno}';
</script>

	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.memberVO.userName" var="userId"/>
		<sec:authentication property="principal.memberVO.userStatus" var="userStatus"/>
	</sec:authorize>

	<div class="p-5 mb-4 bg-light rounded-3">
		<div class="d-flex justify-content-center">
			<h1 class="display-5 fw-bold">글 수정하기</h1>
			<input type="hidden" name="bno2" value="${boardVO.bno}" id="bno2">
		</div>
	</div>

	<div class="container">
		<form:form id="modifyForm" modelAttribute="boardVO" method="post" enctype="multipart/form-data"
			action="${contextPath}/board/modify">
			<input type="hidden" name="category" value="${boardVO.category}" readonly>
			<input type="hidden" name="bno" value="${boardVO.bno}" id="bno">
			<div class="form-group">
				<label>제목 : </label>
				<form:input type= "text" path ="title" class="form-control" value="${board.title}" /><br>
				<form:errors path="title" class="error" style="color:red;"/>
			</div>
			<div class="form-group">
				<label>내용 : </label>
				<form:textarea  path="contents" class="form-control" value="${board.contents}" />
				<form:errors path="contents" class="error" style="color:red;"/>
			</div>
			<div class="form-group">
				<label>작성자 : </label>
				<sec:authentication property="principal.memberVO.userName" var="name" />
				<form:input type= "text"  path ="writer" value="${name}" class="form-control"   readonly="true" />
				<form:errors path="writer"  style="color:red;"  />
			</div>
			<br>
			<button class="btn btn-primary">수정하기</button>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }"> 
		</form:form>
		
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
		  						<div class="oImg">
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