	$(function () {
			CKEDITOR.replace('contents', {
				height : 400,
				filebrowserUploadUrl : contextPath+'/adm/fileupload.do'
			});
	});
	
	CKEDITOR.addCss('.cke_editable img { max-width: 100% !important; height: auto !important; }');
	
	CKEDITOR.on( 'dialogDefinition', function( ev ){    // Take the dialog name and its definition from the event data. 
		var dialogName = ev.data.name; 
	  var dialogDefinition = ev.data.definition; 
		  // Check if the definition is from the dialog we're  
		  // interested in (the 'image' dialog). This dialog name found using DevTools plugin 
		  if ( dialogName == 'image' ){        // Remove the 'Link' and 'Advanced' tabs from the 'Image' dialog.   
		
			    dialogDefinition.removeContents( 'Link' );    //링크 탭 제거 
			     dialogDefinition.removeContents( 'advanced' );  //상세정보 탭 제거   
		  var infoTab = dialogDefinition.getContents( 'info' );  
			//info탭을 제거하면 이미지 업로드가 안된다.   
			    // Remove unnecessary widgets/elements from the 'Image Info' tab.     
			  infoTab.remove( 'txtHSpace'); //info 탭 내에 불필요한 엘레멘트들 제거   
			    infoTab.remove( 'txtVSpace');   
			    infoTab.remove( 'txtBorder');    
			  infoTab.remove( 'ratioLock');  
				  }});