
$(document).ready(function() {
	// 표현언어로 컨텍스트 패스 불러올수 없으니, 헤더에 선언해준 변수 contextPath로 사용하면된다!

	let form = $('#registerForm');
	let submitBtn = $('#registerForm button');
	
		function regList() {
				 if (confirm("정말 등록 하시겠습니까??") == true){    //확인
				     return true;
				 }else{   //취소
				     return false;
				 }
			}
	
	submitBtn.on("click", function(e){
		let str ='';
			if(regList() == true){
				$('.uploadResult ul li').each(function (i, obj) {
					let jobj = $(obj);
					console.log(jobj.data('filename'));
					str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data('filename')+"'>";
					str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data('uuid')+"'>";
					str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data('path')+"'>";
					str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data('type')+"'>";
				});
				form.attr("action", contextPath + "/register2");
				form.attr("method", "post");
				form.append(str).submit();
			}
	})
	
	//삭제 
		$('.uploadResult ul').on('click', 'span', function() {
				alert('삭제');
				let targetFile = $(this).data('file');
				let type = $(this).data('type');
				let targetLi = $(this).closest('li');
				
				
				$.ajax({
					url : contextPath + '/deleteFile',
					type : 'post',
					data : {fileName : targetFile, type : type},
					dataType : 'text',
					success : function(result) {
						alert(result);
						targetLi.remove();
					}
				})
			})
	
	//파일 업로드
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
			})
}) // function 끝



	