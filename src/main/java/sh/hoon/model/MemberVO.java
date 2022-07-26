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
public class MemberVO {
		
		private Long uno;
		private String userId;
		private String userPw;
		private String userName;
		private String userEmail;
		private LocalDateTime regDate;
		private LocalDateTime updateDate;
		
		
}
