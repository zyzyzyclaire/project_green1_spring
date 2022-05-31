package com.javalec.team.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {
	
	@RequestMapping("/index")
	public String index() {
		
		return "main/index";	
	}
	
	@RequestMapping("/test")
	public String test() {
		
		return "main/test";	
	}
}
