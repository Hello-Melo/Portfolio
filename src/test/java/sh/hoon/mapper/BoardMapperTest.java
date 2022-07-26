package sh.hoon.mapper;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import sh.hoon.AppTest;
import sh.hoon.model.BoardVO;
import sh.hoon.model.Criteria;

public class BoardMapperTest extends AppTest{

	@Autowired
	BoardMapper mapper;
	
	
	@Test
	@Ignore
	public void getListTest(Criteria criteria) {
		 List<BoardVO> list = mapper.getList(criteria);
		 assertEquals(3, list.size());
	}
	
	
	@Test
	@Ignore
	public void getTest() {
		mapper.get(1L);
	}
	
	@Test
	@Ignore
	public void insertTest() {
		BoardVO vo = new BoardVO();
		for(int i = 1 ; i <402 ; i++) {
		vo.setTitle("제목테스트" + i + "입니다"+ i);
		vo.setContents("내용테스트 입니다" + i);
		vo.setWriter("글쓴이 " + i + " 지롱" + i);
		mapper.insert(vo);
		}
	}
	
	@Test
	@Ignore
	public void updateTest() {
		BoardVO vo = new BoardVO();
		vo.setBno(1L);
		vo.setTitle("제목테스트 --수정");
		vo.setContents("내용테스트 --수정");
		mapper.update(vo);
	}

	
	@Test
	@Ignore
	public void deleteTest() {
		mapper.delete(2L);
	}
	
	
}
