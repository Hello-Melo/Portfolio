package sh.hoon.common;

import java.nio.file.AccessDeniedException;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import sh.hoon.exception.NotMatchUserIdException;


@ControllerAdvice
public class GlobalExceptionHandler {
	
	//보통 이곳에는 404, 403, 500 등 대표적 오류들만 모아놓는 다
	// 우리가 만든 클래스를 파라미터로 넣음됨
	@ExceptionHandler(NotMatchUserIdException.class)
	public String notMatchUserId() {
		System.out.println("NotMatchUserIdException 에러 발생요");
		return "errors/error";
	}

	//400에러
	@ExceptionHandler(RuntimeException.class)
	public String runtime() {
		return "errors/error";
	}
	
	//401에러
	@ExceptionHandler(AccessDeniedException.class)
	public String accessDenied() {
		return "errors/error";
	}
	
	//500에러
	@ExceptionHandler(Exception.class)
	public String excption() {
		System.out.println("NotFoundBoardException 에러 발생");
		return "errors/error";
	}
	
	
	//404에러
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String notFoundPage(NoHandlerFoundException e) {
		System.out.println("NotFoundException 에러 발생");
		return "errors/error";
	}
	
	
	
}
