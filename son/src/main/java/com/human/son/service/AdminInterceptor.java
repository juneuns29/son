package com.human.son.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.human.son.dao.SurveyDao;
import com.human.son.vo.SurveyVO;

public class AdminInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 할일
		
		// 1. 로그인 되어있는지 검사
		String sid = (String) request.getSession().getAttribute("SID");
		
		if(sid == null || !sid.equals("euns")) {
			// 로그인 안한경우
			// 리다이렉트 시킨다.
			response.sendRedirect("/survey/surveyList.son");
			return false;
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {}

}
