package com.human.home;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class SonMain {
	
	@RequestMapping("/")
	public String getMain() {
		return "main";
	}
}
