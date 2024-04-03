package com.human.son.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class MainController {
	
	@RequestMapping("/main.son")
	public String goMain() {
		return "main";
	}
}
