<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/header.jsp" %>
<h2>Admin Page</h2>

<p>principal :  <sec:authentication property="principal"/> </p>
<p>MemberVO :  <sec:authentication property="principal.member"/> </p>
<p>사용자이메일 :  <sec:authentication property="principal.member.userEmail"/> </p>
<p>사용자이름 :  <sec:authentication property="principal.member.userName"/> </p>
<p>사용자비번 :  <sec:authentication property="principal.member.userPw"/> </p>
<p>사용자권한목록 :  <sec:authentication property="principal.member.authList"/> </p>

<a href="${contextPath}/customLogout">로그아웃 </a>

<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>