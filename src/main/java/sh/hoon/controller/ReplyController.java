package sh.hoon.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import sh.hoon.model.Criteria;
import sh.hoon.model.ReplyVo;
import sh.hoon.service.ReplyService;

@Controller
@RequestMapping("/replies")
public class ReplyController {

	@Autowired
	ReplyService service;
	
	//댓글 등록 메서드
	//댓글 등록은 post 방식 처리, Consumes, produces로 JSON 방식으로 처리 후 문자열 반환
	@PostMapping(value="/new",
							 consumes = MediaType.APPLICATION_JSON_VALUE,
							 produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> create(@RequestBody ReplyVo vo){
																	// requestBody는 json데이터를 replyvo타입으로 변환하게 하는 어노테이션
		int register = service.register(vo);
		return register  == 1 ?new  ResponseEntity<>("success", HttpStatus.OK)
										: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
		// 댓글 수정 메서드, 수정은 put과 patch2개를 사용한다.
		// 나머지는 댓글입력과 동일하고, pathvariable은 주소입력창에 댓글번호로 연결가능하게 해주는 어노테이션!
		// 실제 mapping 값도 {rno}로 주었다.
		@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH} , value = "/{rno}" ,
				consumes = MediaType.APPLICATION_JSON_VALUE ,
				produces = MediaType.TEXT_PLAIN_VALUE)
		public ResponseEntity<String> modify(@RequestBody ReplyVo vo, @PathVariable Long rno){
			vo.setRno(rno);
			int modify = service.modify(vo);
			return modify == 1 ? new ResponseEntity<>("success", HttpStatus.OK) 
											: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		//조회 테스트는 페이징 처리와 함께불러오는 방식
		@GetMapping(value = "/pages/{bno}/{page}", produces = {MediaType.APPLICATION_JSON_VALUE})
		public ResponseEntity<List<ReplyVo>> getList(@PathVariable int page, @PathVariable Long bno){
			Criteria criteria = new Criteria(page, 10);
			return new ResponseEntity<>(service.readAll(criteria, bno), HttpStatus.OK);
		}
		
		//삭제는 deletemapping을 이용. 이부분을 빼곤 댓글 입력과 동일
		@DeleteMapping(value="/{rno}", produces = MediaType.TEXT_PLAIN_VALUE)
		public ResponseEntity<String> remove(@PathVariable Long rno){
			return service.remove(rno) == 1 
					? new ResponseEntity<>("success", HttpStatus.OK)
					: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		//rno 각각 부르는 메서드
		@GetMapping(value="/{rno}", produces = MediaType.APPLICATION_JSON_VALUE)
		public ResponseEntity<ReplyVo> get(@PathVariable Long rno){
			return new ResponseEntity<ReplyVo>(service.read(rno), HttpStatus.OK);
		}
		
}
