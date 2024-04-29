package com.human.son.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.human.son.vo.SurveyVO;

public class SurveyDao {
	@Autowired
	SqlSessionTemplate session;
	
	/**
	 * 입력 문항 갯수 조회 전담 처리함수
	 */
	public int getQlistCnt() {
		return session.selectOne("sSQL.qListCnt");
	}
	
	/**
	 * 문제 입력 전담 처리함수
	 */
	public int addQuest(SurveyVO sVO) {
		return session.insert("sSQL.addQuest", sVO);
	}
	
	/**
	 * 현재 진행중인 설문조사 갯수 조회 전담 처리함수
	 */
	public int getIngCnt() {
		return session.selectOne("sSQL.ingCnt");
	}
	
	/**
	 * 설문 리스트 조회 전담 처리함수
	 */
	public List<SurveyVO> getTopicList(){
		return session.selectList("sSQL.surveyList");
	}
	
	/**
	 * 설문조사 문항등록 전담 처리함수
	 */
	public int setSurvey(SurveyVO sVO) {
		return session.insert("sSQL.setSurvey", sVO);
	}
	
	/**
	 * 설문 문항 조회 전담 처리함수
	 */
	public List<SurveyVO> getSurvey(SurveyVO sVO){
		return session.selectList("sSQL.getQList", sVO);
	}
	
	/**
	 * 설문 응답 데이터베이스 입력 전담 처리함수
	 */
	public int addAnswer(SurveyVO sVO) {
		return session.insert("sSQL.addAnswer", sVO);
	}
}
