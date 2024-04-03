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
}
