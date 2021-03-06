package sh.hoon.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import sh.hoon.exception.NotFoundBoardException;
import sh.hoon.mapper.BoardAttachMapper;
import sh.hoon.model.BoardAttachVO;
import sh.hoon.model.BoardVO;
import sh.hoon.model.Criteria;
import sh.hoon.model.ReplyVo;
import sh.hoon.service.BoardService;
import sh.hoon.service.ReplyService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService service;
	
	@Autowired
	private ReplyService replyService;
	
	@GetMapping("/register")
	public String registerForm(Criteria criteria, Model model) {
		model.addAttribute("criteria", criteria);
		return "board/register";
	}
	
	@PostMapping("/register")
	public String register(BoardVO vo, RedirectAttributes rttr) {
		
		service.register(vo);
		rttr.addFlashAttribute("result", "register")
				.addFlashAttribute("bno", vo.getBno());
		return "redirect:/list/" + vo.getCategory();
	}
	
	@GetMapping("/modify")
	public String modifyForm(Long bno, Model model) {
		BoardVO read = service.read(bno);
		if(read == null) throw new NotFoundBoardException();
		model.addAttribute("board", read);
		return "board/modify";
	}
	
	@GetMapping("/modify2")
	public String modifyForm2(Long bno, Model model) {
		BoardVO read = service.read(bno);
		if(read == null) throw new NotFoundBoardException();
		model.addAttribute("board", read);
		return "board/noticeModify";
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO vo, RedirectAttributes rttr) {
		service.modify(vo);
		System.out.println("???????????? : "+vo.getCategory());
		rttr.addFlashAttribute("result","modify")
			  .addFlashAttribute("bno", vo.getBno());
		return "redirect:/list/"+ vo.getCategory();
	}
	
	@PostMapping("/modify2")
	public String modify2(BoardVO vo, RedirectAttributes rttr) {
		service.modify(vo);
		System.out.println("???????????? : "+vo.getCategory());
		rttr.addFlashAttribute("result","modify")
			  .addFlashAttribute("bno", vo.getBno());
		return "redirect:/notice/"+ vo.getCategory();
	}
	
	
	@PostMapping("/remove")
	public String remove(Long bno, RedirectAttributes rttr) {
		String category = service.read(bno).getCategory();
		System.out.println("??????????????? : " + category);
		List<BoardAttachVO> list = service.getAttachList(bno);
		deleteFiles(list);
		service.remove(bno);
		
		rttr.addFlashAttribute("result","remove")
			  .addFlashAttribute("bno", bno);
		return "redirect:/list/"+ category;
	}
	
	@PostMapping("/remove2")
	public String remove2(Long bno, RedirectAttributes rttr) {
		String category = service.read(bno).getCategory();
		System.out.println("??????????????? : " + category);
		List<BoardAttachVO> list = service.getAttachList(bno);
		deleteFiles(list);
		service.remove(bno);
		
		rttr.addFlashAttribute("result","remove")
			  .addFlashAttribute("bno", bno);
		return "redirect:/notice/"+ category;
	}
	
	
	
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno) {
		List<BoardAttachVO> attachList = service.getAttachList(bno);

		return new ResponseEntity<>(attachList, HttpStatus.OK);
	}
	
	
	//?????? ?????? ?????????
	private void deleteFiles(List<BoardAttachVO> list) { //???????????? ?????????????????? ???????????? ??????
		//?????? list??? ?????????????????? ????????? ?????????
		if (list == null || list.size() == 0)
			return;

		list.forEach(attach -> {
			// uploadPath, uuid, fileName (?????? ???????????? ?????? ????????? ????????? ????????????!)

			Path file = Paths.get("c:/upload/" + attach.getUploadPath() + "/" + attach.getUuid() + "_" + attach.getFileName());
			//console????????? ??????
			System.out.println(file);
			try {
				// ????????? ????????? ????????? ??????, ????????? ??????
				Files.deleteIfExists(file);
				// ?????? ?????? ????????? ????????? ?????? ???????????? ???????????? ??????????????? ?????????!
				if (Files.probeContentType(file).startsWith("image")) {
					Path thumbnail = Paths.get("c:/upload/" + attach.getUploadPath() + "/s_" + attach.getUuid() + "_" + attach.getFileName());
					//???????????? console?????? ????????? ??????
					System.out.println(thumbnail);
					Files.deleteIfExists(thumbnail);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		});
	}

	
	
}
