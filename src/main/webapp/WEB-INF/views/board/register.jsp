<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script  src="${pageContext.request.contextPath}/resources/js/register.js" ></script>


		<div class="p-5 mb-4 bg-light rounded-3">
			<div class="d-flex justify-content-center">
				<h1 class="display-5 fw-bold">글쓰기</h1>
			</div>
		</div>
		
		<div class="container">
			<form action="${contextPath}/board/register" method="post" id="registerForm">
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

<script>
	//ckEditor 불러오기 + 파일업로드!
	$(function () {
			CKEDITOR.replace('contents', {
				height : 400,
				filebrowserUploadUrl : '${pageContext.request.contextPath}/adm/fileupload.do',
			});
			
			CKEDITOR.on( 'dialogDefinition', function( ev ){    // Take the dialog name and its definition from the event data. 
				var dialogName = ev.data.name; 
			  var dialogDefinition = ev.data.definition; 
				  // Check if the definition is from the dialog we're  
				  // interested in (the 'image' dialog). This dialog name found using DevTools plugin 
				  if ( dialogName == 'image' ){        // Remove the 'Link' and 'Advanced' tabs from the 'Image' dialog.   
				
					    dialogDefinition.removeContents( 'Link' );    //링크 탭 제거 
					     dialogDefinition.removeContents( 'advanced' );  //상세정보 탭 제거   
				  var infoTab = dialogDefinition.getContents( 'info' );  
					//info탭을 제거하면 이미지 업로드가 안된다.   
					    // Remove unnecessary widgets/elements from the 'Image Info' tab.     
					  infoTab.remove( 'txtHSpace'); //info 탭 내에 불필요한 엘레멘트들 제거   
					    infoTab.remove( 'txtVSpace');   
					    infoTab.remove( 'txtBorder');    
					  infoTab.remove( 'ratioLock');  
						  }});
	});
	
		
</script>

<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>