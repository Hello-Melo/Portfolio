<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
 <%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form" %>
 <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="board.mainTitle" /></title>
	<link rel="stylesheet"  href="${pageContext.request.contextPath}/resources/css/reset.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" ></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" ></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://use.fontawesome.com/ab81edd9b2.js"></script>
	<script>
		let contextPath = '${contextPath}'
		let csrfHeaderName = "${_csrf.headerName}";
		let csrfTokenName = "${_csrf.token}";
	</script>
	<!-- <script src="//cdn.ckeditor.com/4.19.0/full/ckeditor.js"></script> -->
	<script  src="${contextPath}/resources/ckeditor/ckeditor.js"></script>
 	<script  src="${contextPath}/resources/js/common/common.js"></script> 
	<link rel="stylesheet"  href="${contextPath}/resources/css/bootstrap-social.css">
	<link rel="stylesheet"  href="${contextPath}/resources/css/style.css">
</head>
<body>

    <!-- 네이게이션 바 -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container-fluid">
        <span><a href="${contextPath}"><img src="${contextPath}/resources/imgs/logo3-removebg-preview.png" class="logo"></a></span>
        <a class="navbar-brand" href="#"><spring:message code="board.teak" /></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse d-flex" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="${contextPath}/notice/notice"><spring:message code="board.notice" /></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${contextPath}/table"><spring:message code="board.schedule" /></a>
            </li>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
            <li class="nav-item">
              <a class="nav-link" href="${contextPath}/member/list"><spring:message code="board.memberPage" /></a>
            </li>
             </sec:authorize>
            <li class="nav-item">
              <a class="nav-link" href="${contextPath}/list/free"><spring:message code="board.board" /></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${contextPath}/map"><spring:message code="board.counseling" /></a>
            </li>
          </ul>
	          <sec:authorize access="isAnonymous()">
		          <form class="d-flex">
		            <a href="${contextPath}/member/register"><spring:message code="board.join" /></a> <span>|</span> <a href="${contextPath}/login"><spring:message code="board.login" /></a>
		          </form>
	           </sec:authorize>
               <sec:authorize access="hasAnyRole('ROLE_MEMBER','ROLE_MANAGER')">
                <sec:authentication property="principal.memberVO.uno" var="uno"/>
		          <form class="d-flex logoutForm">
		            <a href="${contextPath}/sec/myPage/${uno}"><spring:message code="board.myPage" /></a> <span>|</span> 
		            <a class="logout" ><spring:message code="board.logout" /></a>
		          </form>
	           </sec:authorize>
	              <sec:authorize access="hasRole('ROLE_ADMIN')">
		          <form class="d-flex logoutForm">
		            <a href="${contextPath}/sec/admin"><spring:message code="board.adminPage" /></a> <span>|</span> 
		            <a class="logout"><spring:message code="board.logout" /></a>
		          </form>
	           </sec:authorize>
        </div>
      </div>
    </nav>



<script>

	$('.logoutForm .logout').on('click', function (e) {
		e.preventDefault();	
		let pageForm = $('<form></form>')
		pageForm.append($('<input/>', {type:'hidden',name:'${_csrf.parameterName}',value:'${_csrf.token }'}));
		pageForm.attr('action', '${contextPath}/logout');
		pageForm.attr('method', 'post');
		pageForm.appendTo('body');
		pageForm.submit();
	})

</script>

