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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import sh.hoon.exception.NotFoundBoardException;
import sh.hoon.mapper.BoardAttachMapper;
import sh.hoon.model.BoardAttachVO;
import sh.hoon.model.BoardVO;
import sh.hoon.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService service;
	
	@GetMapping("/register")
	public String registerForm() {
		return "board/register";
	}
	
	@PostMapping("/register")
	public String register(BoardVO vo, RedirectAttributes rttr) {
		
		service.register(vo);
		rttr.addFlashAttribute("result", "register")
				.addFlashAttribute("bno", vo.getBno());
		return "redirect:/list";
	}
	
	@GetMapping("/modify")
	public String modifyForm(Long bno, Model model) {
		BoardVO read = service.read(bno);
		if(read == null) throw new NotFoundBoardException();
		model.addAttribute("board", read);
		return "board/modify";
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO vo, RedirectAttributes rttr) {
		service.modify(vo);
		rttr.addFlashAttribute("result","modify")
			  .addFlashAttribute("bno", vo.getBno());
		return "redirect:/list";
	}
	
	@PostMapping("/remove")
	public String remove(Long bno, RedirectAttributes rttr) {
		List<BoardAttachVO> list = service.getAttachList(bno);
		deleteFiles(list);
		service.remove(bno);
		
		rttr.addFlashAttribute("result","remove")
			  .addFlashAttribute("bno", bno);
		return "redirect:/list";
	}
	
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno) {
		List<BoardAttachVO> attachList = service.getAttachList(bno);

		return new ResponseEntity<>(attachList, HttpStatus.OK);
	}
	
	
	//파일 삭제 메서드
	private void deleteFiles(List<BoardAttachVO> list) { //게시글의 파일리스트를 불러와서 삭제
		//만약 list에 암것도없으면 그대로 나가기
		if (list == null || list.size() == 0)
			return;

		list.forEach(attach -> {
			// uploadPath, uuid, fileName (내가 설정했던 주소 형식을 그대로 써주는것!)

			Path file = Paths.get("c:/upload/" + attach.getUploadPath() + "/" + attach.getUuid() + "_" + attach.getFileName());
			//console창에서 확인
			System.out.println(file);
			try {
				// 파일이 있을시 파일을 삭제, 없을시 무시
				Files.deleteIfExists(file);
				// 만약 파일 형태가 이미지 파일 형태라면 썸네일도 삭제하라는 조건문!
				if (Files.probeContentType(file).startsWith("image")) {
					Path thumbnail = Paths.get("c:/upload/" + attach.getUploadPath() + "/s_" + attach.getUuid() + "_" + attach.getFileName());
					//동일하게 console에서 썸네일 확인
					System.out.println(thumbnail);
					Files.deleteIfExists(thumbnail);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		});
	}

	
	
}
