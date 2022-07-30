<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/header.jsp"%>

<!--  메인파트 -->
	 <div class="p-5 mb-4 bg-light rounded-3">
      <div class="d-flex justify-content-center">
        <h1 class="display-5 fw-bold">공지사항</h1>
      </div>
    </div>
    
    <div>
    	<form action="${contextPath}/register2" class="d-flex justify-content-end">
    				<input type="hidden" name="category" id="category" value="${pageMaker.criteria.category}">
    	<button>글쓰기</button>
    	</form>
    </div>
    <div class="container notice">
	  	<div class="row row-cols-1 row-cols-md-3 g-4">
	  
		<c:forEach items="${list}" var="b">
			<c:set var="list" value="${b.attachList}" />
				<div class="col-md-3">
					<div class="card h-100">
						<c:choose>
							<c:when test="${list[0].fileType == 'true'}">
								<img src="${contextPath}/display?fileName=${list[0].imageName}" class="card-img-top"
										style="width:100%; height:238px;">
							</c:when>
							<c:otherwise>
								<img src="${contextPath}/resources/img/attach.png" class="card-img-top"
										style="width:100%; height:238px;">
							</c:otherwise>
							</c:choose>
						<div class="card-body">
							<h5 class="card-title"><a href="get?bno=${b.bno}">${b.title}
							</a></h5>
							<p class="card-text" >
								${b.contents}
							</p>
						</div>
						<div class="card-footer">
							<small class="text-muted">
							<fmt:parseDate var="regDate" value="${b.regDate}" 	pattern="yyyy-MM-dd'T'HH:mm:ss" type="both" />
							<fmt:formatDate	value="${regDate}" pattern="yyyy년 MM월 dd일 hh:mm" /></small>
						</div>
					</div>
			</div>
			</c:forEach>
		</div>
	</div>
		
		<%@ include file="/WEB-INF/views/common/modal.jsp" %>

<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>