package com.human.son.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.view.*;

@Controller
@RequestMapping("/fboard")
public class FileBoard {
	
	@RequestMapping("/fileboard.son")
	public ModelAndView boardList(HttpSession session, ModelAndView mv, RedirectView rv) {
		mv.setViewName("fboard/fileboard");
		return mv;
	}
}
