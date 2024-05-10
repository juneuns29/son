package com.human.son.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.human.son.dao.SurveyDao;
import com.human.son.service.SurveyService;
import com.human.son.vo.SurveyVO;

@Controller
@RequestMapping("/survey")
public class Survey {
	@Autowired
	SurveyDao sDao;
	@Autowired
	SurveyService sSrvc;
	
	/**
	 * 설문 문항
	 */
	@RequestMapping("/dataInit.son")
	public ModelAndView dataInit(HttpSession session, ModelAndView mv, RedirectView rv) {
		// 데이터베이스 작업
		String result = sSrvc.setQData();
		// 데이터 전달하고
		mv.addObject("RESULT", result);
		mv.addObject("PATH", "/main.son");
		/*
		// 뷰 셋팅하고
		rv.setUrl("/main.son");
		mv.setView(rv);
		*/
		mv.setViewName("redirect");
		return mv;
	}
	
	/**
	 * 설문조사 리스트 페이지보기 요청 전담 처리함수
	 */
	@RequestMapping("/surveyList.son")
	public ModelAndView surveyList(HttpSession session, ModelAndView mv) {
		// 데이터베이스 조회해서 결과 받고
		List<SurveyVO> list = sSrvc.getTopicList(session);
		
		// 데이터 전달하고
		mv.addObject("LIST", list);
		mv.setViewName("survey/surveyList");
		return mv;
	}
	
	/**
	 * 설문조사 문항 등록 요청 전담 처리함수
	 */
	@RequestMapping("/addSurvey.son")
	public ModelAndView addSurvey(HttpSession session, ModelAndView mv, RedirectView rv, SurveyVO sVO) {
		// 할일
		// 세션검사 ==> 인터셉터에서 처리
		// 데이터베이스 입력작업
		String result = sSrvc.setSurvey(sVO);
		rv.setUrl("/survey/surveyList.son");
		mv.setView(rv);
		return mv;
	}
	
	/**
	 * 설문조사 문항보기 요청 전담 처리함수
	 */
	@RequestMapping("/surveyQuest.son")
	public ModelAndView surveyQuest(HttpSession session, ModelAndView mv, 
											RedirectView rv, SurveyVO sVO) {
		// 데이터베이스 조회해서 데이터 가져오고
		List<SurveyVO> list = sSrvc.getSurvey(sVO);
		
		// 데이터 전달하고
		mv.addObject("LIST", list);
		// 뷰 부르고
		mv.setViewName("survey/surveyQuest");
		return mv;
	}
	
	/**
	 * 설문응답 처리 요청 전담 처리함수
	 */
	@RequestMapping("/surveyAnswer.son")
	public ModelAndView surveyAnswer(HttpSession session, ModelAndView mv, 
											RedirectView rv, SurveyVO sVO) {
		// 데이터베이스 처리 결과 확인하고
		boolean bool = sVO.getQanos().length == sVO.getCnt();
		/*
		if(bool == true) {
			rv.setUrl("/survey/surveyResult.son?tpno=" + sVO.getTpno());
		} else {
			rv.setUrl("/survey/surveyQuest.son?tpno=" + sVO.getTpno());
		}
		// 뷰 셋팅하고
		mv.setView(rv);
		*/
		
		// redirect.jsp 이용하는 방법
		String path = "/survey/surveyResult.son";
		if(!bool) {
			path = "/survey/surveyQuest.son";
		}
		
		// 데이터 전달하고
		mv.addObject("TPNO", sVO.getTpno());
		mv.addObject("PATH", path);
		
		// 뷰 셋팅하고
		mv.setViewName("redirect");
		
		return mv;
	}
	
	/**
	 * 설문조사 결과 페이지 보기 요청 전담 처리함수
	 */
	@RequestMapping("/surveyResult.son")
	public ModelAndView surveyResult(HttpSession session, ModelAndView mv, 
											RedirectView rv, SurveyVO sVO) {
		// 데이터베이스 조회해서 데이터 가져오고
		List<SurveyVO> list = sSrvc.getResult(sVO);
		
		// 데이터 전달하고
		mv.addObject("LIST", list);
		
		// 뷰 부르고
		mv.setViewName("survey/surveyResult");
		return mv;
	}
	
	/**
	 * 설문 추가 폼보기요청 전담 처리함수
	 */
	@RequestMapping("/makeSurvey.son")
	public ModelAndView makeSurvey(ModelAndView mv) {
		// 뷰 정하고
		mv.setViewName("survey/makeSurvey");
		return mv;
	}
	
	/**
	 * 설문조사 문항 리스트 조회요청 전담 처리함수
	 */
	@RequestMapping("/questList.son")
	@ResponseBody
	public List<SurveyVO> getQuestList(){
		List<SurveyVO> list = sDao.getQuestList();
		return list;
	}
	
	/**
	 * 설문조사 문항 리스트 조회요청 전담 처리함수
	 */
	@RequestMapping("/exList.son")
	@ResponseBody
	public List<SurveyVO> getExList(SurveyVO sVO){
		List<SurveyVO> list = sDao.getExList(sVO);
		return list;
	}
	
	/**
	 * 설문 주제 등록 처리 요청 전담 처리함수
	 */
	@RequestMapping("/addTopic.son")
	public @ResponseBody SurveyVO addTopic(SurveyVO sVO) {
		sSrvc.addTopic(sVO);
		return sVO;
	}
	
	/**
	 * 설문 문항 등록 처리 요청 전담 처리함수
	 */
	@RequestMapping("/addQuest.son")
	@ResponseBody
	public SurveyVO addQuest(SurveyVO sVO) {
		// 데이터베이스 저장 작업 
		sSrvc.addQuest(sVO);
		return sVO;
	}
	
	/**
	 * 설문 보기 등록 처리 요청 전담 처리함수
	 */
	@RequestMapping("/addEx.son")
	@ResponseBody
	public SurveyVO addEx(SurveyVO sVO) {
		// 데이터베이스 저장 작업 
		sSrvc.addQuest(sVO);
		return sVO;
	}
	
	/**
	 * 설문 문항 등록 처리 요청 전담 처리함수
	 */
	@RequestMapping("/insertSurvey.son")
	@ResponseBody
	public SurveyVO insertSurvey(SurveyVO sVO) {
		// 데이터베이스 저장 작업 
		sSrvc.insertSurvey(sVO);
		return sVO;
	}
}
