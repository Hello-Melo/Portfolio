package sh.hoon.mapper;

import java.util.List;

import sh.hoon.model.AuthVO;
import sh.hoon.model.BoardVO;
import sh.hoon.model.Criteria;
import sh.hoon.model.MemberVO;
import sh.hoon.model.ReplyVo;

public interface MemberMapper {

	List<MemberVO> getList(Criteria criteria);
	List<MemberVO> newList(Criteria criteria);
	
	MemberVO get(Long uno);
	void insert(MemberVO vo);
	void update(MemberVO vo);
	void delete(Long uno);
	
	int totalCount(Criteria criteria);
	
	MemberVO findByEmail(String email);
	int selectByEmail(String userEmail);
	
	MemberVO read(Long uno);
	
	MemberVO getInfo(Long uno);
	
	
	void insertAuth(AuthVO authVO);
	void updateApprove(MemberVO vo);
	void updateDeni(MemberVO vo);
	void updateDrop(MemberVO vo);
	void updateAuth(AuthVO authVO);
	
}
