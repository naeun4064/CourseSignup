package com.sesoc.csignup.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.csignup.dao.CourseDAO;
import com.sesoc.csignup.vo.CourseVO;
import com.sesoc.csignup.vo.EnrollVO;
import com.sesoc.csignup.vo.StudentVO;

@Controller
public class CourseController {

	@Autowired
	private CourseDAO daoCo;

	@RequestMapping(value = "course/courseSignupForm", method = RequestMethod.GET)
	public String courseSignupForm(@RequestParam(value = "searchItem", defaultValue = "courseName") String searchItem,
			@RequestParam(value = "searchKeyword", defaultValue = "") String searchKeyword, HttpSession session,
			Model model) {
		ArrayList<CourseVO> list = daoCo.courseList(searchItem, searchKeyword);

		model.addAttribute("courseList", list);
		if (session.getAttribute("userid") != null) {
			return "/course/courseSignupForm";
		}
		return "/exception/error";
	}

	@RequestMapping(value = "course/enrollCourse", method = RequestMethod.POST)
	public String enrollCourse(HttpSession session, EnrollVO vo) {
		int num = daoCo.countStudentEnrolled(session, vo);
		if(num==1) {
			return "/exception/alreadyEnrolled";
		} else {
			daoCo.minusCapacity(vo.getCourseNum());
			daoCo.enrollCourse(session, vo);
			return "redirect:/course/courseSignupForm";

		}
	}
	
	@RequestMapping(value = "course/cancelCourse", method = RequestMethod.POST)
	public String cancelCourse(HttpSession session, EnrollVO vo) {
			
		daoCo.plusCapacity(vo.getCourseNum());
		daoCo.cancelCourse(session, vo);

		return "redirect:/course/enrollList";
	}

	@RequestMapping(value = "course/enrollList", method = RequestMethod.GET)
	public String enrollList(HttpSession session, Model model) {
		ArrayList<EnrollVO> list = daoCo.enrollList(session);
		model.addAttribute("EnrollVO", list);
		return "/course/enrollList";
	}

	@ResponseBody
	@RequestMapping(value = "course/courseListTemp", method = RequestMethod.GET)
	public ArrayList<CourseVO> courseListTemp(
			@RequestParam(value = "searchItem", defaultValue = "courseName") String searchItem,
			@RequestParam(value = "searchKeyword", defaultValue = "") String searchKeyword) {
		ArrayList<CourseVO> list = daoCo.courseList(searchItem, searchKeyword);
		return list;
	}
}
