
let replyService = (function() {

	//댓글 등록(add 함수 형태로 호출 / ajax로 숨겨져있어 코드가 깔끔/형태는 항상 동일(복붙해서 쓰자))
	function add(reply, callback, error) {
		$.ajax({
			type: 'post',
			url: contextPath + '/replies/new', //반드시 contextPath 붙여줘야 인식함여
			data: JSON.stringify(reply),
			contentType: 'application/json; charset=utf-8',
			success: function(result, status, xhr) {
				if (callback) callback(result);
			},
			error: function(xhr, status, er) {
				if (error) error(er)
			}
		})
	} // 댓글 등록 끝 (즉 add()메서드는 reply라는 객체와 callback을 함수로 받는다는걸 의미함!!!)

	//댓글 목록
	function getList(param, callback, error) {
		let bno = param.bno;
		let page = param.page || 1;

		let url = contextPath + '/replies/pages/' + bno + '/' + page;
		let success = function(data) {
			if (callback) { callback(data); }
		}

		$.getJSON(url, success).fail(function(xhr, status, err) {
			if (error) { error(err) };
		})//getJson종료
	}//댓글 목록 종료

	//댓글 삭제
	function remove(rno, callback, error) {

		$.ajax({
			type: 'delete',
			url: contextPath + '/replies/' + rno,
			success: function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error: function(xhr, status, err) {
				if (error) {
					error(err);
				}
			}
		});
	}//삭제 종료


	// 댓글 수정
	function update(reply, callback, error) {

		$.ajax({
			type: 'put',
			url: contextPath + '/replies/' + reply.rno,
			data: JSON.stringify(reply),
			contentType: 'application/json; charset=utf-8',
			success: function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error: function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	} //수정 종료


	//댓글 번호 가져오기
	function get(rno, callback, error) { //파라미터 이름 rno
		$.get(contextPath+'/replies/' + rno, function(result) { //contextPath 추가
			if(callback) callback(result);
			}).fail(function(xhr, status, err) {
				if(error) error(er);
			})
	}// 번호 가져오기 종료


	//시간 받기
	function displayTime(timeValue) {
		let timeArr = JSON.stringify(timeValue).substr(1).split(",");
		return `${timeArr[0]}년 ${timeArr[1]}월 ${timeArr[2]}일`;
	}

	return {
		add: add,
		getList: getList,
		displayTime: displayTime,
		remove: remove,
		update : update,
		get : get
	}

	//function으로 처리했을 경우 반드시 ();를 붙여서 실행해줘야 인식을 한다!
})();
