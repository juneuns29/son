package com.human.son.service;

import org.springframework.beans.factory.annotation.*;

import com.human.son.dao.*;

public class FileBoardService {
	@Autowired
	FileBoardDao fDao;
	/*
		파일 게시판 게시글 등록은
		데이터베이스 작업이 두개의 테이블에 여러번 입력되는 작업이 진행될 것이다.
		이 작업들은 파일정보의 경우 한가지 작업이 반복적으로 수행이 될 것이다.
		
		따라서 여기서 그 전체에 대한 작업을 처리해주도록 하겠다.
	 */
}
