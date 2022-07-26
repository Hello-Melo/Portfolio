package sh.hoon.config;

import static org.junit.Assert.*;

import javax.sql.DataSource;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import sh.hoon.AppTest;

public class RootConfigTest extends AppTest{

	@Autowired
	DataSource dataSource;
	
	@Test
	public void rootConfigTest() {
		assertNotNull(dataSource);
		
	}

}
