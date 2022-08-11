package sh.hoon.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

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
@Component
public class LoginFailureHandler implements AuthenticationFailureHandler {

	@Value("loginEmail")
	private String loginEmail;
	
	@Value("loginPw")
	private String loginPw;
	
	
	@Value("errorMessage")
	private String errorMessage;
	
	@Value("/login")
	private String defaultFailureUrl;
	
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		System.out.println("Login Failure");
		String username = request.getParameter(loginEmail);
		String password = request.getParameter(loginPw);
		String errormsg = request.getParameter(errorMessage);
		
		//메시지 출력은 instaceof(타입이 맞냐 아니냐 체크_
		if(exception instanceof BadCredentialsException) {
			errormsg = "비밀번호가 일치하지 않습니다";
		}
		
		// jsp 처럼 setattribute를 통해 앞은 jsp로 던져줄 표현식 파라미터, 뒤는 뒤에서설정한 이름들
		request.setAttribute(loginEmail, username);
		request.setAttribute(loginPw, password);
		request.setAttribute(errorMessage, errormsg);
		
		request.getRequestDispatcher(defaultFailureUrl)
					.forward(request, response);
	}

}
