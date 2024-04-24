package com.human.son.controller;

import java.util.*;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.human.son.dao.SurveyDao;
import com.human.son.vo.*;

@Controller
@RequestMapping("/survey")
public class Survey {
	@Autowired
	SurveyDao sDao;
	
	/**
	 * 설문 문항
	 */
	@RequestMapping("/dataInit.son")
	public ModelAndView dataInit(HttpSession session, ModelAndView mv, RedirectView rv) {
		// 데이터베이스 작업
		String result = "";
		
		// 데이터 전달하고
		mv.addObject("RESULT", result);
		// 뷰 셋팅하고
		rv.setUrl("/main.son");
		mv.setView(rv);
		return mv;
	}
}
