package sh.hoon.mapper;

import static org.junit.Assert.*;

import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import sh.hoon.AppTest;
import sh.hoon.model.Criteria;
import sh.hoon.model.ReplyVo;

public class ReplyMapperTest extends AppTest {

	@Autowired
	ReplyMapper mapper;
	
	//댓글 불러오기 테스트
	@Test
	@Ignore
	public void getListTest(Criteria criteria, Long bno) {
		mapper.getList(criteria, bno).forEach(vo -> System.out.println(vo));
	}
	
	// 댓글 등록 테스트
	@Test
	@Ignore
	public void insertTest() {
		ReplyVo vo = new ReplyVo();
		vo.setBno(1L);
		vo.setReply("Who are you? What did you say?");
		vo.setReplyer("테스터훈");
		mapper.insert(vo);
	}
	
}
