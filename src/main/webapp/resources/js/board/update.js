/*		
		
	function showImage(path) {
		let imgTag = "<img  src='"+contextPath+"/display?fileName=" + encodeURI(path) + "'>"
		$('.oImg').html(imgTag);
	}


	let regex = new RegExp("(.*?)\.(exe|sh|js|alz)$"); //정규표현식, 해당 확장자들을 regex에 선언
	let maxSize = 5242880; //5mb 파일크기 제한

	//파일 상태 체크 함수
	function checkExtension(fileName, fileSize) {
		if (fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}
		if (regex.test(fileName)) {
			alert("지원하지 않는 확장자")
			return false;
		}
		return true;
	}

	//result 부분 처리
		let uploadResult = $('.uploadResult ul');
		function showUploadResult(uploadResultArr) {
			
			if(!uploadResultArr || uploadResultArr.length == 0) return;
			
			let str = "";
			$(uploadResultArr).each(function(i, obj){
				if(!obj.fileType){ // 이미지가 아닌경우
					// 파일 경로
					let fileCellPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid + "_" + obj.fileName);
					let fileLink = fileCellPath.replace(new RegExp(/\\/g),"/");
				
					// 파일이름에 다운로드 링크걸기!
					str += "<li class='list-group-item' data-path='"+obj.uploadPath+"'";
					str += "data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";
					str += "<img src = '"+contextPath+"/resources/img/attach.png' style='width:30px'>"
					str += "<a href='"+contextPath+"/download?fileName=" + fileCellPath +" '>" + obj.fileName  +"</a>"
					str += "<div class='d-flex justify-content-end'><span data-file='"+fileLink+"'  data-type='file'> 삭제 </span></div>"
					str += "</li>"
					
				} else{//이미지 인 경우
					//파일경로
					let fileCellPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
					let fileLink = fileCellPath.replace(new RegExp(/\\/g),"/");
					let originPath = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;
					originPath = originPath.replace(new RegExp(/\\/g),"/");
					
				str += "<li class='list-group-item' data-path='"+obj.uploadPath+"'";
				str += "data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";	
				str += " <img src = '"+contextPath+"/display?fileName="+fileCellPath+"'>"
				str += " <a href='javascript:showImage(\""+originPath+"\")'>이미지 원본보기</a>"
				str += "<br><div class='d-flex justify-content-end'><span data-file='"+fileLink+"'  data-type='image'> 삭제 </span></div>"
				str += "</li>"
				}
			})
			uploadResult.append(str);
		}


*/
		
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
			
			
			let modifyForm =$('#modifyForm');
			let modifyBtn = $('#modifyForm button');
			modifyBtn.on('click', function (e) {
				e.preventDefault();
				//console.log('멈춰!');
				let str = "";
				$('.uploadResult ul li').each(function(i, obj) {
					let jobj = $(obj);
					str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data('filename')+"'>";
					str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data('uuid')+"'>";
					str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data('path')+"'>";
					str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data('type')+"'>";
				})
				modifyForm.append(str).submit();
			})
			
		})
		
