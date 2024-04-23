package com.human.son.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class SurveyDao {
	@Autowired
	SqlSessionTemplate session;
	
	/**
	 * 입력 문항 갯수 조회 전담 처리함수
	 */
	public int getQlistCnt() {
		return session.selectOne("sSQL.qListCnt");
	}
}
