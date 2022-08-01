package sh.hoon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/security")
public class SampleController {

	@GetMapping("/all")
	public String doAll() {
		return "security/all";
	}
	
	@GetMapping("/member")
	public String doMember() {
		return "security/member";
	}
	
	@GetMapping("/admin")
	public String doAdmin() {
		return "security/admin";
	}
	
}
