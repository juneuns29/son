package com.human.son.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.human.son.dao.FileBoardDao;
import com.human.son.vo.BoardVO;

@Controller
@RequestMapping("/fboard")
public class FileBoard {
	@Autowired
	FileBoardDao fDao;
	
	@RequestMapping("/fileboard.son")
	public ModelAndView boardList(HttpSession session, ModelAndView mv, RedirectView rv) {
		// 할일
		// 데이터 베이스에서 조회
		List<BoardVO> list = fDao.getList();
		
		// 데이터 전달하고
		mv.addObject("LIST", list);
		// 뷰 셋팅하고
		mv.setViewName("fboard/fileboard");
		return mv;
	}
	
	@RequestMapping("/fboardDetail.son")
	public ModelAndView boardDetail(HttpSession session, ModelAndView mv, RedirectView rv, int bno) {
		mv.setViewName("fboard/fileboardDetail");
		
		return mv;
	}
	
	@RequestMapping("/fboardWrite.son")
	public ModelAndView boardWrite(HttpSession session, ModelAndView mv, RedirectView rv) {
		mv.setViewName("fboard/fileboardWrite");
		
		return mv;
	}
}
