package com.human.son.service;

import java.lang.reflect.*;

import javax.servlet.http.*;

import org.aspectj.lang.*;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.*;
import org.slf4j.*;
import org.springframework.stereotype.*;

import com.human.son.vo.*;

@Service // service 클래스를 bean 처리해주는 어노테이션
@Aspect // 이클래스가 aop 처리를 위한 클래스임을 밝혀주는 어노테이션
public class MemberLogService {
	// logger 꺼내오고
	private static final Logger membLog1 = LoggerFactory.getLogger("membLog");
	
	/*
		@Pointcut	: 처리기가 작동될 시점을 지정하는 어노테이션 - 요청 처리 함수 경로를 기술...
		@After		: 컨트롤러의 요청처리함수가 실행된 후에 실행
		@Before		: 컨트롤러의 요청처리함수가 실행되기 전에 실행
		@Arround	: 실행 전 + 실행 후
		
		참고 ]
			패턴 지정형식
				 execution(* 패키지경로.클래스이름.**Proc(..))
				 ==>
				 	**Proc()	: Proc로 끝나는 클래스 멤버 모든 함수
				 	(..)		: 매개변수를 불러오는 구문...
	 */
	/*
	@Pointcut("execution(* com.human.son.controller.Member.**(..))")
	public void recordLogin() {
		System.out.println("#################### aop start ##################");
	}
	
	@After("recordLogin()") // recordLogin() 함수가 실행된 후 실행
	public void writeLogin(JoinPoint point) {
		// JoinPoint : 함수의 매개변수 들을 기억하는 약속된 변수
		HttpSession session = (HttpSession) point.getArgs()[0];
		String sid = (String) session.getAttribute("SID");
		membLog.info(sid + " 회원이 로그인 했습니다.");
		
		MemberVO mVO = (MemberVO) point.getArgs()[3];
		System.out.println("************** mVO.id : " + mVO.getId());
	}
	*/
	
	// 회원 로그인/아웃 관련 로그 처리
	@After("execution(* com.human.son.controller.Member.**Proc(..))")
	public void memberLog(JoinPoint join) {
		// 할일
		// 세가지 함수의 기능을 통합했으므로
		// 어떤함수가 실행되었는지 알아낸다.
		MethodSignature methodSignature = (MethodSignature) join.getSignature();
		Method method = methodSignature.getMethod();
		String funcName = method.getName();
		
		// 세션 꺼내오고
		HttpSession session = (HttpSession) join.getArgs()[0];
		String sid = (String) session.getAttribute("SID");
		
		String id = "";
		String act = "";
		System.out.println("*************** aop service login **************");
		
		// 실행함수에 따라 조건처리
		if(funcName.equals("loginProc")) {
			// MemberVO의 cnt 를 꺼내서
			MemberVO mVO = (MemberVO) join.getArgs()[3];
			int cnt = mVO.getCnt();
			id = mVO.getId();
			if(cnt == 1) {
				session.setAttribute("SID", id);
				act = "로그인";
			} else {
				act = "로그인에 실패";
			}
		} else if(funcName.equals("logoutProc")) {
			id = sid;
			act = "로그아웃";
			session.removeAttribute("SID");
		} else if(funcName.equals("joinProc")) {
			MemberVO mVO = (MemberVO) join.getArgs()[3];
			int cnt = mVO.getCnt();
			id = mVO.getId();
			if(cnt == 1) {
				act = "회원가입에 성공";
			} else {
				act = "회원가입에 실패";
			}
		}
		
		membLog1.info(id + " 회원이 " + act + " 했습니다.");
		
	}
}
