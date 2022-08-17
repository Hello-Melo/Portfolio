package sh.hoon.model;

import java.time.LocalDateTime;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import sh.hoon.common.FieldMatch;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@FieldMatch( first ="confirmPassword", second="userPw", message="비밀번호가 일치 하지 않습니다.")
public class MemberVO {
		
		private Long uno;
		
		@NotEmpty(message = "이름은 반드시 입력하셔야 합니다.")
		@Pattern(regexp =  "^[가-힣|a-zA-Z]{2,5}$", message="이름은 2~5글자 사이어야 합니다.")
		private String userName;
		
		@Email(message = "이메일 형식이 아닙니다.")
		@NotEmpty(message = "이메일은 반드시 입력하셔야 합니다.")
		private String userEmail;
		
		
		@NotEmpty(message = "비밀번호를 입력하세요.")
		@Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,15}$", message = "비밀번호는 숫자, 문자, 특수문자를 포함한 8~15자리 이내여야합니다.")
		private String userPw;
		private String confirmPassword;
		
		
		@NotEmpty(message = "전화번호를 입력하세요.")
		@Pattern(regexp =  "^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$", message="전화번호를 바르게 입력하세요.")
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
		
		
		@NotEmpty(message = "태어난 년도를 입력하세요.")
		@Pattern(regexp =  "^(19[0-9][0-9]|20\\d{2})$", message="년도는 4자리 숫자로만 입력가능합니다.")
		private String birth1;
		
		
		private String birth2;
		
		@NotEmpty(message = "태어난 일을 입력하세요.")
		@Pattern(regexp =  "^(0[1-9]|[1-2][0-9]|3[0-1])$", message="년도는 4자리 숫자로만 입력가능합니다.")
		private String birth3;
		
		enum GENDER {M, F};
		
		private List<BoardVO> userBoardList;
		
		
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
