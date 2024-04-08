package com.human.son.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/gboard")
public class Gboard {
	/*
	@Autowired//(required=false)
	GboardDao gDao;
	@Resource(name="gDao")
	GboardDao gDao;
	 */
	
	/**
	 * 방명록 리스트보기 요청 처리함수
	 */
	@RequestMapping("/gboard.son")
	public ModelAndView gboardList(ModelAndView mv) {
		// 뷰 셋팅하고
		mv.setViewName("gboard/gboard");
		return mv;
	}
}
