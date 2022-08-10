<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<!--  페이지네이션 -->
		
		<ul class="pagination justify-content-center">
		
			<c:if test="${pageMaker.first}">
				<li class="page-item"><a href="1"	class="page-link"> 처음 </a></li>
			</c:if>
		
			<c:if test="${pageMaker.prev }">
				<li class="page-item"><a	href="${pageMaker.startPage -1}"
					class="page-link"> < </a></li>
			</c:if>
		
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" 	var="pageNum">
				<li class="page-item ${pageMaker.criteria.page == pageNum ? 'active' : ' ' } ">
					<a href="${pageNum}" class="page-link">
						${pageNum}
					</a></li>
			</c:forEach>
		
			<c:if test="${pageMaker.next }">
				<li class="page-item"><a	href="${pageMaker.endPage +1}" class="page-link"> > </a></li>
			</c:if>
		
			<c:if test="${pageMaker.end}">
				<li class="page-item"><a href="${pageMaker.tempEndPage}" class="page-link"> 끝 </a></li>
			</c:if>
		</ul>
		<!--  페이지네이션 종료 -->
<script>

$(function(){
	// 페이지 이동 
	$('.pagination a').on('click',function(e){
		e.preventDefault();
		//폼태그를 추가!
		let pageForm = $('<form></form>')
		//a 태그의 href를 변수선언
		let pageNum =$(this).attr("href")
		//폼태그 속에 input 태그 추가(속성은 히든에 page이름)
		pageForm.append($('<input/>', {type:'hidden',name:'page',value:pageNum}))
						.append($('<input/>', {type:'hidden',name:'type',value:'${pageMaker.criteria.type}'}))
						.append($('<input/>', {type:'hidden',name:'keyword',value:'${pageMaker.criteria.keyword}'}));
		
		//let pageNumTag = $('<input type="hidden" name="page">')
		//pageNumTag.val($(this).attr("href"));

		//폼태그 안에 액션은 list!
		pageForm.attr('action','${contextPath}/member/list/')
		//기본은 get이지만 선언해줌으로써 코드 꼬임 방지
						.attr('method','get');
		pageForm.appendTo('body');
		
		pageForm.submit();
	});
});
</script>
		
		
		