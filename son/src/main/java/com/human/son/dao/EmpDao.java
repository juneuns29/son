package com.human.son.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class EmpDao {
	@Autowired
	SqlSessionTemplate session;
	
	public int editSal() {
		return session.update("eSQL.editSal");
	}
}
