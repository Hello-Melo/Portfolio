<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
		<style>
		.oImg img {
			width: 500px;
		}
		</style>
		
		
		<h2>파일 업로드</h2>
		<div class="uploadDiv">
			<input type="file" name="uploadFile" multiple>
		</div>
		
		<button id="uploadBtn">submit</button>
		
		<div class="uploadResult">
			<ul>
		
		
			</ul>
			<div class="oImg"></div>
		</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	$(document).ready(function() {
			
		let regex = new RegExp("(.*?)\.(exe|sh|js|alz)$"); //정규표현식, 해당 확장자들을 regex에 선언
		let maxSize = 5242880; //5mb 파일크기 제한
		
		//파일 상태 체크 함수
		function checkExtension(fileName, fileSize) {
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
			if(regex.test(fileName)){
				alert("지원하지 않는 확장자")
				return false;
			}
			return true;
		}
		
		let cloneObj = $('.uploadDiv').clone();
		
			//버튼에 이벤트 주기
			$('#uploadBtn').on('click', function(e) {
				//formdata라는 객체를 생성(일종의 가상 form 태그)
				let formData = new FormData();
				//uploadFile 이라는 이름의 input 태그를 변수화
				let inputFile = $("input[name='uploadFile']");
				//업로드 된 파일들을 files라는 변수에 선언
				let files = inputFile[0].files;
				console.log(files);
				
				for(let i = 0 ; i < files.length ; i++){
				 	//파일 이름과 크기 체크 함수 실행 후 통과하면 파일 업로드!
					if(!checkExtension(files[i].name, files[i].size)){
						return false;
					} 
						formData.append("uploadFile", files[i]);
					}
					
					//ajax설정, 여기서 processData, contentType은 false로 해야 전송가능!
					$.ajax({
					url : contextPath + '/uploadAjaxAction',
					processData : false,
					contentType : false,
					data : formData,
					type : 'post',
					success : function(result) {
						alert('uploaded');
						
						$('.uploadDiv').html(cloneObj.html());
						showUploadFile(result);
						}
					})
			})// uploadBtn event 끝
			
			//result 부분 처리
			let uploadResult = $('.uploadResult ul');
		function showUploadFile(uploadResultArr) {
			let str = "";
			$(uploadResultArr).each(function(i, obj){
				console.log(obj);
				if(!obj.fileType){ // 이미지가 아닌경우
					// 파일 경로
					let fileCellPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
					let fileLink = fileCellPath.replace(new RegExp(/\\/g),"/");
				
					// 파일이름에 다운로드 링크걸기!
				str += "<li> <img src = '${pageContext.request.contextPath}/resources/img/attach.png' style='width:30px'>"
					str += "<a href='${pageContext.request.contextPath}/download?fileName=" +fileCellPath+" '>" + obj.fileName  +"</a>"
					str += "<span data-file='"+fileLink+"'  data-type='file'> 삭제 </span>"
					str += "</li>" 
					
				} else{//이미지 인 경우
					//파일경로
					let fileCellPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
					let fileLink = fileCellPath.replace(new RegExp(/\\/g),"/");
					let originPath = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;
					originPath = originPath.replace(new RegExp(/\\/g),"/");
					console.log(originPath)
				str += " <li><img src = '${pageContext.request.contextPath}/display?fileName="+fileCellPath+"'>"
				str += " <a href='javascript:showImage(\""+originPath+"\")'>이미지 원본보기</a>"
				str += "<br><span data-file='"+fileLink+"'  data-type='image'> 삭제 </span>"
				str += "</li>" 
				
				}
			})
			uploadResult.append(str);
		}
			
		
		uploadResult.on('click', 'span', function(e) {
			console.log($(this).data('file'));
			alert('삭제 가즈아');
			
			let targetFile = $(this).data("file");
			let type = $(this).data("type");
			
			$.ajax({
				url :  contextPath + '/deleteFile',
				data : {fileName : targetFile, type : type},
				dataType : 'text',
				type : 'POST',
				success : function(result) {
					alert(result);
					}
			});
		});
	})

		function showImage(path) {
			let imgTag = "<img  src='${pageContext.request.contextPath}/display?fileName="+encodeURI(path)+"'>"
			$('.oImg').html(imgTag);
		}

</script>
</body>
</html>