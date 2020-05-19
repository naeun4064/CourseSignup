package com.sesoc.csignup.dao;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.csignup.vo.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public boolean signup(MemberVO vo) {
		int result = 0;
		try {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			result = mapper.signup(vo);
		} catch (Exception e) {
			e.printStackTrace();
		} if(result==0) return false;
		return true;
	}
	
	public boolean login(MemberVO vo) {
		int result = 0;
		try {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			result = mapper.login(vo);
		} catch (Exception e) {
			e.printStackTrace();
		} if(result==0) return false;
		return true;
	}

	public int readMember(HttpSession session) {
		int stNum = 0;
		String userid = (String)session.getAttribute("userid");
		try {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			stNum = mapper.readMember(userid);
		} catch (Exception e) {
			e.printStackTrace();
		} return stNum;
	}
	
	public void logout(HttpSession session) {
		session.invalidate();
	}
	
	public int checkId(String userid) {
		int result = 0;
		try {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			result = mapper.checkId(userid);
		} catch (Exception e) {
			e.printStackTrace();
		} return result;
	}
	
	public int checkStNumfromStudent(int stNum) {
		int result = 0;
		try {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			result = mapper.checkStNumfromStudent(stNum);
		} catch (Exception e) {
			e.printStackTrace();
		} if(result==0) return 2;
		  return 0;
	}
	public int checkStNumfromMember(int stNum) {
		int result = 0;
		try {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			result = mapper.checkStNumfromMember(stNum);
		} catch (Exception e) {
			e.printStackTrace();
		} return result;
	}
	
}
