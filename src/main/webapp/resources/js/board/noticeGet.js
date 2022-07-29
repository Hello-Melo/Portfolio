
$(function() {
//파일리스트 불러오기

	$.getJSON(contextPath+"/board/getAttachList", {bno : bnoValue}, function(attachList) {
		console.log(attachList)
		let str ="";
		$(attachList).each(function(i, obj){
			if(!obj.fileType){ // 이미지가 아닌경우
				// 파일 경로
				let fileCellPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
				// 파일이름에 다운로드 링크걸기!
			
				str += "<li class='list-group-item' data-path='"+obj.uploadPath+"'";
				str += "data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";
				str += "<img src = '"+contextPath+"/resources/img/attach.png' >"
				str += "</li>"
				
			} else{//이미지 인 경우
				//파일경로
				let fileCellPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
				
			str += "<li class='list-group-item' data-path='"+obj.uploadPath+"'";
			str += "data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";	
			str += " <img src = '"+contextPath+"/display?fileName="+fileCellPath+"'>"
			str += "</li>"
			}
		}) //each 종료
		$('.uploadResult').append(str);
	})
})