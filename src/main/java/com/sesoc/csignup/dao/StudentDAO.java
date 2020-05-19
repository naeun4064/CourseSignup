package com.sesoc.csignup.dao;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.csignup.vo.StudentVO;

@Repository
public class StudentDAO {
	
	@Autowired
	private MemberDAO daoMe;
	
	@Autowired
	private SqlSession sqlSession;
	
	
	public StudentVO studentRead(HttpSession session) {
		int stNum = daoMe.readMember(session);
		StudentVO vo = null;
		try {
			StudentMapper mapper = sqlSession.getMapper(StudentMapper.class);
			vo = mapper.studentRead(stNum);
		} catch (Exception e) {
			e.printStackTrace();
		} return vo;
	}
		
	public boolean studentUpdate(HttpSession session, StudentVO vo) {
		StudentVO voSt = (StudentVO)session.getAttribute("voSt");	
		int stNum = voSt.getStNum();
		vo.setStNum(stNum);
		
		int result = 0;
		try {
			StudentMapper mapper = sqlSession.getMapper(StudentMapper.class);
			result = mapper.studentUpdate(vo);
		} catch (Exception e) {
			e.printStackTrace();
		} if(result==0) return false;
		return true;
	}
	
}
