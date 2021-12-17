package com.spring.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.board.HomeController;
import com.spring.board.service.userService;

@Controller
public class UserController {
	
	@Autowired 
	userService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value = "/user/join.do", method = RequestMethod.GET)
	public String login(
			Model model
			) throws Exception{
		
		
		
		
		
		return "user/join";
		
	}

}
