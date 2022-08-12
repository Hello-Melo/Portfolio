package sh.hoon.validation;

import java.nio.file.spi.FileSystemProvider;
import java.util.Arrays;
import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import sh.hoon.model.BoardVO;


public class BoardValidatior implements Validator {

	private static final String writerRegExp = " ^[가-힣]*$";
	private Pattern pattern;
	
	private String[] words = new String[] {"씨발", "개새끼", "조까", "좆같네", "니미", "닥쳐", "미쳤냐", "디져", "18새끼","시발새끼", "씨팔새끼", "니애미", "니 애미"};

	public BoardValidatior() {
		pattern = Pattern.compile(writerRegExp);
	}

	@Override
	// 보드타입만 검사하는 부분
	public boolean supports(Class<?> clazz) {
		return BoardVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		BoardVO board = (BoardVO) target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "required");

		if (board.getTitle().length() < 3 || board.getTitle().length() >= 100) {
			errors.rejectValue("title", "length");
			return;
		}
		if (board.getWriter() == null || board.getWriter().trim().isEmpty()) {
			errors.rejectValue("writer", "required.writer");
			return;
		}
		
		 if(Arrays.stream(words).anyMatch(v->board.getContents().contains(v))) {
			 System.out.println("욕하지마라!?");
			 errors.rejectValue("contents", "contents");
			 return;
		 }
		
	}
	
}
