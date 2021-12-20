package com.spring.board.dao.impl;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.spring.board.dao.UserDao;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.UserVo;

@Repository
public class UserDaoImpl implements UserDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public int userInsert(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("user.userInsert", userVo);
	}
	
	@Override
	public UserVo userByLoginId(String loginId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.userByLoginId", loginId);
	}
	
	@Override
	public UserVo userByLoginIdAndLoginPw(HashMap<String, String> params) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.userByLoginIdAndLoginPw", params);
	}
	
	

}
