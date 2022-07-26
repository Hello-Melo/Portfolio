<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="modal fade" id="replyForm" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="replyForm">댓글 달기</h5>
						<button type="button" class="close" data-bs-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="reply">내용 입력</label>
							<input class="form-control" name="reply" id= "reply"> 
						</div>
						<div class="form-group">
							<label for="replyer">작성자</label>
							<input class="form-control" name="replyer" id="replyer"> 
						</div>
						<div class="form-group">
							<label for="regDate">등록일</label>
							<input class="form-control" name="regDate" id="regDate" value="${board.regDate}">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-warning" id="modalRemoveBtn">삭제</button>
						<button type="button" class="btn btn-danger" id="modalMoBtn">수정</button>
						<button type="button" class="btn btn-primary" id="modalRegisterBtn">등록</button>
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="modalCloseBtn" >닫기</button>
					</div>
				</div>
			</div>
		</div>