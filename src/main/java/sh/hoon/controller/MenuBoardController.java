package sh.hoon.controller;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.CookieValue;
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
import sh.hoon.validation.BoardValidatior;

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
	
	@GetMapping("/free/get")
	public String read(Long bno, Model model,
			@CookieValue(required = false) Cookie viewCount, 
			 HttpServletRequest request, HttpServletResponse response) {
		boolean isAddCount = false;
		
		if(viewCount != null) {
			// 이름이 viewcont 쿠키가 있을때
			String[] viewed = viewCount.getValue().split("/"); // 쿠키값 문자열을 배열로 선언
			System.out.println(viewed.toString());
			//ccontains메서드 사용을 위해 리스트 컬렉션으로 변환
			List<String> viewedList = Arrays.stream(viewed).collect(Collectors.toList());
					if(!viewedList.contains(bno.toString())) {//조회한 게시물 번호가 없다면
						viewCount.setValue(viewCount.getValue()+bno+"/"); //기존 쿠키값 조회한게시물
						response.addCookie(viewCount);//쿠키 없데이트
						isAddCount = true;
					}
			}	else {
			//쿠키가 없을때
			Cookie cookie = new Cookie("viewCount", bno + "/");
			cookie.setMaxAge(60*60*24);
			response.addCookie(cookie);
			isAddCount = true;
			}
		
		BoardVO vo = service.read(bno, isAddCount);
		if(vo == null) throw new NotFoundBoardException();
		model.addAttribute("board", vo);
		return "menu/boardGet";
		
	}
	
	
	@GetMapping("/register2")
	public String registerForm(BoardVO vo, Criteria criteria, Model model) {
		model.addAttribute("criteria", criteria);
		return "board/noticeRegister";
	}
	
	@PostMapping("/register2")
	public String register(@Valid BoardVO vo, Errors errors, RedirectAttributes rttr) {
		
		 new BoardValidatior().validate(vo, errors);
		  if (errors.hasErrors()) {
			  return "/board/noticeRegister"; 
			  }
		
		service.register(vo);
		rttr.addFlashAttribute("result", "register")
				.addFlashAttribute("bno", vo.getBno());
		return "redirect:/notice/" + vo.getCategory();
	}
	
	
	
	@GetMapping("notice/get")
	public String readN(Long bno, Model model,
			@CookieValue(required = false) Cookie viewCount, 
			 HttpServletRequest request, HttpServletResponse response) {
		
	boolean isAddCount = false;
		
		if(viewCount != null) {
			// 이름이 viewcont 쿠키가 있을때
			String[] viewed = viewCount.getValue().split("/"); // 쿠키값 문자열을 배열로 선언
			System.out.println(viewed.toString());
			//ccontains메서드 사용을 위해 리스트 컬렉션으로 변환
			List<String> viewedList = Arrays.stream(viewed).collect(Collectors.toList());
					if(!viewedList.contains(bno.toString())) {//조회한 게시물 번호가 없다면
						viewCount.setValue(viewCount.getValue()+bno+"/"); //기존 쿠키값 조회한게시물
						response.addCookie(viewCount);//쿠키 없데이트
						isAddCount = true;
					}
			}	else {
			//쿠키가 없을때
			Cookie cookie = new Cookie("viewCount", bno + "/");
			cookie.setMaxAge(60*60*24);
			response.addCookie(cookie);
			isAddCount = true;
			}
		
		BoardVO vo = service.read(bno, isAddCount);
		List<BoardAttachVO> list = service.getAttachList(bno);
		if(vo == null) throw new NotFoundBoardException();
		model.addAttribute("board", vo);
		model.addAttribute("list", list);
		
		return "menu/noticeGet";
		
	}
	
	
}
