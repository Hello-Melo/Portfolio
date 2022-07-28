<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
<c:set var="category" value="${pageMaker.criteria.category}" />
		<!--  점보트론  -->
		<div class="p-5 mb-4 bg-light rounded-3">
			<div class="d-flex justify-content-center">
				<h1 class="display-5 fw-bold">관원 게시판</h1>
			</div>

		</div>
		<!--  점보트론  종료-->
		
		<!--  검색창  -->
		<div class="container d-flex justify-content-end">
			<div class="searchArea ">
				<form  id="searchForm">
					<select name="type" id="type">
						<option value="">=====</option>
						<option value="T" ${pageMaker.criteria.type eq 'T' ? 'selected' : '' }>제목</option>
						<option value="C" ${pageMaker.criteria.type eq 'C' ? 'selected' : '' }>내용</option>
						<option value="W" ${pageMaker.criteria.type eq 'W' ? 'selected' : '' }>작성자</option>
						<option value="TC" ${pageMaker.criteria.type eq 'TC' ? 'selected' : '' }>제목+내용</option>
						<option value="TW" ${pageMaker.criteria.type eq 'TW' ? 'selected' : '' }>제목+작성자</option>
						<option value="CW" ${pageMaker.criteria.type eq 'CW' ? 'selected' : '' }>내용+작성자</option>
					</select>
					<input type="search" name="keyword" value="${pageMaker.criteria.keyword}" id="keyword">
					<input type="hidden" name="category" value="${pageMaker.criteria.category}" id="category">
					<button class="btn btn-secondary button"> 검색</button>
				</form>
			</div>
		</div>
	<!--  검색창  종료 -->
		
		
		<!--  게시판 -->
		<div class="container">
			<table class="table">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>수정일</th>
				</tr>
				<c:forEach items="${list}" var="b">
						<tr>
							<td>${b.bno}</td>
							<td><a href="${b.bno}">${b.title}<b>[${b.replyCnt}]</b></a></td>
							<td>${b.writer}</td>
							<td><fmt:parseDate var="regDate" value="${b.regDate}" 	pattern="yyyy-MM-dd'T'HH:mm:ss" type="both" />
							<fmt:formatDate	value="${regDate}" pattern="yyyy년 MM월 dd일" /></td>
							<td><fmt:parseDate var="updateDate" value="${b.updateDate}" 	pattern="yyyy-MM-dd'T'HH:mm:ss" type="both" />
							 <fmt:formatDate value="${updateDate}" pattern="yyyy년 MM월 dd일" /></td>
						</tr>
				</c:forEach>
			</table>
		
				<form action="${contextPath}/board/register" class="d-flex justify-content-end">
						<button class="btn btn-primary">글쓰기</button>
						<input type="hidden" name="category" value="${pageMaker.criteria.category}">
				</form>
			
		</div>
		<!--  게시판 종료 -->
		
		<!--  페이지네이션  -->	
		<%@ include file="/WEB-INF/views/common/pagenation.jsp" %>

		<!-- 모달 -->
		<%@ include file="/WEB-INF/views/common/modal.jsp" %>
		
	
	<!--  자바 스크립트 -->
<script>
	
	$(function() {
		//get페이지로 들어갈때 코드
		$('.table a').on('click',function(e){
			e.preventDefault();
			
			let getBno = $(this).attr("href")
			let pageForm = $('<form></form>')
			
			//input 태그를 여기서 붙여주는 것. So Easy~~ bno를 붙여줘야 페이지로 이동함
			pageForm.append($('<input/>', {type:'hidden',name:'bno',value:getBno}))
							.append($('<input/>', {type:'hidden',name:'page',value:'${pageMaker.criteria.page}'}))
							.append($('<input/>', {type:'hidden',name:'type',value:'${pageMaker.criteria.type}'}))
							.append($('<input/>', {type:'hidden',name:'keyword',value:'${pageMaker.criteria.keyword}'}));
			
			pageForm.attr("action", "${contextPath}/get");
			pageForm.attr("method", "get");
			pageForm.appendTo('body');
			pageForm.submit();
		})
		
		// 함수를 만들어서 모달창에 입력받을때만 실행되게 만듬!
		function play() {
			//이건 해당 모달창의 내용이 입력되기 전에 해당내용을 삭제 
			$('.close').on('click', function (e) {
				$('.message').find('span').remove();
				$('.titleName').find('span').remove();
			});
			//입력받은 내용을 제목과 내용으로 모달에 넣어주기!
			//append는 계속 추가(enter입력시 무한 추가) html은 대체해버림! 즉 이런 상황에선 html쓸것!
			$(".titleName").html('<span>'+obj.titleName+'</span>');
			$(".message").html('<span>'+obj.message+'</span>');
			//모달창 실행하는 코드
			$('#feedback').modal('show');
		};
		
		//검색창 버튼 클릭시 이벤트 코드
	$('#searchForm .button').on('click', function(e) {
			e.preventDefault();
			// 각각 아이디로 지역 변수 선언
			let option = $('#type').val();
			let keyword = $('#keyword').val();
			
			// if문(return 반드시 설정), 그리고 필드 객체로 선언한 obj의 항목들입력
			// 그리고 마지막에 play 함수로 입력한 값들을 모달창에 주입!!!!
			if(option==""){
				obj.titleName = "경고";
				obj.message = "검색조건을 입력하세요.";
				play()
				return;
			};
			//검색조건이 잇어도, 검색창에 값이 없으면 뜨는 코드!
			if(keyword.trim()==""){
				obj.titleName = "경고";
				obj.message = "검색어를 입력하세요.";
				play()
				return;
			};
			//if문이 둘다 false일때 그냥 검색 실행되는 코드!
			$('#searchForm').attr('action','${contextPath}/list/${pageMaker.criteria.category}')
			$('#searchForm').submit();
		});
	});
	
	</script>		

<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>