package sh.hoon.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import sh.hoon.model.BoardAttachVO;

import net.coobird.thumbnailator.Thumbnailator;

@Controller
public class UploadController {

		@GetMapping("/uploadForm")
		public String uploadForm() {
			return "uploadForm";
		}
		
		//form 형식의 파일업로드
		@PostMapping("/uploadFormAction")
		public void uploadFormAction(MultipartFile[] uploadFile, Model model) {
			for(MultipartFile file : uploadFile) {
				File saveFile = new File("c:\\upload", file.getOriginalFilename());
				try {
					file.transferTo(saveFile);
				
				} catch (IllegalStateException  e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		@GetMapping("/uploadAjax")
		public String uploadAjax() {
			return "uploadAjax";
		}
	
		//업로드 메서드
		@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
		@ResponseBody
		public ResponseEntity<List<BoardAttachVO>> uploadAjaxAction(MultipartFile[] uploadFile) {
			List<BoardAttachVO> list = new ArrayList<BoardAttachVO>(); // 리스트 생성

			File uploadPath = new File("c:\\upload", getFolder());
			if (!uploadPath.exists()) {
				uploadPath.mkdirs();
			}

			for (MultipartFile file : uploadFile) {
				BoardAttachVO attachVO = new BoardAttachVO();
				String uploadFilename = file.getOriginalFilename();
				attachVO.setFileName(uploadFilename); // uuid 생성전

				UUID uuid = UUID.randomUUID();
				uploadFilename = uuid.toString() + "_" + uploadFilename;

				File saveFile = new File(uploadPath, uploadFilename);
				try {
					file.transferTo(saveFile);
					attachVO.setUuid(uuid.toString());
					attachVO.setUploadPath(getFolder());
					if (checkImageType(saveFile)) {
						attachVO.setFileType(true);
						FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFilename));
						Thumbnailator.createThumbnail(file.getInputStream(), thumbnail, 100, 100);
					}
					list.add(attachVO);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			return new ResponseEntity<List<BoardAttachVO>>(list, HttpStatus.OK);
		}
		
		// 썸네일 이미지 보여주기
		@GetMapping("/display")
		@ResponseBody
		public ResponseEntity<byte[]> getFile(String fileName) {
			File file = new File("c:\\upload\\" + fileName);
			ResponseEntity<byte[]> result = null;

			HttpHeaders headers = new HttpHeaders();

			try {
				headers.add("Content-Type", Files.probeContentType(file.toPath()));
				result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
				System.out.println(result);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return result;
		}
		
		//파일 다운로드 메서드
		@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
		@ResponseBody
		public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName) {
			Resource resource = new FileSystemResource("c:\\upload\\" + fileName);
			HttpHeaders headers = new HttpHeaders();
			if (!resource.exists()) {
				System.out.println("파일이 존재하지 않음");
				return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
			}
			String resourceName = resource.getFilename();
			String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);

			String downloadName = null;

			try {
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8");
				headers.add("Content-Disposition", "attachment; fileName=" + downloadName);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}

			return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
		}
		
		// 파일 삭제
		@PostMapping("/deleteFile")
		@ResponseBody
		public ResponseEntity<String> deleteFile(String fileName, String type) {
			File file;

			try {
				// 일반파일, 이미지 썸네일 삭제
				file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "utf-8"));
				file.delete();
				if (type.equals("image")) {// 이미지 삭제 조건
					String largeFileName = file.getAbsolutePath().replace("s_", "");
					file = new File(largeFileName);
					file.delete();
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace(); // 만약 인코딩 예외가 뜨면 요걸 반환
				return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
			}
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}
		
		
		
		//폴더 이름 생성 메서드
		private String getFolder() {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String str = sdf.format(date);
			return str.replace("-", File.separator);
		}

		//파일 타입 체크 메서드(이미지인가 아닌가)
		private boolean checkImageType(File file) {
			try {
				String contentType = Files.probeContentType(file.toPath());
				return contentType.startsWith("image");
			} catch (Exception e) {
				e.printStackTrace();
			}	
			return false;
			
		}
	
}
