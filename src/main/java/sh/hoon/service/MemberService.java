package sh.hoon.service;

import java.util.List;

import sh.hoon.model.AuthVO;
import sh.hoon.model.BoardVO;
import sh.hoon.model.Criteria;
import sh.hoon.model.MemberVO;

public interface MemberService {

	List<MemberVO> readAll(Criteria criteria);
	MemberVO read(Long uno);
	void register(MemberVO vo);
	void modify(MemberVO vo);
	void remove(Long uno);
	
	int totalCount(Criteria criteria);
	
	MemberVO findByEmail(String email);
	
	MemberVO getInfo(Long uno);
	
	void insertAuth(AuthVO authVO);
	void updateApprove(MemberVO vo);
	void updateDeni(MemberVO vo);
	void updateDrop(MemberVO vo);
	
}
