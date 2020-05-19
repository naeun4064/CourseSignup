package com.sesoc.csignup.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.sesoc.csignup.vo.CourseVO;
import com.sesoc.csignup.vo.EnrollVO;

public interface CourseMapper {
	public ArrayList<CourseVO> courseList(HashMap<String,String> map);
	public void enrollCourse(EnrollVO vo);
	public void minusCapacity(int courseNum);
	public void cancelCourse(EnrollVO vo);
	public void plusCapacity(int courseNum);
	public ArrayList<EnrollVO> enrollList(int stNum);
	public ArrayList<CourseVO> courseListTemp(HashMap<String,String> map);
	public int countStudentEnrolled(EnrollVO vo);
}
