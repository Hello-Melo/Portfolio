package sh.hoon.model;

import java.time.LocalDateTime;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class BoardVO {

		private Long bno;
		private String title;
		private String contents;
		private String writer;
		private LocalDateTime regDate;
		private LocalDateTime updateDate;
		private int replyCnt;
		private long viewCount;
		
		private List<BoardAttachVO> attachList;
}
