package com.spring.board.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.BoardDao;
import com.spring.board.dao.UserDao;
import com.spring.board.service.userService;

@Service
public class userServiceImpl implements userService{
	
	@Autowired
	UserDao userDao;

}
