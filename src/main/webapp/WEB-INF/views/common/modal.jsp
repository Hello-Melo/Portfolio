<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- The Modal -->
<div class="modal" id="feedback">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title titleName"></h4>
				<button type="button" class="close" data-bs-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body message"></div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger close" data-bs-dismiss="modal">Close</button>
			</div>

		</div>
	</div>
</div>

<script>
	//다른 페이지에서도 사용할 수 있게 필드 객체로 선언!!
	let obj = {
		result : "${result}",
		message : "",
		titleName : ""
	};
	$(function() {

		//이것은 컨트롤러 단에서 넘겨준 result 값을 베이스로 모달창에
		// 헤더와 바디 값을 입력 후 주입해준다!
		if (obj.result.trim() != '') {
			if (obj.result == "register") {
				obj.titleName = "새로운 글 등록";
				obj.message = "${bno}번 글을 등록하셨습니다.";
			} else if (obj.result == "modify") {
				obj.titleName = "게시글 수정";
				obj.message = "${bno}번 글을 수정하셨습니다.";
			} else if (obj.result == "remove") {
				obj.titleName = "게시글 삭제";
				obj.message = "${bno}번 글을 삭제하셨습니다.";
			}
			$(".titleName").append(obj.titleName);
			$(".message").append(obj.message);
			$('#feedback').modal('show');
		}
	})

</script>
