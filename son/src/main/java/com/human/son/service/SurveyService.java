package com.human.son.service;

import java.util.ArrayList;
import java.util.List;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.human.son.dao.SurveyDao;
import com.human.son.vo.SurveyVO;

@Aspect
public class SurveyService {
	@Autowired
	SurveyDao sDao;
	
	/**
	 * 입력 문항 갯수 조회 전담 처리함수
	 */
	@Before("execution(* com.human.son.controller.**.**Main(..))")
	public void getQuestCnt(JoinPoint join) {
		int cnt = sDao.getQlistCnt();
		SurveyVO sVO = (SurveyVO)join.getArgs()[1];
		sVO.setCnt(cnt);
	}
	
	/**
	 * 데이터베이스에 문제 정보 입력 전담 처리함수
	 */
	@Transactional
	public String setQData() {
		String result = "NO";
		// 문항 내용들 가져오고
		ArrayList<SurveyVO> list = getQuests();
		// 데이터베이스에 입력하고
		for(int i = 0 ; i < list.size(); i++ ) {
			// 문제 데이터 꺼내고
			SurveyVO sVO = list.get(i);
			// 문제정보 입력
			int cnt = sDao.addQuest(sVO);
			
			if(cnt == 1) {
				result = "OK";
				// 보기들 정보 꺼내고
				ArrayList<SurveyVO> bogis = sVO.getBogis();
				for(int j = 0 ; j < bogis.size(); j++ ) {
					// 보기 한개 정보 꺼내고
					SurveyVO bogi = bogis.get(j);
					// 문제 번호 채워주고
					bogi.setQupno(sVO.getQno());
					// 데이터 베이스에 입력하고
					cnt = sDao.addQuest(bogi);
					result = cnt == 1 ? "OK" : "NO";
				}
			}
		}
		return result;
	}
	
	public ArrayList<String> getTitles(){
		ArrayList<String> list = new ArrayList<String>();
		list.add("원피스 멤버중 최애 멤버는?");
		list.add("갖고 싶은 악마의 열매는?");
		list.add("원피스 최고의 빌런은?");
		list.add("원피스를 처음봤을 때 당신의 나이대는?");
		list.add("원피스 캐릭터중 가장 안습인 캐릭터는?");
		
		return list;
	}
	
	// 보기들을 반환해주는 함수
	public ArrayList<ArrayList<String>> getBogis(){
		ArrayList<ArrayList<String>> list = new ArrayList<ArrayList<String>>();
		// 안쪽 리스트 만들고
		for(int i = 0 ; i < getTitles().size() ; i++ ) {
			ArrayList<String> bogi = new ArrayList<String>();
			list.add(bogi);
		}
		
		// 1번 문항 보기
		list.get(0).add("쵸파");
		list.get(0).add("루피");
		list.get(0).add("조로");
		list.get(0).add("보아 핸콕");
		// 2번 문항 보기
		list.get(1).add("니카니카");
		list.get(1).add("뭉게뭉게");
		list.get(1).add("사람사람");
		list.get(1).add("꽃꽃");
		// 3번 문항 보기
		list.get(2).add("루피");
		list.get(2).add("우솝");
		list.get(2).add("오다");
		list.get(2).add("골드로저");
		// 4번 문항 보기
		list.get(3).add("10대 이하");
		list.get(3).add("20대");
		list.get(3).add("30대");
		list.get(3).add("40대 이상");
		// 5번 문항 보기
		list.get(4).add("스모커");
		list.get(4).add("폭시");
		list.get(4).add("미스터3");
		list.get(4).add("우솝");
		
		return list;
	}
	
	// 문제내용 반환해주는 함수
	public ArrayList<SurveyVO> getQuests(){
		// 리스트 만들고
		ArrayList<SurveyVO> list = new ArrayList<SurveyVO>();
		
		// 리스트 만큼 반복해서 SurveyVO 를 만든다.
		ArrayList<String> titles = getTitles();
		ArrayList<ArrayList<String>> tmp = getBogis();
		
		for(int i = 0 ; i < titles.size(); i++ ) {
			String title = titles.get(i);
			// VO 만들고
			SurveyVO vo = new SurveyVO(); // 문제 하나를 기억할 VO
			// 문제 기억시키고
			vo.setBody(title);
			// 보기 입력하고
			ArrayList<SurveyVO> bogis = new ArrayList<SurveyVO>();
			
			ArrayList<String> imsi = tmp.get(i);
			// 보기 반복
			for(int j = 0 ; j < imsi.size(); j++ ) {
				String bogi = imsi.get(j);
				SurveyVO bogiVO = new SurveyVO(); // 보기하나를 기억할 VO
				bogiVO.setBody(bogi); // 보기하나 내용 입력하고
				
				bogis.add(bogiVO); // 보기리스트에 보기하나 채우고
			}
			vo.setBogis(bogis);
			
			list.add(vo);
		}
		
		return list;
	}
	
	// 설문문항 등록 전담 처리함수
	@Transactional
	public String setSurvey(SurveyVO sVO) {
		String result = "OK";
		int cnt = 0;
		
		// 등록페이지가 없으므로 실제는 없어야 되는 코드
		for(int i = 0 ; i < 25 ; i++ ) {
			sVO.setQno(1001 + i);
			cnt += sDao.setSurvey(sVO);
		}
		
		if(cnt != 25) {
			result = "NO";
		}
		
		return result;
	}
	
	/**
	 * 설문 문항 리스트 조회 데이터베이스 작업 전담 처리함수
	 */
	public List<SurveyVO> getSurvey(SurveyVO sVO){
		// 문항 리스트 조회
		List<SurveyVO> list = sDao.getSurvey(sVO); // 문제만 들어있는 리스트
		// 각 문제별로 보기들 조회
		// VO필요하므로
		for(int i = 0 ; i < list.size(); i++ ) {
			sVO = list.get(i);
			// qupno 셋팅
			sVO.setQupno(sVO.getQno());
			// 보기리스트 조회
			ArrayList<SurveyVO> bogis = (ArrayList<SurveyVO>) sDao.getSurvey(sVO);
			// 보기리스트 셋팅
			sVO.setBogis(bogis);
		}
		
		return list;
	}
}
