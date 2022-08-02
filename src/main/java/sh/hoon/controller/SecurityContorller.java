package sh.hoon.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import sh.hoon.exception.NotMatchUserIdException;
import sh.hoon.model.MemberVO;
import sh.hoon.security.HoonUser;

@Controller
public class SecurityContorller {

	@PreAuthorize("hasAnyRole('ROLE_MEMBER', 'ROLE_ADMIN')")
	@GetMapping("/sec/member")
	public String memberPage() {
		return "member/member";
	}
	
	//@PreAuthorize("hasAnyRole('ROLE_MEMBER', 'ROLE_ADMIN')")
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/sec/myPage/{uno}")
	public String myPage(@PathVariable Long uno,
			@AuthenticationPrincipal HoonUser myUser, Model model) {
		//pathvariable 어노테이션은 해당 파라미터를 경로로 사용 할 수 있게 해준다.
		
		MemberVO vo = myUser.getMemberVO();
		if(!vo.getUno().equals(uno)) {
			//예외 발생
			throw new NotMatchUserIdException();
		}
		model.addAttribute("member", vo);
		return "member/myPage";
	}
	
	
}
