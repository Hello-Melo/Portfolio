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
		private String userPhone; 
		private String userAddr;
		private String userAddrD;
		private String userBirth;
		private GENDER userGender;
		private int userStatus;
		private int userPass;
		private LocalDateTime regDate;
		private LocalDateTime updateDate;
		
		private List<AuthVO> authList;
		
		private String birth1;
		private String birth2;
		private String birth3;
		
		enum GENDER {M, F};
		
		private List<BoardVO> userBoardList;
		private List<ReplyVo> userReplyList;
		
		
//		 public void setUserBirth() { StringBuilder builder = new StringBuilder();
//		  builder.append(birth1)  .append("-").append(birth2) .append("-") .append(birth3); 
//		  this.userBirth =  builder.toString(); }

	
		public String getUserBirth() {
			if(birth1!=null & birth2!=null & birth3!=null) {
				StringBuilder builder = new StringBuilder();
				builder.append(birth1)
					.append("-")
					.append(birth2)
					.append("-")
					.append(birth3);
					return builder.toString();
			}
			return this.userBirth;
		}
		
}
