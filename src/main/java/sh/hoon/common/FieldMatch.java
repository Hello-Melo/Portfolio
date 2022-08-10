package sh.hoon.common;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

import sh.hoon.validation.FieldMatchValidator;


@Documented
@Constraint(validatedBy = {FieldMatchValidator.class})
@Target({ElementType.TYPE, ElementType.ANNOTATION_TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface FieldMatch {

		String message() default "이 필드들은 서로 부합되어야 합니다.";
		Class<?>[] groups() default{};
		Class<? extends Payload>[]  payload() default{};
		String first(); //첫번째 필드
		String second(); //두번째 필드
	
		@Documented
		@Target({ElementType.TYPE, ElementType.ANNOTATION_TYPE})
		@Retention(RetentionPolicy.RUNTIME)
		@interface List{
			FieldMatch[] value();
		}
}
