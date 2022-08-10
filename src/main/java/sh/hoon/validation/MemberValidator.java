package sh.hoon.validation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import sh.hoon.mapper.MemberMapper;
import sh.hoon.model.MemberVO;


@Component
public class MemberValidator implements Validator {

	@Autowired
	MemberMapper mapper;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return MemberVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		//다운캐스팅! object가 상위! 
		MemberVO member = (MemberVO) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userName", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "required");
		System.out.println(mapper);
		System.out.println(member.getUserEmail());
		if(mapper.findByEmail(member.getUserEmail()) != null) {
			errors.rejectValue("email", "checkEmail");
			return;
		}
	}

}
