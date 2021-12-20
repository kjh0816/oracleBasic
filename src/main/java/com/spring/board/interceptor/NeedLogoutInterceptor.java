package com.spring.board.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.common.CommonUtil;

public class NeedLogoutInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception{
		
		HttpSession session = req.getSession();
		
		Object obj = session.getAttribute("loginedMember");
		
		CommonUtil commonUtil = new CommonUtil();
		
		System.out.println(obj);
		System.out.println(obj);
		System.out.println(obj);
		System.out.println(obj);
		System.out.println(obj);
		
		
		if(obj != null) {
			
						
			resp.sendRedirect("/alert.do?msg=already logged in&url=/board/boardList.do");
			
			
			return false;
		}
		
		
		
		
		
		
		return true;
	}

}
