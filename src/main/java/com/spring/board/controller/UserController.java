package com.spring.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.HomeController;
import com.spring.board.service.userService;
import com.spring.board.vo.ComVo;
import com.spring.board.vo.UserVo;
import com.spring.common.CommonUtil;
import com.spring.board.service.boardService;

@Controller
public class UserController {
	
	@Autowired 
	userService userService;
	
	@Autowired 
	boardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value = "/user/join.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String join(
			Model model
			) throws Exception{
		
		
		List<ComVo> phoneNumList = new ArrayList<ComVo>();
		
		phoneNumList = boardService.selectPhoneNum();
		
		model.addAttribute("phoneNumList", phoneNumList);
		
		
		return "user/join";
		
	}
	
	@RequestMapping(value = "/user/actionJoin.do", method = RequestMethod.POST)
	@ResponseBody
	public String actionJoin(
			@RequestParam String loginId,
			@RequestParam String loginPw,
			@RequestParam String name,
			@RequestParam String cellphoneNo_1,
			@RequestParam String cellphoneNo_2,
			@RequestParam String cellphoneNo_3,
			@RequestParam(defaultValue="") String postNo,
			@RequestParam(defaultValue="") String address,
			@RequestParam(defaultValue="") String company
			
			) throws Exception {
		
		String pattern = "/^[0-9]{3}[-]+[0-9]{3}$/";
		
		boolean postNoRegex = Pattern.matches(pattern, postNo);
		if(!postNoRegex) {
			postNo = "";
		}
		
		
		UserVo existingUser = userService.selectUserByLoginId(loginId);
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		
		
		if(existingUser != null) {
			
			result.put("msg", "0");
			String errorMsg = commonUtil.getJsonCallBackString(" ",result);
			return errorMsg;
		}
		
		UserVo userVo = new UserVo();
		
		userVo.setLoginId(loginId);
		userVo.setLoginPw(loginPw);
		userVo.setName(name);
		userVo.setCellphoneNo_1(cellphoneNo_1);
		userVo.setCellphoneNo_2(cellphoneNo_2);
		userVo.setCellphoneNo_3(cellphoneNo_3);
		userVo.setPostNo(postNo);
		userVo.setAddress(address);
		userVo.setCompany(company);
		
		
		
		
		
		
		
		int resultCnt = userService.userInsert(userVo);
		
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
		
		
	}
	
	@RequestMapping(value = "/user/loginIdCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String loginIdCheck(
			@RequestParam String loginId
			) throws Exception{
		
		
		UserVo userVo = userService.selectUserByLoginId(loginId);
		
		
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		if(userVo != null) {
			result.put("msg", "0");
//			result.put("success", "Can use");
		}
		else {
			result.put("msg", "1");
//			result.put("success", "Can't use");
		}
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	@RequestMapping(value = "/user/login.do", method = RequestMethod.GET)
	public String login(
			HttpServletRequest req
			) throws Exception{
		
		HttpSession loginSession = req.getSession();
		
		UserVo userVo = (UserVo) loginSession.getAttribute("loginedMember");
		
		if(userVo != null) {
			return "board/boardList.do";
		}
		
		return "user/login";
	}
	
	@RequestMapping(value = "/user/doLogout.do", method = RequestMethod.GET)
	@ResponseBody
	public String doLogout(HttpServletRequest req) throws Exception {
		HttpSession loginSession = req.getSession();
		
		loginSession.invalidate();
		
		CommonUtil commonUtil = new CommonUtil();
		
		return CommonUtil.replaceJs("logout done", "/board/boardList.do");
	}
	
	
	@RequestMapping(value = "/user/actionLogin.do", method = RequestMethod.POST)
	@ResponseBody
	public String doLogin(
			 HttpServletRequest req,
			@RequestParam(defaultValue="") String loginId,
			@RequestParam(defaultValue="") String loginPw
			) throws Exception {
		
		
		
		
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		
		
		
		
		HashMap<String, String> params = new HashMap<String, String>();
		
		params.put("loginId", loginId);
		params.put("loginPw", loginPw);
		
		UserVo userVo = userService.selectUserByLoginIdAndLoginPw(params);
		
		if(userVo == null) {

			result.put("msg", "0");
		}
		else {

			result.put("msg", "1");
			
			HttpSession loginSession = req.getSession();
			
			loginSession.setAttribute("loginedMemberJsonStr", CommonUtil.toJson(userVo));
			loginSession.setAttribute("loginedMember", userVo);
			loginSession.setAttribute("name", userVo.getName());
			

			
			
			UserVo loginedMember = (UserVo) loginSession.getAttribute("loginedMember");
			
			
			
			
		}
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
		
		
		
	}
	
	@RequestMapping(value = "/alert.do", method = RequestMethod.GET)
	public String alertPage(
			@RequestParam(defaultValue="redirected") String msg,
			@RequestParam(defaultValue="/board/boardList.do") String url,
			Model model
			) {
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		
		return "/alert";
		
	}

}
