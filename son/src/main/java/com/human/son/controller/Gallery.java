package com.human.son.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/gallery")
public class Gallery {
	
	/**
	 * 겔러리 게시판 리스트 보기 요청 전담 처리함수
	 */
	 @RequestMapping("/galleryList.son")
	 public ModelAndView galleryList(HttpSession session, ModelAndView mv) {
		 mv.setViewName("gallery/gallery");
		 return mv;
	 }
}
