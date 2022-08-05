package sh.hoon.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import sh.hoon.mapper.MemberMapper;
import sh.hoon.model.Criteria;
import sh.hoon.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper mapper;
	
	@Autowired
	PasswordEncoder encoder;
	
	@Override
	public List<MemberVO> readAll(Criteria criteria) {
		return mapper.getList(criteria);
	}

	@Override
	public MemberVO read(Long uno) {
		return mapper.get(uno);
	}

	@Override
	public void register(MemberVO vo) {
		String pwEncode = encoder.encode(vo.getUserPw());
		vo.setUserPw(pwEncode);
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

	@Override
	public int totalCount(Criteria criteria) {
		return mapper.totalCount(criteria);
	}

	@Override
	public MemberVO findByEmail(String email) {
		return mapper.findByEmail(email);
	}

}
