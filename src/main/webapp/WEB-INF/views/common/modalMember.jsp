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
	
	$(function() {
		//이것은 컨트롤러 단에서 넘겨준 result 값을 베이스로 모달창에
		// 헤더와 바디 값을 입력 후 주입해준다!
		if (obj.result.trim() != '') {
			if (obj.result.trim() == "approve") {
				obj.titleName = "회원 가입 승인";
				obj.message = "${uno}번 회원님의 가입을 승인하였습니다.";
				play()
				return;
			} else if (obj.result.trim() == "deni") {
				obj.titleName = "회원 가입 거부";
				obj.message = "${uno}번 회원님의 가입을 거부하였습니다.";
				play()
				return;
			} else if (obj.result.trim() == "drop") {
				console.log("회원탈퇸")
				obj.titleName = "회원 탈퇴";
				obj.message = "${uno}번 회원님이 탈퇴하셨습니다.";
				play()
				return;
			}
		
		}
	})	

</script>
