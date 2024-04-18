package com.human.son.service;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.web.servlet.*;

import com.human.son.dao.*;

public class GboardInterceptor implements HandlerInterceptor {
	@Autowired
	GboardDao gDao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 세션검사하고
		String sid = (String) request.getSession().getAttribute("SID");
		if(sid == null) {
			response.sendRedirect("/member/login.son");
			return false;
		}
		// 데이터베이스 조회하고
		int cnt = gDao.getCnt(sid);
		if(cnt == 1) {
			response.sendRedirect("/gboard/gboard.son");
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
