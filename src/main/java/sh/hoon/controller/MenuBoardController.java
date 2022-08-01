package sh.hoon.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import sh.hoon.exception.NotFoundBoardException;
import sh.hoon.model.BoardAttachVO;
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
	
	@GetMapping("/notice/{category}")
	public String notice(@PathVariable String category, Criteria criteria, Model model) {
		criteria.setCategory(category);
		PageMaker maker = new PageMaker(criteria, service.totalCount(criteria));
		
		List<BoardVO> list = service.readAll(criteria);
		model.addAttribute("pageMaker", maker);
		model.addAttribute("list", list);
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
	
	@GetMapping("/list/{category}")
	public String readAll(@PathVariable String category, Criteria criteria, Model model) {
		criteria.setCategory(category);
		PageMaker maker = new PageMaker(criteria, service.totalCount(criteria));
		
		List<BoardVO> list = service.readAll(criteria);
		model.addAttribute("category", category);
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
	
	
	@GetMapping("/register2")
	public String registerForm(Criteria criteria, Model model) {
		model.addAttribute("criteria", criteria);
		return "board/noticeRegister";
	}
	
	@PostMapping("/register2")
	public String register(BoardVO vo, RedirectAttributes rttr) {
		
		service.register(vo);
		rttr.addFlashAttribute("result", "register")
				.addFlashAttribute("bno", vo.getBno());
		return "redirect:/notice/" + vo.getCategory();
	}
	
	
	
	@GetMapping("notice/get")
	public String readN(Long bno, Model model) {
		BoardVO vo = service.read(bno);
		List<BoardAttachVO> list = service.getAttachList(bno);
		if(vo == null) throw new NotFoundBoardException();
		model.addAttribute("board", vo);
		model.addAttribute("list", list);
		
		return "menu/noticeGet";
		
	}
	
	
}
