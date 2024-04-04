package com.human.son.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.human.son.dao.*;

@Controller
public class Gboard {
	@Autowired//(required=false)
	GboardDao gDao;
	/*
	@Resource(name="gDao")
	GboardDao gDao;
	 */
}
