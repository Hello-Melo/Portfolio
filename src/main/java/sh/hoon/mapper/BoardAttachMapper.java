package sh.hoon.mapper;

import java.util.List;

import sh.hoon.model.BoardAttachVO;

public interface BoardAttachMapper {

	void insert(BoardAttachVO vo);
	void delete(String uuid);
	List<BoardAttachVO> findByBno(Long bno);
	
	public void deleteAll(Long bno);
	
	public List<BoardAttachVO> getOldFiles();
}
