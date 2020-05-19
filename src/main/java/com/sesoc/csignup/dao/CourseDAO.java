package com.sesoc.csignup.dao;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.csignup.vo.CourseVO;
import com.sesoc.csignup.vo.EnrollVO;
import com.sesoc.csignup.vo.StudentVO;

@Repository
public class CourseDAO {
	@Autowired
	private SqlSession sqlSession;
	
	
	public ArrayList<CourseVO> courseList(String searchItem, String searchKeyword) {
		ArrayList<CourseVO> list = null;
		HashMap<String,String> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchKeyword", searchKeyword);
		
		try {
			CourseMapper mapper = sqlSession.getMapper(CourseMapper.class);
			list = mapper.courseList(map);
		} catch (Exception e) {
			e.printStackTrace();
		} return list;
	}
	
	public void minusCapacity(int courseNum) {
		try {
			CourseMapper mapper = sqlSession.getMapper(CourseMapper.class);
			mapper.minusCapacity(courseNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void plusCapacity(int courseNum) {
		try {
			CourseMapper mapper = sqlSession.getMapper(CourseMapper.class);
			mapper.plusCapacity(courseNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void enrollCourse(HttpSession session,EnrollVO vo) {
		
		StudentVO voSt = (StudentVO)session.getAttribute("voSt");	
		int stNum = voSt.getStNum();
		String stName = voSt.getStName();
		
		vo.setStNum(stNum);
		vo.setStName(stName);
		
		try {
			CourseMapper mapper = sqlSession.getMapper(CourseMapper.class);
			mapper.enrollCourse(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void cancelCourse(HttpSession session,EnrollVO vo) {
		StudentVO voSt = (StudentVO)session.getAttribute("voSt");	
		int stNum = voSt.getStNum();
		String stName = voSt.getStName();
		
		vo.setStNum(stNum);
		vo.setStName(stName);
		
		try {
			CourseMapper mapper = sqlSession.getMapper(CourseMapper.class);
			mapper.cancelCourse(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<EnrollVO> enrollList(HttpSession session) {
		StudentVO vo = (StudentVO)session.getAttribute("voSt");
		int stNum = vo.getStNum();
		ArrayList<EnrollVO> list = null;
		
		try {
			CourseMapper mapper = sqlSession.getMapper(CourseMapper.class);
			list = mapper.enrollList(stNum);
		} catch (Exception e) {
			e.printStackTrace();
		} return list;
	}
	
	public ArrayList<CourseVO> courseListTemp(String searchItem, String searchKeyword) {
		ArrayList<CourseVO> list = null;
		HashMap<String,String> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchKeyword", searchKeyword);
		
		try {
			CourseMapper mapper = sqlSession.getMapper(CourseMapper.class);
			list = mapper.courseList(map);
		} catch (Exception e) {
			e.printStackTrace();
		} return list;
	}
	
	public int countStudentEnrolled(HttpSession session, EnrollVO vo) {
		StudentVO voSt = (StudentVO)session.getAttribute("voSt");	
		int stNum = voSt.getStNum();
		String stName = voSt.getStName();
		
		vo.setStNum(stNum);
		vo.setStName(stName);
		
		int countStudent = 0;
		try {
			CourseMapper mapper = sqlSession.getMapper(CourseMapper.class);
			countStudent = mapper.countStudentEnrolled(vo);
		} catch (Exception e) {
			e.printStackTrace();
		} return countStudent;
	}

}
