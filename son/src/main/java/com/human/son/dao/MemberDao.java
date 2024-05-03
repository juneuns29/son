package com.human.son.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;

import com.human.son.vo.*;

public class MemberDao {
	@Autowired
	SqlSessionTemplate session;
	
	public int getLogin(MemberVO mVO) {
//		System.out.println("################# dao.login ###############");
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
	
	/**
	 * 회원 아이디 조회 전담 처리함수
	 */
	public List getIdList() {
		return session.selectList("mSQL.idList");
	}
	
	/**
	 * 회원 정보조회 전담 처리함수
	 */
	public MemberVO getMemberInfo(String id) {
		return session.selectOne("mSQL.memberInfo", id);
	}
	
	
}
