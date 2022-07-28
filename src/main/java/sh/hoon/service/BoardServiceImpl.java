package sh.hoon.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sh.hoon.mapper.BoardAttachMapper;
import sh.hoon.mapper.BoardMapper;
import sh.hoon.model.BoardAttachVO;
import sh.hoon.model.BoardVO;
import sh.hoon.model.Criteria;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	
	@Autowired
	private BoardAttachMapper attachMapper;

	@Override
	public BoardVO read(Long bno) {
		return mapper.get(bno);
	}

	@Transactional
	@Override
	public void register(BoardVO vo) {
		mapper.insert(vo);
	
		if(vo.getAttachList() == null || vo.getAttachList().size()==0) return;
		vo.getAttachList().forEach(attach -> {
				attach.setBno(vo.getBno());
				attachMapper.insert(attach);
			});
	}

	@Transactional
	@Override
	public void modify(BoardVO vo) {
		attachMapper.deleteAll(vo.getBno());
		mapper.update(vo);
		if(vo.getAttachList() != null) {
			vo.getAttachList().forEach(attach -> {
				attach.setBno(vo.getBno());
				attachMapper.insert(attach);
			});
		}
	}

	@Transactional
	@Override
	public void remove(Long bno) {
		attachMapper.deleteAll(bno);
		mapper.delete(bno);
	}

	@Override
	public int totalCount(Criteria criteria) {
		return mapper.totalCount(criteria);
	}

	@Override
	public List<BoardVO> readAll(Criteria criteria) {
		return mapper.getList(criteria);
	}

	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		return attachMapper.findByBno(bno);
	}
}
