package sh.hoon.model;

import java.time.LocalDateTime;

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

public class Member {
			
		//이름, 비번, 비번확인, 이메일, 연락처 , 주소, 상세주소, 생년월일
	
	
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
	
	 @NotEmpty(message = "주소를 입력하세요.")
	 @Pattern(regexp =  "^[가-힣]{2,30}$", message="주소는 한글만 입력 가능합니다.")
	private String Addr;
	
	 
	 
	
	private LocalDateTime regDate;
	private LocalDateTime updateDate;
	
}
