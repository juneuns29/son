package com.human.son.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.human.son.dao.GboardDao;
import com.human.son.util.PageUtil;
import com.human.son.vo.BoardVO;

@Controller
@RequestMapping("/gboard")
public class Gboard {
	@Autowired
	GboardDao gDao;
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
	public ModelAndView gboardList(HttpSession session, ModelAndView mv, 
											RedirectView rv, PageUtil page) {
		// 페이지 셋팅
		// 현재 페이지 셋팅
		int nowPage = page.getNowPage();
		if(nowPage == 0) {
			nowPage = 1;
		}
		// 총게시글 갯수 셋팅
		int totalCnt = gDao.getTotal();
		page.setPage(nowPage, totalCnt);
		
		mv.addObject("PAGE", page);
		
		// 로그인 여부 판별
		String sid = (String) session.getAttribute("SID");
		if(sid != null) {
			// 로그인 한 경우
			// 카운트 조회하고
			int cnt = gDao.getCnt(sid);
			// 데이터 전달하고
			mv.addObject("CNT", cnt);
		}
		
		// 리스트 조회
		List<BoardVO> list = gDao.getGboardList();
		// 리스트를 뷰에 전달
		mv.addObject("LIST", list);
		// 뷰 셋팅하고
		mv.setViewName("gboard/gboard");
		return mv;
	}
}
