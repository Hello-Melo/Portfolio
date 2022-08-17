
$(function () {
	
	let bnoValue = $('input[name="bno"]').val();
	let replyUL = $('.chat');
		
	function showList(page) {
		replyService.getList({bno : bnoValue, page : page}, function (list) {
			let str = '';
			
			for(let r of list){
					str += `
				            <li class="left clearfix" data-rno='${r.rno}'>
				                <div>
				                    <div class="header">
				                        <strong class="primary-font">${r.replyer}</strong>
				                        <small class="float-right text-muted">${replyService.displayTime(r.updateDate)}</small>
				                        
				                    </div>
				                    <p>${r.reply}</p>
				                </div>
				            </li>
				            `
			}
		      replyUL.html(str);
		});
	}
	showList(1);
	
	
	function regList() {
		 if (confirm("정말 등록하시겠습니까??") == true){    //확인
		     return true;
		 }else{   //취소
		     return false;
		 }
	}	
	
	function deleteList() {
		 if (confirm("정말 삭제하시겠습니까??") == true){    //확인
		     return true;
		 }else{   //취소
		     return false;
		 }
	}
	
	let bno = $('input[name="bno"]').val();
		
	// 모달
	let modal = $('.modal');
	let modalInputReply = modal.find('input[name="reply"]');
	let modalInputReplyer = modal.find('input[name="replyer"]');
	let modalInputReplyDate = modal.find('input[name="regDate"]');
	
	//댓글 등록 모달창 안의 입력 삭제 수정 종료버튼 
	let modalMoBtn = $('#modalMoBtn');
	let modalRemoveBtn = $('#modalRemoveBtn');
	let modalRegisterBtn = $('#modalRegisterBtn');
	let modalCloseBtn = $('modalCloseBtn');
	
	// 댓글등록 모달창
	$('#addReplyBtn').on('click', function(e) {
		modal.find('input').val('');
		modalInputReplyDate.closest('div').hide();
		modalRemoveBtn.hide();
		modalMoBtn.hide();
		modalRegisterBtn.show();
		
		//모달창 띄우기 이벤트 클릭창에 모달실행이 있어서 여기서는 주석처리
		modal.modal("show");
		});
	
		// 댓글 등록 이벤트 처리
		modalRegisterBtn.on('click', function(e) {
			if(regList() == true){
			let reply = {
					reply : modalInputReply.val(),
					replyer : modalInputReplyer.val(),
					bno : bno
			}
			replyService.add(reply, function(result) {
				
				modal.find('input').val('');
				modal.modal('hide');
				
				showList(1);
			})
			}
		})
	
	// 모달 이벤트 처리
/*	$('#modalRegisterBtn').on('click', function () {
		let test = modalInputReply.val();
		alert(test);
		})
		
		$('#modalRegisterBtn').on('click', function () {
		let test2 = modalInputReplyer.val();
		alert(test2);
		})		
		
		console.log(userId)*/
		// 댓글 이벤트처리
	$('.chat').on('click','li', function(e) {
			let rno = $(this).data('rno');
			
			replyService.get(rno, function(reply) {
				if(userId != reply.replyer && userId  != "관리자") return; // 사용자 확인 
				modalInputReply.val(reply.reply);
				modalInputReplyer.val(reply.replyer).attr("readonly", "readonly");
				modalInputReplyDate.val(replyService.displayTime(reply.updateDate)).attr("readonly", "readonly");
				modal.data("rno", reply.rno)
				
				modal.find("button[id!='modalCloseBtn']").hide();
				modalInputReplyDate.closest('div').show();
				modalMoBtn.show();
				modalRemoveBtn.show();
				
				modal.modal("show");
			})

	})
		
	
				// 댓글 수정
	modalMoBtn.on("click", function(e) {
		let reply = {rno : modal.data("rno"), reply:modalInputReply.val() };
		console.log(reply);
		replyService.update(reply, function(result) {
			alert(result);
			modal.modal("hide");
			showList(1);
		})
	})
	
	//댓글 삭제
	
	modalRemoveBtn.on("click", function(e) {
		if(deleteList() == true){
		let rno = modal.data("rno");
		replyService.remove(rno, function(result) {
			alert(result);
			modal.modal("hide");
			showList(1);
		})
		}
	})
	
	
	})