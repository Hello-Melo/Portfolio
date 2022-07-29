package sh.hoon.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class BoardAttachVO {

	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	private Long bno;
	
	
	//
	//이건 이름을 새로 지어주는것!
	//나중에 uploadPath와 uuid를 빼고 구해보자!
	public String getImageName() {
		StringBuilder builder = new StringBuilder();
		builder.append(uploadPath.replace("\\", "/"))
			.append("/")
			.append(uuid)
			.append("_")
			.append(fileName);
		return builder.toString();
	}
	
}
