package sh.hoon.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import sh.hoon.AppTest;

public class BoardAttachMapperTest extends AppTest {

	@Autowired
	private BoardAttachMapper mapper;
	
	@Test
	public void testGetOldFiles() {
		mapper.getOldFiles().forEach(boardAttachVO -> {
			System.out.println(boardAttachVO);
		});
		
	}

}
