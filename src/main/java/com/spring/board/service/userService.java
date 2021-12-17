package com.spring.board.service;

import com.spring.board.vo.UserVo;

public interface userService {

	public int userInsert(UserVo userVo) throws Exception;

	public UserVo selectUserByLoginId(String loginId) throws Exception;

	

}
