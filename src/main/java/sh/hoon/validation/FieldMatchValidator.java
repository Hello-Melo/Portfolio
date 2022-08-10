package sh.hoon.validation;

import java.lang.reflect.InvocationTargetException;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.apache.commons.beanutils.BeanUtils;

import sh.hoon.common.FieldMatch;


public class FieldMatchValidator  implements ConstraintValidator<FieldMatch, Object>{

	private String firstFieldName;
	private String secondFieldName;
	private String message; //에러 메세지
	
	//@FieldMatch( first ="conformPassword")
	
	@Override
	public void initialize(FieldMatch constraintAnnotation) {
		firstFieldName = constraintAnnotation.first(); //1234
		secondFieldName = constraintAnnotation.second(); //1234
		message = constraintAnnotation.message();
	}
	
	
	@Override
	public boolean isValid(Object value, ConstraintValidatorContext context) {
		boolean valid = true;
		//검증된 값을 리턴
		
		try {
			Object firstObj = BeanUtils.getProperty(value, firstFieldName);
			Object secondObj = BeanUtils.getProperty(value, secondFieldName);
			valid = firstObj != null && secondObj != null && firstObj.equals(secondObj);
			if(!valid) {
				context.buildConstraintViolationWithTemplate(message)
				.addPropertyNode(firstFieldName)
				.addConstraintViolation()
				.disableDefaultConstraintViolation();
				
			}
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		}
		
		
		return valid;
	}

	

}
