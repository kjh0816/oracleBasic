package com.spring.board.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.board.HomeController;
import com.spring.board.service.userService;
import com.spring.board.vo.ComVo;
import com.spring.board.service.boardService;

@Controller
public class UserController {
	
	@Autowired 
	userService userService;
	
	@Autowired 
	boardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value = "/user/join.do", method = RequestMethod.GET)
	public String login(
			Model model
			) throws Exception{
		
		
		List<ComVo> phoneNumList = new ArrayList<ComVo>();
		
		phoneNumList = boardService.selectPhoneNum();
		
		System.out.println(phoneNumList);
		System.out.println(phoneNumList);
		System.out.println(phoneNumList);
		System.out.println(phoneNumList);
		
		
		return "user/join";
		
	}

}
