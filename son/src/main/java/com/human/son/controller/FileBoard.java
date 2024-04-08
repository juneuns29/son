package com.human.son.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.human.son.dao.FileBoardDao;
import com.human.son.util.PageUtil;
import com.human.son.vo.BoardVO;

@Controller
@RequestMapping("/fboard")
public class FileBoard {
	@Autowired
	FileBoardDao fDao;
	
	@RequestMapping("/fileboard.son")
	public ModelAndView boardList(HttpSession session, ModelAndView mv, RedirectView rv, PageUtil page) {
		// 할일
		int nowPage = page.getNowPage();
		if(nowPage == 0) {
			nowPage = 1;
		}
		
		int totalCnt = fDao.getTotal();
		
		page.setPage(nowPage, totalCnt);
		
		// 데이터 베이스에서 조회
		List<BoardVO> list = fDao.getList(page);
		
		// 데이터 전달하고
		mv.addObject("LIST", list);
		mv.addObject("PAGE", page);
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
	
	@RequestMapping("/writeProc.son")
	public ModelAndView writeProc(HttpSession session, ModelAndView mv, 
											RedirectView rv, BoardVO bVO) {
		/*
			할일
				파라미터를 받아야 한다.
				지금까지는 매개변수에 VO 를 선언해주면 키값과 동일한 변수를 찾아서
				데이터를 채워줬는데 
				지금은 바이트 단위로 데이터를 전송하기 때문에 데이터를 꺼내는 방식도 달라져야 한다.
				
				
		 */
		MultipartFile[] file = bVO.getFile();
		
		
		System.out.println("title : " + bVO.getTitle());
		
		rv.setUrl("/fboard/fileboard.son");
		mv.setView(rv);
		return mv;
	}
}
