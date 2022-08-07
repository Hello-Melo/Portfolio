package sh.hoon.mapper;

import java.util.List;

import sh.hoon.model.AuthVO;
import sh.hoon.model.Criteria;
import sh.hoon.model.MemberVO;

public interface MemberMapper {

	List<MemberVO> getList(Criteria criteria);
	MemberVO get(Long uno);
	void insert(MemberVO vo);
	void update(MemberVO vo);
	void delete(Long uno);
	
	int totalCount(Criteria criteria);
	
	MemberVO findByEmail(String email);
	
	MemberVO read(Long uno);
	
	void insertAuth(AuthVO authVO);
	void updateApprove(MemberVO vo);
	void updateDeni(MemberVO vo);
	void updateDrop(MemberVO vo);
	
}
