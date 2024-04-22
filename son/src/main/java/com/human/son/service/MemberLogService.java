package com.human.son.service;

import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.*;

@Service // service 클래스를 bean 처리해주는 어노테이션
@Aspect // 이클래스가 aop 처리를 위한 클래스임을 밝혀주는 어노테이션
public class MemberLogService {
	// logger 꺼내오고
	private static final Logger membLog = LoggerFactory.getLogger("membLog");
	
	/*
		@Pointcut	: 처리기가 작동될 시점을 지정하는 어노테이션 - 요청 처리 함수 경로를 기술...
		@After		: 
		@Before
		@Arround
	 */
	@Pointcut("execution(* com.human.son.controller.Member.loginProc(..))")
	public void recordLogin() {
		System.out.println("#################### aop start ##################");
	}
	
	
}
