package com.sesoc.csignup;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sesoc.csignup.dao.CourseDAO;
import com.sesoc.csignup.vo.CourseVO;

@Controller
public class HomeController {
	
	@Autowired
	private CourseDAO daoCo;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(@RequestParam(value="searchItem", defaultValue="courseName")String searchItem,
						@RequestParam(value="searchKeyword", defaultValue="") String searchKeyword,
						HttpSession session, Model model) {
		
		ArrayList<CourseVO> list = daoCo.courseList(searchItem, searchKeyword);
		
		model.addAttribute("courseList",list);
		
		return "main";
	}

}
