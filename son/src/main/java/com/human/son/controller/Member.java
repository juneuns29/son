package com.human.son.controller;

import java.util.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.view.*;

import com.human.son.dao.*;
import com.human.son.vo.*;
import com.human.son.util.*;

@Controller
@RequestMapping("/member")
public class Member {
	@Autowired
	MemberDao mDao;
	
	@Autowired
	ColorList color;
	
	/**
	 * 로그인 화면 보기 요청 전담 처리함수
	 */
	@RequestMapping("/login.son")
	public ModelAndView login(HttpSession session, ModelAndView mv, RedirectView rv) {
		String view = "member/login";
		mv.setViewName(view); // 포워드
		return mv;
	}
	
	@RequestMapping("/loginProc.son")
	public ModelAndView loginProc(HttpSession session, ModelAndView mv, RedirectView rv, 
														MemberVO mVO, String id, String pw) {
		String view = "/main.son";
		
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
		session.removeAttribute("SID");
		rv.setUrl(view);
		mv.setView(rv);
		return mv;
	}
	
	/**
	 * 회원가입 폼보기 요청 전담 처리 함수
	 */
	@RequestMapping("/join.son")
	public ModelAndView join(HttpSession session, ModelAndView mv, RedirectView rv) {
		mv.setViewName("member/join"); // 포워드
		return mv;
	}
	
	/**
	 * 아이디 체크 요청 전담 처리함수
	 */
	@RequestMapping("/idCheck.son")
	@ResponseBody
	public HashMap idCheck(String id) {
		HashMap map = new HashMap();
		// 데이터베이스 조회
		int cnt = mDao.idCheck(id);
		String result = "NO";
		if(cnt == 0) {
			result ="YES";
		}
		map.put("result", result);
		/*
			==>
			{
				"result": "YES"
			}
		 */
		return map;
	}
	
	/**
	 * 회원가입 처리 요청 전담 처리함수
	 */
	@RequestMapping("/joinProc.son")
	public ModelAndView joinProc(HttpSession session, ModelAndView mv, 
											RedirectView rv, MemberVO mVO) {
		// 데이터베이스 작업
		int cnt = mDao.addMemb(mVO);
		
		// 뷰 셋팅하고
		if(cnt == 1) {
			// 회원가입에 성공한 경우
			// 세션에 아이디 기억시키고
			session.setAttribute("SID", mVO.getId());
			// 뷰 셋팅하고
			rv.setUrl("/main.son");
		} else {
			// 회원가입에 실패한 경우
			rv.setUrl("/member/join.son");
		}
		mv.setView(rv);
		
		return mv;
	}
	
	/**
	 * 회원리스트 폼보기 요청 전담 처리함수
	 */
	@RequestMapping("/memberList.son")
	public ModelAndView memberList(HttpSession session, ModelAndView mv, RedirectView rv) {
		// 할일
		// 뷰 정하고
		String view = "member/memberList";
		
		// 데이터베이스 조회
		List list = mDao.getIdList();
		// 데이터 기억시키고
		mv.addObject("LIST", list);
		mv.addObject("COLOR", color.getColorList());
		// 뷰 기억시키고
		mv.setViewName(view); // forward(jsp문서)
		
		return mv;
	}
	
	/**
	 * 회원 정보 조회 전담 처리함수
	 */
	@RequestMapping("/memberInfo.son")
	@ResponseBody
	public MemberVO memberInfo(String id) {
		MemberVO mVO = mDao.getMemberInfo(id);
		return mVO;
	}
	
	/**
	 * 로그인 회원정보 조회 요청 전담 처리함수
	 */
	@RequestMapping("/myInfo.son")
	public ModelAndView myInfo(HttpSession session, ModelAndView mv, 
											RedirectView rv, MemberVO mVO, String id) {
		// 할일
		// 아이디로 조회해서 반환값 받고
		mVO = mDao.getMemberInfo(id);
		
		// 데이터 심고
		mv.addObject("DATA", mVO);
		mv.setViewName("member/myInfo");
		// 반환값 반환하고
		return mv;
	}
}
