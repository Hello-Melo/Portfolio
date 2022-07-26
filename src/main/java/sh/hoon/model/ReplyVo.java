package sh.hoon.model;

import java.time.LocalDateTime;

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
public class ReplyVo {

	private Long rno;
	private Long bno;
	private String reply;
	private String replyer;
	private LocalDateTime regDate;
	private LocalDateTime updateDate; 
	
}
