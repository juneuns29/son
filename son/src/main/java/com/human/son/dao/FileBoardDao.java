package com.human.son.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.human.son.util.PageUtil;
import com.human.son.vo.BoardVO;

public class FileBoardDao {
	@Autowired
	private SqlSessionTemplate session;
	
	public List<BoardVO> getList(PageUtil page){
		return session.selectList("fSQL.selList", page);
	}
	
	/**
	 * 게시글 총 갯수 조회 전담 처리함수
	 */
	public int getTotal() {
		return session.selectOne("fSQL.selTotal");
	}
	
	/**
	 * 글번호로 게시글 상세조회 전담 처리함수
	 */
	public BoardVO getBnoDetail(int bno) {
		return session.selectOne("fSQL.selDetail", bno);
	}
	
	/**
	 * 게시글 내용 데이터베이스 입력 전담 처리함수
	 */
	public int addBoard(BoardVO bVO) {
		return session.insert("fSQL.addBoard", bVO);
	}
}
