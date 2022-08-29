package sh.hoon.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;


import sh.hoon.mapper.BoardAttachMapper;
import sh.hoon.model.BoardAttachVO;

@Component
public class FileCheckTask {

	@Autowired
	private BoardAttachMapper attachMapper;
	
	//오늘 폴더와 과거 폴더를 비교해서 사용되지 않는 파일 자동 삭제 메서드
	@Scheduled(cron="0 0 2 * * * ")
	public void checkFiles() {
		System.out.println("작동되는가?");
		
		List<BoardAttachVO> fileList = attachMapper.getOldFiles();
		
		System.out.println(fileList);
		
		List<Path> fileListPaths = fileList.stream().map(vo -> Paths.get(
							"c:/upload/",vo.getUploadPath(),vo.getUuid()+"_"+vo.getFileName()))
							.collect(Collectors.toList());
		
		fileList.stream().filter(vo -> vo.isFileType()==true).map(vo-> Paths.get(
							"c:/upload/"+vo.getUploadPath(), "s_"+vo.getUuid()+"_"+vo.getFileName()))
							.forEach(p -> fileListPaths.add(p));
					
		System.out.println(fileListPaths);
		
		File targetDir = Paths.get("c:/upload/", getFolderYesterDay()).toFile();
		File[] removeFiles = targetDir.listFiles(file-> fileListPaths.contains(file.toPath())==false);
		
		System.out.println(Arrays.toString(removeFiles));
		Arrays.asList(removeFiles).forEach(f->f.delete());
		
	}
	
	
	//어제 업로드된 폴더에서  값가져오기
	private String getFolderYesterDay() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal =  Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		return sdf.format(cal.getTime()).replace("-", File.separator);
	}
	
}
