package sh.hoon.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

public class HoonAccessDeniedHandler implements AccessDeniedHandler {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		System.out.println("접근이 거부됨");
		System.out.println(request.getContextPath());
	//접근이 안될때 처리되는 페이지
		// 알아서 처리해주니 편함
		response.sendRedirect(request.getContextPath()+"/accessError");
	}

	
}
