package sh.hoon.service;

import java.util.List;

import sh.hoon.model.BoardAttachVO;
import sh.hoon.model.BoardVO;
import sh.hoon.model.Criteria;

public interface BoardService {

	
	List<BoardVO> readAll(Criteria criteria);
	BoardVO read(Long bno,  boolean isAddCount); 
	void register(BoardVO vo);
	void modify(BoardVO vo);
	void remove(Long bno);
	
	int totalCount(Criteria criteria);
	List<BoardAttachVO> getAttachList(Long bno);
	
	List<BoardVO> newList(Criteria criteria);
}
