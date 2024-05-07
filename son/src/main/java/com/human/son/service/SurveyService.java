package com.human.son.service;

import java.util.*;

import javax.servlet.http.*;

import org.aspectj.lang.*;
import org.aspectj.lang.annotation.*;
import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.transaction.annotation.*;

import com.human.son.dao.SurveyDao;
import com.human.son.vo.SurveyVO;

@Aspect
public class SurveyService {
	@Autowired
	SurveyDao sDao;
	
	private static final Logger svrLog = LoggerFactory.getLogger("surveyLog");
	
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
	
	/**
	 * 설문 문항 리스트 조회 데이터베이스 작업 전담 처리함수
	 */
	public List<SurveyVO> getResult(SurveyVO sVO){
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
			
			for(SurveyVO vo : bogis) {
				double per = sDao.getPer(vo);
				vo.setPer(per);
			}
			
			// 보기리스트 셋팅
			sVO.setBogis(bogis);
		}
		
		return list;
	}
	
	/**
	 * 설문 응답 입력 서비스 함수
	 */
	@Before("execution(* com.human.son.controller.Survey.surveyAnswer(..))")
	@Transactional
	public void addAnswer(JoinPoint join) {
		// 할일
		// 세션에서 아이디 꺼내고
		HttpSession session = (HttpSession) join.getArgs()[0];
		String id = (String) session.getAttribute("SID");
		
		// VO 꺼내고
		SurveyVO sVO = (SurveyVO) join.getArgs()[3];
		// 꺼낸 아이디 VO에 입력하고
		sVO.setId(id);
		/*
			컨트롤러에서 받은 파라미터에는
			선택한 응답 번호들이
			배열로 채워져있다.
			이것을 배열길이만큼 반복해서
			하나씩 꺼내서 응답번호에 채워줘야 한다.
		 */
		// 응답 번호 배열 꺼내고
		int[] arr = sVO.getQanos();
		
		int cnt = 0 ;
		for(int i = 0 ; i < arr.length ; i++ ) {
			// n번째 응답 번호 꺼내고
			int tmp = arr[i];
			// 꺼낸 응답번호 VO에 셋팅하고
			sVO.setQano(tmp);
			
			// 필요한 데이터가 모두 준비되었으니 데이터베이스에 전송해서 입력
			cnt += sDao.addAnswer(sVO);
		}
		
		sVO.setCnt(cnt);
		if(cnt == arr.length) {
			// 로그 남기고
			svrLog.info(sVO.getId() + " 님이 [ " + sVO.getTpno() + " ] 번 설문에 참여했습니다.");
		}
		
	}
	
	/**
	 * 설문 주제 리스트 조회 전담 처리함수
	 */
	public List<SurveyVO> getTopicList(HttpSession session){
		String id = (String) session.getAttribute("SID");
		List<SurveyVO> list = sDao.getTopicList();
		
		if(id != null) {
			for(SurveyVO vo : list) {
				vo.setId(id);
				int cnt = sDao.answerCnt(vo);
				vo.setAnswerCnt(cnt);
			}
		}
		
		return list;
	}
	
	/**
	 * 설문주제 입력 전담 처리 서비스함수
	 */
	public void addTopic(SurveyVO sVO) {
		// tpno, result가 아직 채워져 있지 않은 상태
		String result = sDao.addTopic(sVO) == 1 ? "OK" : "NO";
		sVO.setResult(result);
		// tpno, result가 채워져있는 상태
	}
}
