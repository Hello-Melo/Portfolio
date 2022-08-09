package sh.hoon.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sh.hoon.mapper.BoardMapper;
import sh.hoon.mapper.ReplyMapper;
import sh.hoon.model.Criteria;
import sh.hoon.model.ReplyVo;

@Service
public class ReplyServiceImpl implements ReplyService {

	//댓글이 생성되거나 제거될때 증감하는 상수 선언!
	private final static int Reply_ADD = 1;
	private final static int Reply_DEL = -1;
	
	@Autowired
	ReplyMapper mapper;
	
	@Autowired
	BoardMapper boardMapper;


	@Override
	public ReplyVo read(Long bno) {
		return mapper.get(bno);
	}

	// 트랜잭션을 설정해서 댓글이 입력될때마다 댓글수를 1씩 증가!
	@Transactional
	@Override
	public int register(ReplyVo vo) {
		boardMapper.updateReplyCnt(vo.getBno(), Reply_ADD);
		return mapper.insert(vo);
	}


	@Override
	public int modify(ReplyVo vo) {
		return mapper.update(vo);
	}

	// 트랜잭션을 설정해서 댓글이 입력될때마다 댓글수를 1씩 감소!
	@Transactional
	@Override
	public int remove(Long rno) {
		boardMapper.updateReplyCnt(mapper.get(rno).getBno(), Reply_DEL);
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVo> readAll(Criteria criteria, Long bno) {
		return mapper.getList(criteria, bno);
	}

	@Override
	public List<ReplyVo> getReply(String writer) {
		// TODO Auto-generated method stub
		return mapper.userReplyList(writer);
	}

	
	
}
