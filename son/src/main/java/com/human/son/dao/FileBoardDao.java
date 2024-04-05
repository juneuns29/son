package com.human.son.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;

import com.human.son.vo.*;

public class FileBoardDao {
	@Autowired
	private SqlSessionTemplate session;
	
	public List<BoardVO> getList(){
		return session.selectList("fSQL.selList");
	}
}
