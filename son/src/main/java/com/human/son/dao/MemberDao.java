package com.human.son.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.human.son.vo.MemberVO;

public class MemberDao {
	@Autowired
	SqlSessionTemplate session;
	
	public int getLogin(MemberVO mVO) {
		return session.selectOne("mSQL.login", mVO);
	}
	
	/**
	 * 아이디 체크 데이터베이스 작업 전담 처리함수
	 */
	public int idCheck(String id) {
		return session.selectOne("mSQL.idCheck", id);
	}
	
	/**
	 * 회원 정보 입력 전담 처리함수
	 */
	public int addMemb(MemberVO mVO) {
		return session.insert("mSQL.addMember", mVO);
	}
}
