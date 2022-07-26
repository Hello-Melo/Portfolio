package sh.hoon.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sh.hoon.mapper.MemberMapper;
import sh.hoon.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper mapper;
	
	@Override
	public List<MemberVO> readAll() {
		return mapper.getList();
	}

	@Override
	public MemberVO read(Long uno) {
		return mapper.get(uno);
	}

	@Override
	public void register(MemberVO vo) {
		mapper.insert(vo);
	}

	@Override
	public void modify(MemberVO vo) {
		mapper.update(vo);
	}

	@Override
	public void remove(Long uno) {
		mapper.delete(uno);
	}

}
