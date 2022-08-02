package sh.hoon.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class HoonLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

		System.out.println("로긴 성공");
		System.out.println(authentication.getAuthorities());
		
		List<String> roleName = new ArrayList<String>();
		
		//authroity로 설정해준 회원권한 얻어오기
		authentication.getAuthorities().forEach(authoity -> {
			roleName.add(authoity.getAuthority());
		});
		//관리자와 회원간의 차이 나타내기
		if(roleName.contains("ADMIN")) {
			System.out.println("관리자 로그인");
			response.sendRedirect(request.getContextPath()+"/sec/member");
			return;
		}
		else if(roleName.contains("MEMBER")) {
			System.out.println("회원 로그인");
			response.sendRedirect(request.getContextPath()+"/sec/member");
			return;
		}
		
		//여기서는 조건이 2개 (회원 / 관리자)뿐이기에 여기까지 올 일은 없다.
		response.sendRedirect(request.getContextPath()+"/sec/member");
	}
	
		
		
	}


