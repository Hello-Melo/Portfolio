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
public class MemberVO {
		
		private Long uno;
		private String userEmail;
		private String userName;
		private String userPw;
		private boolean enabled;
		private LocalDateTime regDate;
		private LocalDateTime updateDate;
		
		private List<AuthVO> authList;
		
}
