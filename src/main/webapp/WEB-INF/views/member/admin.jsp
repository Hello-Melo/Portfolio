<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/header.jsp" %>


	<div class="p-5 mb-4 bg-light rounded-3">
		<div class="d-flex justify-content-center">
			<h1 class="display-5 fw-bold">관리자 페이지</h1>
		</div>
	</div>
		
	<div class="container d-flex justify-content-around mb-10 mt-10" style="border:1px solid red;">
	<!--  1st box -->
		<div>
			<div style="border:1px solid blue;" class="d-flex justify-content-between">
				<div>
					<img src="${contextPath}/resources/imgs/admin.jpg" style="width:150px;">
				</div>
				<div>
					<form id="adminForm">
						<div>
							<label>공지사항</label>
							 <input type="submit" class="form-control noti" value="공지사항" readonly> 
						</div>
						<div>
							<label>회원관리</label>
							<input type="submit" class="form-control mana"  value="회원관리" readonly> 
						</div>
						<div>
							<label>채팅상담</label>
							<input type="submit" class="form-control chat"  value="채팅상담" readonly> 
						</div>
					</form>
					<div>
						<label>사업자번호</label><input type="text" class="form-control"
					name="userAddr" value="302-11-55148" readonly>
					</div>
					<div>
						<label>주소</label><input type="text" class="form-control"
					name="userAddr" value="경북 구미시 봉곡동 봉곡태권도" readonly>
					</div>
					<div>
						<label>연락처</label><input type="text" class="form-control"
					name="userBirth" value="010-0101-0101" readonly>
					</div>
					<div>
						<label>가입일</label>
							<fmt:parseDate var="regDate" value="${member.regDate}" 	pattern="yyyy-MM-dd'T'HH:mm:ss" type="both" />
							<input type="text" class="form-control"
							name="regDate" value="<fmt:formatDate	value="${regDate}" pattern="yyyy년 MM월 dd일"/>" readonly>
					</div>
					<div>
						<label>회원상태</label>
							<input type="text" class="form-control" name="userPass" value="관장" readonly>
					</div>
				</div>
			</div>
		</div><!--  1st box end -->
		
		<div style="border:1px solid green;"><!--  2nd box -->
			<div>
				<div style="border:1px solid yellow;">
					<h4>승인 대기자 명단</h4>
				</div>
				<div>
					<table class="table memberV">
						<tr>
							<th>회원번호</th>
							<th>회원이름</th>
							<th>가입일</th>
							<th>비고</th>
						</tr>
						 <c:forEach items="${memberList}" var="b">
							<c:if test="${b.userPass == 0}">
								<tr>
									<td>${b.uno}</td>
									<td><a href="${b.uno}" class="get1">${b.userName}</a></td>
									<td><fmt:parseDate var="regDate" value="${b.regDate}" 	pattern="yyyy-MM-dd'T'HH:mm:ss" type="both" />
									<fmt:formatDate	value="${regDate}" pattern="yyyy년 MM월 dd일" /></td>
									<td><a href="${contextPath}/member/list">관리페이지 이동</a></td>
								</tr>
							</c:if>
						</c:forEach>  
					</table>
				</div>
			</div>
		
			<div>
				<div style="border:1px solid brown;">
					<h4>최신 작성 글</h4>
				</div>
				<div>
					<table class="table boardV">
						<tr>
							<th>글번호</th>
							<th>작성자</th>
							<th>제목</th>
							<th>등록일</th>
							<th>분류</th>
						</tr>
					 <c:forEach items="${list}" var="b" >
						<tr>
							<td>${b.bno}</td>
							<td><a href="${contextPath }/${b.category}/get?bno=${b.bno}&page=1" class="get2">${b.title}<b>[${b.replyCnt}]</b></a></td>
							<td>${b.writer}</td>
							<td><fmt:parseDate var="regDate" value="${b.regDate}" 	pattern="yyyy-MM-dd'T'HH:mm:ss" type="both" />
							<fmt:formatDate	value="${regDate}" pattern="yyyy년 MM월 dd일" /></td>
							<c:if test="${b.category == 'free'}">
								<td>
									관원게시판
								</td>
							</c:if>
							<c:if test="${b.category == 'notice'}">
								<td>
									공지사항
								</td>
							</c:if>
						</tr>
					</c:forEach>  
					</table>
				</div>
			</div>
		</div><!--  2nd box end -->
	</div>


<script>
	
	let getForm = $('#adminForm ');

$(function() {
	//get페이지로 들어갈때 코드
	$('#adminForm .noti').on('click',function(e){
		e.preventDefault();
				
		getForm.append($('<input/>', {type:'hidden',name:'category',value:'notice'}));
		getForm.attr("action", "${contextPath}/register2");
		getForm.attr("method", "get");
		getForm.appendTo('body');
		getForm.submit();
	})

		$('#adminForm .mana').on('click', function(e) {
			e.preventDefault();
			getForm.attr("action", "${contextPath}/member/list");
			getForm.attr("method", "get");
			getForm.submit();
		})
		
		$('#adminForm .chat').on('click', function(e) {
			e.preventDefault();
			getForm.attr("action", "${contextPath}/chat");
			getForm.attr("method", "get");
			getForm.submit();
		})
		
})
</script>

<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>