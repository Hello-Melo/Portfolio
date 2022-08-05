<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/header.jsp" %>
<h2>Admin Page</h2>

<p>principal :  <sec:authentication property="principal.memberVO" var="member"/> </p>
<p>MemberVO :  <sec:authentication property="principal.memberVO"/> </p>
<p>사용자이메일 :  <sec:authentication property="principal.memberVO.userEmail"/> </p>
<p>사용자이름 :  <sec:authentication property="principal.memberVO.userName"/> </p>
<p>사용자비번 :  <sec:authentication property="principal.memberVO.userPw"/> </p>
<p>사용자권한목록 :  <sec:authentication property="principal.memberVO.authList"/> </p>

<a href="${contextPath}/logout">로그아웃 </a>

<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>