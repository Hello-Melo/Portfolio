package sh.hoon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import sh.hoon.model.Criteria;
import sh.hoon.model.ReplyVo;

public interface ReplyMapper {

	// 실제 쓰지 않는 데이터 연결 확인용
	List<ReplyVo> getListAll();
	
	//댓글 페이지 불러오기
	List<ReplyVo> getList(@Param("criteria") Criteria criteria, @Param("bno") Long bno);
	
	//댓글 읽기
	ReplyVo get(Long bno);
	
	//댓글 삽입
	int insert(ReplyVo vo);
	
	//댓글 수정
	int update(ReplyVo vo);
	
	//댓글 삭제
	int delete(Long bno);

}
