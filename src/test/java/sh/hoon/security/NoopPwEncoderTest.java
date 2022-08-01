package sh.hoon.security;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;

import sh.hoon.AppTest;

public class NoopPwEncoderTest extends AppTest{

	@Autowired
	private PasswordEncoder encoder;
	
	@Test
	public void test() {
		String str = "member";
		String enStr = encoder.encode(str);
		
		System.out.println(enStr);
	}

}
