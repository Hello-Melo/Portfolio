package sh.hoon.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import sh.hoon.model.AuthVO;
import sh.hoon.model.Criteria;
import sh.hoon.model.MemberVO;
import sh.hoon.model.PageMaker;
import sh.hoon.service.MemberService;



@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberService service;
	
	@PreAuthorize("hasRole( 'ROLE_ADMIN')")
	@GetMapping("/list")
	public String findAll(Criteria criteria, Model model) {
		PageMaker maker = new PageMaker(criteria, service.totalCount(criteria));
		List<MemberVO> list = service.readAll(criteria);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", maker);
		return "member/approval";
	}
	
	@GetMapping("/register")
	public String registerForm(MemberVO member, Errors errors) {
	
		return "member/register";
	}

	@PostMapping("/register")
	public String register(@Valid MemberVO member, Errors errors ) {
		/*
		 * new MemberValidator().validate(member, errors); if(errors.hasErrors()) {
		 * return "member/register"; }else { service.insert(member); }
		 */
		 service.register(member);
		return "redirect:/";
	}

	@GetMapping("/get")
	public String findByid(Long uno, Model model) {
		MemberVO member = service.read(uno);
		model.addAttribute("member", member);
		return "member/get";
	}
	
	@PostMapping("/remove")
	public String delete(Long id) {
		service.remove(id);
		return "redirect:/";
	}
	
	@GetMapping("/update")
	public String updateForm() {
		return "member/update";
	}
	
	@PostMapping("/update")
	public String update(MemberVO member) {
		service.modify(member);
		return "redirect:/";
	}
	
	@PreAuthorize("hasRole( 'ROLE_ADMIN')")
	@PostMapping("/approve")
	public String approve(Long uno, AuthVO authVO, RedirectAttributes rtts) {
		MemberVO member = service.read(uno);
		System.out.println(member);
		service.insertAuth(authVO);
		service.updateApprove(member);

		rtts.addFlashAttribute("result", "approve")
		  	   .addFlashAttribute("bno", uno);
		return "redirect:/member/list";
	}
	
	@PreAuthorize("hasRole( 'ROLE_ADMIN')")
	@PostMapping("/deni")
	public String deni(Long uno, RedirectAttributes rtts) {
		MemberVO member = service.read(uno);
	
		service.updateDeni(member);

		rtts.addFlashAttribute("result", "deni")
		  	   .addFlashAttribute("bno", uno);
		return "redirect:/member/list";
	}
	
	@PreAuthorize("hasRole( 'ROLE_ADMIN')")
	@PostMapping("/drop")
	public String drop(Long uno, RedirectAttributes rtts) {
		MemberVO member = service.read(uno);
	
		service.updateDrop(member);

		rtts.addFlashAttribute("result", "deni")
		  	   .addFlashAttribute("bno", uno);
		return "redirect:/member/list";
	}
	
}
