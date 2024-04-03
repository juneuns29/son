package com.human.son.controller;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.view.*;

import com.human.son.dao.*;
import com.human.son.vo.*;

@Controller
@RequestMapping("/member")
public class Member {
	@Autowired
	MemberDao mDao;
	
	/**
	 * 로그인 화면 보기 요청 전담 처리함수
	 */
	@RequestMapping("/login.son")
	public ModelAndView login(HttpSession session, ModelAndView mv, RedirectView rv) {
		String view = "member/login";
		if(session.getAttribute("SID") != null) {
			view = "/main.son";
			rv.setUrl(view);
			mv.setView(rv); // 리다이렉트 
		} else {
			mv.setViewName(view); // 포워드
		}
		return mv;
	}
	
	@RequestMapping("/loginProc.son")
	public ModelAndView loginProc(HttpSession session, ModelAndView mv, RedirectView rv,
			/* String id, String pw, */MemberVO mVO) {
		String view = "/main.son";
		
		if(session.getAttribute("SID") != null) {
			// 이미 로그인 한 경우
			rv.setUrl(view);
			mv.setView(rv);
			return mv;
		}
		
//		System.out.println(mVO.getId() + " - " + mVO.getPw());
		// 로그인 안된경우
		// 데이터베이스 조회
		int cnt = mDao.getLogin(mVO);
		
		if(cnt != 1) {
			view = "/member/login.son";
		} else {
			session.setAttribute("SID", mVO.getId());
		}
		
		rv.setUrl(view);
		mv.setView(rv);
		return mv;
	}
	
	/**
	 * 로그아웃 요청 전담 처리 함수
	 */
	@RequestMapping("/logout.son")
	public ModelAndView logout(HttpSession session, ModelAndView mv, RedirectView rv) {
		String view = "/main.son";
		if(session.getAttribute("SID") != null) {
			session.removeAttribute("SID");
		}
		rv.setUrl(view);
		mv.setView(rv);
		return mv;
	}
}
