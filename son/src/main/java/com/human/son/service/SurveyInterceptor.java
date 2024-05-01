package com.human.son.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.human.son.dao.SurveyDao;
import com.human.son.vo.SurveyVO;

public class SurveyInterceptor implements HandlerInterceptor {
	@Autowired
	SurveyDao sDao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 할일
		
		// 1. 로그인 되어있는지 검사
		String sid = (String) request.getSession().getAttribute("SID");
		
		if(sid == null) {
			// 로그인 안한경우
			// 리다이렉트 시킨다.
			response.sendRedirect("/member/login.son");
			return false;
		}
		
		// 2. 로그인이 되어있으면 파라미터에서 설문번호를 꺼내온다.
		String sno = request.getParameter("tpno");
		int tpno = Integer.parseInt(sno);
		
		SurveyVO sVO = new SurveyVO();
		sVO.setId(sid);
		sVO.setTpno(tpno);
		
		int cnt = sDao.answerCnt(sVO);
		
		if(cnt != 0) {
			response.sendRedirect("/survey/surveyList.son");
			return false;
		}
		
		if(sno == null) {
			// tpno 가 전단안된 경우
			response.sendRedirect("/survey/surveyList.son");
			return false;
		}
		// 요청 내용 꺼내오고
		String path = request.getRequestURI();
		if(path.equals("/survey/surveyAnswer.son")) {
			String sano = request.getParameter("qano");
			
		}
		
		// 3. 아이디와 설문번호로 해당 설문에 참여했는지 여부를 판단.
		
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {}

}
