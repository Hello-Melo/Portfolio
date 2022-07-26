package sh.hoon.mapper;

import java.util.List;

import sh.hoon.model.MemberVO;

public interface MemberMapper {

	List<MemberVO> getList();
	MemberVO get(Long uno);
	void insert(MemberVO vo);
	void update(MemberVO vo);
	void delete(Long uno);
	
	
	
}
