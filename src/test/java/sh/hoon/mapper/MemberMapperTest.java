package sh.hoon.mapper;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import sh.hoon.AppTest;
import sh.hoon.model.MemberVO;

public class MemberMapperTest extends AppTest{

	@Autowired
	MemberMapper mapper;
	
	@Test
	@Ignore
	public void getListTest() {
		List<MemberVO> list = mapper.getList();
		assertEquals(2, list.size());
	}

	@Test
	@Ignore
	public void getTest() {
		MemberVO vo = mapper.get(1L);
		
	}
	
	@Test
	@Ignore
	public void insertTest() {
		MemberVO vo = new MemberVO();
		for(int i = 0; i < 50; i++) {
			vo.setUserPw("1234");
			vo.setUserName("테스투"+i);
			vo.setUserEmail(i+"test@dream.com");
			mapper.insert(vo);
		}
	}
		
	@Test
	@Ignore
	public void updateTest() {
		MemberVO vo = new  MemberVO();
		vo.setUno(4L);
		vo.setUserPw("1234");
		vo.setUserName("옥승훈");
		vo.setUserEmail("ock87@nate.com");
		mapper.update(vo);
	}
	
	@Test
	@Ignore
	public void deleteTest() {
		mapper.delete(5L);
	}
	
	
	@Test
	@Ignore
	public void readTest() {
		MemberVO vo = mapper.read(4L);
		vo.getAuthList().forEach(authVO -> 
		System.out.println(authVO.getAuth()) );
		
	}
	
}
