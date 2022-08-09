package sh.hoon.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import sh.hoon.model.Criteria;
import sh.hoon.model.ReplyVo;

public interface ReplyService {
	
	List<ReplyVo> readAll(@Param("criteria") Criteria criteria,@Param("bno") Long bno);
	ReplyVo read(Long bno);
	int register(ReplyVo vo);
	int modify(ReplyVo vo);
	int remove(Long bno);
	 
	List<ReplyVo> getReply(String writer);
}
