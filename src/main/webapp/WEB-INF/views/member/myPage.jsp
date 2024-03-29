<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/header.jsp" %>


	<div class="p-5 mb-4 bg-light rounded-3">
		<div class="d-flex justify-content-center">
			<h1 class="display-5 fw-bold"><spring:message code="board.myPage" /></h1>
		</div>
	</div>
	
	
	<div class="container d-flex justify-content-around mb-5 mt-5" >
	<!--  1st box -->
		<div>
			<div >
				<div>
					<img src="">
				</div>
				<div>
					<div>
						<label>회원번호</label><input type="text" class="form-control"
					name="uno" value="${member.uno}" readonly>
					</div>
					<div>
						<label>회원상태</label> <input type="text" class="form-control"
					name="userStatus" value="${member.userStatus}" readonly>
					</div>
					<div>
						<label>이름</label> <input type="text" class="form-control"
					name="userName" value="${member.userName}" readonly>
					</div>
					<div>
						<label>이메일</label> <input type="text" class="form-control"
					name="userEmail" value="${member.userEmail}" readonly>
					</div>
					<div>
						<label>주소</label><input type="text" class="form-control"
					name="userAddr" value="${member.userAddr} ${member.userAddrD}" readonly>
					</div>
					<div>
						<label>생일</label><input type="text" class="form-control"
					name="userBirth" value="${member.userBirth}" readonly>
					</div>
					<div>
						<label>가입일</label>
							<fmt:parseDate var="regDate" value="${member.regDate}" 	pattern="yyyy-MM-dd'T'HH:mm:ss" type="both" />
						<input type="text" class="form-control"
					name="regDate" value="<fmt:formatDate	value="${regDate}" pattern="yyyy년 MM월 dd일"/>" readonly>
					</div>
					<div>
						<label>승인여부</label>
						<c:choose>
								<c:when test="${member.userPass == 0 }">
									 <input type="text" class="form-control"
										name="userPass" value="승인대기" readonly>
								</c:when>
								<c:when test="${member.userPass == 1 }">
										<input type="text" class="form-control"
										name="userPass" value="승인완료" readonly>
								</c:when>				
								<c:when test="${member.userPass == 2 }">
										<input type="text" class="form-control"
										name="userPass" value="승인거절" readonly>
								</c:when>
								<c:when test="${member.userPass == 3 }">
										<input type="text" class="form-control"
										name="userPass" value="탈퇴상태" readonly>
								</c:when>					
							</c:choose>					
					</div>
					<br>
					<div class="row">
							<form action="${contextPath}/member/update" class="col text-center" >
								<button class="btn btn-info">수정하기</button>
								<input type="hidden" name="uno" value="${member.uno}" id="uno"> 
							</form>
					</div>
				</div>
			</div>
		</div><!--  1st box end -->
		
		<div><!--  2nd box -->
			<div>
				<div >
					<h4>내가 작성한 글</h4>
					
				</div>
				<div>
					<table class="table">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
				</tr>
				
				 <c:forEach items="${info.userBoardList}" var="b">
					<c:if test="${b.writer != null && b.writer == member.userName}">
						<tr>
							<td>${b.bno}</td>
							<td><a href="${contextPath}/free/get?bno=${b.bno}">${b.title}<b>[${b.replyCnt}]</b></a></td>
							<td>${b.writer}</td>
							<td><fmt:parseDate var="regDate" value="${b.regDate}" 	pattern="yyyy-MM-dd'T'HH:mm:ss" type="both" />
							<fmt:formatDate	value="${regDate}" pattern="yyyy년 MM월 dd일" /></td>
						</tr>
					</c:if>
				</c:forEach>  
			</table>
				</div>
			</div>
		
			<div>
				<div>
					<h4>내가 작성한 댓글</h4>
				</div>
				<div>
					<table class="table">
						<tr>
							<th>글번호</th>
							<th>작성자</th>
							<th>댓글내용</th>
							<th>등록일</th>
						</tr>
			 	<c:forEach items="${replyVo}" var="r">
							<c:if test="${r.replyer != null && r.replyer == member.userName}">
								<tr>
									<td>${r.bno}</td>
									<td>${r.replyer}</td>
									<td><a href="${contextPath}/free/get?bno=${r.bno}">${r.reply}</a></td>
									<td><fmt:parseDate var="regDate" value="${r.regDate}" 	pattern="yyyy-MM-dd'T'HH:mm:ss" type="both" />
									<fmt:formatDate	value="${regDate}" pattern="yyyy년 MM월 dd일" /></td>
								</tr>
							</c:if>
					</c:forEach>
					</table>
				</div>
			</div>
		</div><!--  2nd box end -->
	</div>
	

<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>


