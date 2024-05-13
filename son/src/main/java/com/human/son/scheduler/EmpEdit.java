package com.human.son.scheduler;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.Autowired;

import com.human.son.dao.EmpDao;

public class EmpEdit {
	@Autowired
	EmpDao eDao;
	
	private static final Logger eLog = LoggerFactory.getLogger("empLog");
	
	public void editSal() {
		int cnt = eDao.editSal();
		
		if(cnt == 2) {
			eLog.info("SMITH 사원의 급여가 50 인상, KING 사원의 급여가 50 감소");
		}
	}
}
