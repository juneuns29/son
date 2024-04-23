package com.human.home.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class SonMain {
	
	@RequestMapping("/")
	public ModelAndView getMain(ModelAndView mv, RedirectView rv) {
		// 뷰 셋팅
		rv.setUrl("/main.son");
		mv.setView(rv);
		return mv;
	}
}
