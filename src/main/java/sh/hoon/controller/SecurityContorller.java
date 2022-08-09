package sh.hoon.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import sh.hoon.exception.NotMatchUserIdException;
import sh.hoon.model.BoardVO;
import sh.hoon.model.Criteria;
import sh.hoon.model.MemberVO;
import sh.hoon.model.ReplyVo;
import sh.hoon.security.HoonUser;
import sh.hoon.service.BoardService;
import sh.hoon.service.MemberService;
import sh.hoon.service.ReplyService;

@Controller
public class SecurityContorller {
	
	@Autowired
	MemberService service;
	
	@Autowired
	ReplyService replyService;
	
	@Autowired
	BoardService boardService;

	@PreAuthorize("hasAnyRole('ROLE_MEMBER', 'ROLE_ADMIN')")
	@GetMapping("/sec/member")
	public String memberPage() {
		return "member/member";
	}
	
	@PreAuthorize("hasRole( 'ROLE_ADMIN')")
	@GetMapping("/sec/admin")
	public String adminPage(@AuthenticationPrincipal HoonUser myUser ,Criteria criteria, Model model) {
		List<MemberVO> memeber = service.readAll(criteria);
		List<BoardVO> list = boardService.newList(criteria);
		MemberVO vo = myUser.getMemberVO();
		
		model.addAttribute("member", vo);
		model.addAttribute("list", list);
		model.addAttribute("memberList", memeber);
		return "member/admin";
	}
	
	
	
	//@PreAuthorize("hasAnyRole('ROLE_MEMBER', 'ROLE_ADMIN')")
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/sec/myPage/{uno}")
	public String myPage(@PathVariable Long uno,
			@AuthenticationPrincipal HoonUser myUser, Model model) {
		//pathvariable 어노테이션은 해당 파라미터를 경로로 사용 할 수 있게 해준다.
		
		MemberVO info = service.getInfo(uno);
		MemberVO vo = myUser.getMemberVO();
		List<ReplyVo> replyVo = replyService.getReply(vo.getUserName());
		if(!vo.getUno().equals(uno)) {
			//예외 발생
			throw new NotMatchUserIdException();
		}
		model.addAttribute("member", vo);
		model.addAttribute("info", info);
		model.addAttribute("replyVo", replyVo);
		return "member/myPage";
	}
	

}
