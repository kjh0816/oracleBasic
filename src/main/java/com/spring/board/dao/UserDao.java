package com.spring.board.dao;

import java.util.HashMap;

import com.spring.board.vo.BoardVo;
import com.spring.board.vo.UserVo;

public interface UserDao {
	
	public int userInsert(UserVo userVo) throws Exception;

	public UserVo userByLoginId(String loginId) throws Exception;

	public UserVo userByLoginIdAndLoginPw(HashMap<String, String> params) throws Exception;

	

}
