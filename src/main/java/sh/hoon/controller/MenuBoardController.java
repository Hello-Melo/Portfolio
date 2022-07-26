package sh.hoon.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import sh.hoon.exception.NotFoundBoardException;
import sh.hoon.model.BoardVO;
import sh.hoon.model.Criteria;
import sh.hoon.model.PageMaker;
import sh.hoon.service.BoardService;

@Controller
@RequestMapping
public class MenuBoardController {
	
	@Autowired
	BoardService service;
	
	@GetMapping("/intro")
	public String intro() {
		return "menu/boardIntro";
	}
	
	@GetMapping("/notice")
	public String notice() {
		return "menu/boardNotice";
	}
	
	@GetMapping("/table")
	public String table() {
		return "menu/boardTable";
	}
	
	@GetMapping("/map")
	public String map() {
		return "menu/boardMap";
	}

	@GetMapping("/chat")
	public String chat() {
		return "menu/boardChat";
	}
	
	@GetMapping("/join")
	public String join() {
		return "member/join";
	}
	
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	
	@GetMapping("/list")
	public String readAll(Criteria criteria, Model model) {
		PageMaker maker = new PageMaker(criteria, service.totalCount(criteria));
		
		List<BoardVO> list = service.readAll(criteria);
		model.addAttribute("pageMaker", maker);
		model.addAttribute("list", list);
		return "menu/boardList";
	}
	
	@GetMapping("/get")
	public String read(Long bno, Model model) {
		BoardVO vo = service.read(bno);
		if(vo == null) throw new NotFoundBoardException();
		model.addAttribute("board", vo);
		return "menu/boardGet";
		
	}
	
	
	
	
}
