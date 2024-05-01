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
		
		// 요청 내용 꺼내오고
		String path = request.getRequestURI();
		
		// 2. 로그인이 되어있으면 파라미터에서 설문번호를 꺼내온다.
		String sno = request.getParameter("tpno");
		if(sno == null) {
			// tpno 가 전달안된 경우
			response.sendRedirect("/survey/surveyList.son");
			return false;
		}
		
		int tpno = Integer.parseInt(sno);
		SurveyVO sVO = new SurveyVO();
		sVO.setId(sid);
		sVO.setTpno(tpno);
		int cnt = sDao.answerCnt(sVO);
		
		// 3. 아이디와 설문번호로 해당 설문에 참여했는지 여부를 판단.
		int ingCnt = sDao.selTpnoCnt(tpno);
		
		if(path.equals("/survey/surveyQuest.son") ) {
			// 설문 참여 여부를 검사해서 조건처리
			// 참여한 경우(cnt != 0)는 리스트페이지로 리다이렉트
			if(cnt != 0) {
				response.sendRedirect("/survey/surveyList.son");
				return false;
			}
			
		} else if(path.equals("/survey/surveyAnswer.son")) {
			if(cnt != 0) {
				response.sendRedirect("/survey/surveyList.son");
				return false;
			}
			
			// 파라미터에서 qanos 를 꺼내고
			String[] qanos = request.getParameterValues("qanos");
			if(qanos.length == 0) {
				// 파라미터가 전달안 된 경우
				// 이 경우는 로그인 되어있고 설문에 아직 참여안한 경우
				response.sendRedirect("/survey/surveyList.son");
				return false;
			}
			
		} else if(path.equals("/survey/surveyResult.son")) {
			// 여기는 이미 로그인 체크가 된 경우
			// 설문이 진행중인 경우 그리고
			// 설문에 응답안한경우
			if(ingCnt != 0 && cnt == 0) {
				response.sendRedirect("/survey/surveyList.son");
				return false;
			}
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
