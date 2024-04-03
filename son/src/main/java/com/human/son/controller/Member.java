package com.human.son.controller;

import javax.servlet.http.*;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class Member {
	
	/**
	 * 로그인 화면 보기 요청 전담 처리함수
	 */
	@RequestMapping("/member/login.son")
	public String login(HttpSession session) {
		String view = "member/login";
		
		return view;
	}
}
