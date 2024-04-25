package com.human.son.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public ModelAndView surveyList(ModelAndView mv) {
		// 데이터베이스 조회해서 결과 받고
		List<SurveyVO> list = sDao.getTopicList();
		
		// 데이터 전달하고
		mv.addObject("LIST", list);
		mv.setViewName("survey/surveyList");
		return mv;
	}
}
