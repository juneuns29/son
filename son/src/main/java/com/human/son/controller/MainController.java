package com.human.son.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.human.son.service.SurveyService;
import com.human.son.vo.SurveyVO;

@Controller
public class MainController {
	
	@RequestMapping("/main.son")
	public ModelAndView goMain(ModelAndView mv, SurveyVO sVO) {
//	public String goMain() {
//		return "main";
//		System.out.println("***************** cnt : " + sVO.getCnt());
		
		// 데이터 전달
		mv.addObject("SCNT", sVO.getCnt());
		
		// 뷰 셋팅
		mv.setViewName("main");
		return mv;
	}
}
