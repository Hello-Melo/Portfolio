package sh.hoon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import sh.hoon.model.BoardAttachVO;
import sh.hoon.model.BoardVO;
import sh.hoon.model.Criteria;

public interface BoardMapper {

	List<BoardVO> getList(Criteria criteria);
	BoardVO get(Long bno); 
	void insert(BoardVO vo);
	void update(BoardVO vo);
	void delete(Long bno);
	
	int totalCount(Criteria criteria);

	void updateReplyCnt(
			@Param("bno") Long bno,
			@Param("amount") int amount
			);
		
	List<BoardAttachVO> attachList(Long bno);
}
