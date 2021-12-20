package com.spring.board.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Interceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception{
		
		HttpSession session = req.getSession();
		
		Object obj = session.getAttribute("loginedMember");
		
		System.out.println("인터셉터 실행됨");
		System.out.println("인터셉터 실행됨");
		System.out.println("인터셉터 실행됨");
		System.out.println("인터셉터 실행됨");
		System.out.println("인터셉터 실행됨");
		
		
		System.out.println(obj);
		System.out.println(obj);
		System.out.println(obj);
		System.out.println(obj);
		System.out.println(obj);
		
		
		return true;
	}

}
