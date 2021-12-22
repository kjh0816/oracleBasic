package com.spring.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.HomeController;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComVo;
import com.spring.board.vo.PageVo;
import com.spring.common.CommonUtil;

@Controller
public class BoardController {
	
	@Autowired 
	boardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/board/boardList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String boardList(Locale locale
			, HttpServletRequest request
			, HttpServletResponse response
			, Model model
			, PageVo pageVo
			, @RequestParam(value="boardTypesChecked", required=true, defaultValue="") List<String> boardTypesChecked
			) throws Exception{
		

		
		List<BoardVo> boardList = new ArrayList<BoardVo>();
		List<ComVo> comList = new ArrayList<ComVo>();
		
		comList = boardService.selectCom();

		
		
		
		int page = 1;
		int totalCnt = 0;
		
		if(pageVo.getPageNo() == 0){
			pageVo.setPageNo(page);
		}
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("pageNo", pageVo.getPageNo());
		
		if(boardTypesChecked == null || boardTypesChecked.isEmpty()) {

			// null 인 경우, 전체 게시물을 출력하므로, 전체 게시물을 카운트한다.
			totalCnt = boardService.selectBoardCnt();
		}else {

			
			params.put("boardType", boardTypesChecked);
			totalCnt = boardService.selectBoardCntByComCode(params);
		}
		
		
		boardList = boardService.SelectBoardList(params);
		

		model.addAttribute("boardList", boardList);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageNo", page);
		model.addAttribute("comList", comList);
		
		response.setCharacterEncoding("UTF-8");
		
		return "board/boardList";
	}
	
	@RequestMapping(value = "/board/boardListAjax.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String boardListAjax(Locale locale
			, HttpServletRequest request
			, HttpServletResponse response
			, Model model
			, PageVo pageVo
			, @RequestParam(value="boardTypesChecked", required=true, defaultValue="") List<String> boardTypesChecked
			) throws Exception{
		


		
		List<BoardVo> boardList = new ArrayList<BoardVo>();
		List<ComVo> comList = new ArrayList<ComVo>();
		
		comList = boardService.selectCom();

		
		
		
		int page = 1;
		int totalCnt = 0;
		
		if(pageVo.getPageNo() == 0){
			pageVo.setPageNo(page);
		}
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("pageNo", pageVo.getPageNo());
		
		if(boardTypesChecked == null || boardTypesChecked.isEmpty()) {

			// null 인 경우, 전체 게시물을 출력하므로, 전체 게시물을 카운트한다.
			totalCnt = boardService.selectBoardCnt();
		}else {

			
			params.put("boardType", boardTypesChecked);
			totalCnt = boardService.selectBoardCntByComCode(params);
		}
		
		
		boardList = boardService.SelectBoardList(params);
		

		
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		CommonUtil commonUtil = new CommonUtil();
		
		
		result.put("boardList", boardList);
		result.put("totalCnt", totalCnt);
		result.put("pageNo", page);
		result.put("comList", comList);
		
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		response.setCharacterEncoding("UTF-8");
		
		return callbackMsg;
	}
	
	
	
	
	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardView.do", method = RequestMethod.GET)
	public String boardView(Locale locale, Model model
			,@PathVariable("boardType")String boardType
			,@PathVariable("boardNum")int boardNum) throws Exception{
		
		BoardVo boardVo = new BoardVo();
		
		
		boardVo = boardService.selectBoard(boardType,boardNum);
		
		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);
		
		
		
		return "board/boardView";
	}
	
	
	
	@RequestMapping(value = "/board/boardDeleteAction.do", method = RequestMethod.GET)
	@ResponseBody
	public String boardDeleteAction(Locale locale
			, PageVo pageVo
			, @RequestParam String boardType
			, @RequestParam int boardNum
			) throws Exception{
		
		BoardVo boardVo = new BoardVo();
		
		boardVo = boardService.selectBoard(boardType,boardNum);
		
		
		int isBoardDeleted = boardService.boardDelete(boardVo);
		
		
		
		System.out.println("삭제 시, 반환된 int 값:" + isBoardDeleted);
		

		
		String result = isBoardDeleted > 0?"Y":"N";
		
		
		return "<script>alert('success: " + result + "'); location.href='/board/boardList.do'</script>";
		
	}
	
	
	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardModify.do", method = RequestMethod.GET)
	public String boardModify(Locale locale, Model model
			,@PathVariable("boardType")String boardType
			,@PathVariable("boardNum")int boardNum) throws Exception{
		
		BoardVo boardVo = new BoardVo();
		
		
		boardVo = boardService.selectBoard(boardType,boardNum);
		
		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);
		
		return "board/boardModify";
	}
	
	
	@RequestMapping(value = "/board/boardModifyAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardModifyAction(Locale locale
			, PageVo pageVo
			, BoardVo boardVo
			) throws Exception{
		
		
		int isBoardModified = boardService.boardModify(boardVo);
		
		
		
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		
		
		result.put("success", (isBoardModified > 0)?"Y":"N");
		
		result.put("boardType", boardVo.getBoardType());
		result.put("boardNum", Integer.toString(boardVo.getBoardNum()));
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		
		
		
		
		System.out.println("callbackMsg::" + callbackMsg);
		
		return callbackMsg;
		
		
		
		
	}
	
	
	
	@RequestMapping(value = "/board/boardWrite.do", method = RequestMethod.GET)
	public String boardWrite(Locale locale, Model model) throws Exception{
		
		List<ComVo> comList = new ArrayList<ComVo>();
		
		comList = boardService.selectCom();
		
		model.addAttribute("comList", comList);
		
		return "board/boardWrite";
	}
	
	@RequestMapping(value = "/board/boardWriteAction.do", method = RequestMethod.GET)
	@ResponseBody
	public String boardWriteAction(
			Locale locale
			, @RequestParam(value="boardType", required=true, defaultValue="") List<String> boardType
			, @RequestParam(value="boardTitle", required=true, defaultValue="") List<String> boardTitle
			, @RequestParam(value="boardComment", required=true, defaultValue="") List<String> boardComment
			) throws Exception{
		
		
		int listSize = boardType.size();
		
		List<BoardVo> boardList = new ArrayList<BoardVo>();
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		for(int i = 0; i < listSize; i++) {
			
			
			
			
			BoardVo boardVo = new BoardVo();
			
			boardVo.setBoardType(boardType.get(i));
			boardVo.setBoardTitle(boardTitle.get(i));
			boardVo.setBoardComment(boardComment.get(i));
			
			System.out.println("===================================");
			System.out.println("boardType: " + boardVo.getBoardType());
			System.out.println("boardTitle: " + boardVo.getBoardTitle());
			System.out.println("boardComment: " + boardVo.getBoardComment());
			System.out.println("===================================");
			
			int resultCnt = boardService.boardInsert(boardVo);
			
			if(resultCnt == 0) {
				result.put("msg", "작성에 실패했습니다.");
				
				String failMsg = commonUtil.getJsonCallBackString(" ",result);
				
				return failMsg;
				
			}
			
		}
		
		result.put("msg", "작성 완료");
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
		
	}
	
}
