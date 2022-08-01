package sh.hoon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {

	@GetMapping("/accessError")
	public String accessDenied() {
		return "error/accessError";
	}
	
	@RequestMapping("/login")
	public String loginForm(String error, Model model) {
		if(error != null) {
			System.out.println(error);
			model.addAttribute("error", error);
		}
		return "member/login";
	}
	
	@GetMapping("/logout")
	public String logout() {
		return "member/logout";
	}
	
	@GetMapping("/join")
	public String join() {
		return "member/join";
	}
	
}
