$(function() {
		let bnoValue = bno2;
		$.getJSON(contextPath+"/board/getAttachList", {bno : bnoValue}, function(attachList) {
			showUploadResult(attachList);
			
		}) //getJSON end
			
				// 삭제 이벤트 설정
			$('.uploadResult ul').on('click', 'span', function() {
				alert('삭제');
				let targetLi = $(this).closest('li');
				targetLi.remove();
			}) //delete end
			
			//파일 변경 기능
			$('input[type="file"]').change(function(e) {
				let formData = new FormData();
				let inputFiles = $('input[name="uploadFile"]');
				let files = inputFiles[0].files;
				
				for(let f of files){
					if(!checkExtension(f.name, f.size))	return false;
					formData.append('uploadFile', f)
				}
				
				$.ajax({
					url : contextPath + '/uploadAjaxAction',
					type : 'post',
					processData : false,
					contentType : false,
					data : formData,
					dataType : 'json',
					success : function(result) {
						showUploadResult(result);
					}
				})
			}) //change event end			
			
			function updateList() {
				 if (confirm("정말 수정 하시겠습니까??") == true){    //확인
				     return true;
				 }else{   //취소
				     return false;
				 }
			}
			
			
			
			let modifyForm =$('#modifyForm');
			let modifyBtn = $('#modifyForm button');
			modifyBtn.on('click', function (e) {
				e.preventDefault();
				//console.log('멈춰!');
				if(updateList() == true){
					let str = "";
					$('.uploadResult ul li').each(function(i, obj) {
						let jobj = $(obj);
						str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data('filename')+"'>";
						str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data('uuid')+"'>";
						str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data('path')+"'>";
						str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data('type')+"'>";
					})
						modifyForm.append(str).submit();
				}
			})
			
		})
		
