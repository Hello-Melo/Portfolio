package sh.hoon.controller;

import static org.junit.Assert.*;
import static org.mockito.Mockito.mock;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import sh.hoon.config.RootConfig;
import sh.hoon.config.ServletConfig;
import sh.hoon.model.MemberVO;
import sh.hoon.service.MemberService;

@RunWith(MockitoJUnitRunner.class)
@ContextConfiguration(classes = {RootConfig.class, ServletConfig.class})
@WebAppConfiguration
public class MemberControllerTest {

	@InjectMocks
	private  MemberController controller;
	
	@Mock
	private MemberService memberService;
	
	private MockMvc mockMvc;
	
	@Before
	public void setUp() throws Exception {
		mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
		
	}
	

	@Test
	public void test() {
		MemberVO vo = mock(MemberVO.class);
		when(vo.getUno())
		
	}

}
