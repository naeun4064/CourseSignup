package com.sesoc.csignup.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sesoc.csignup.dao.StudentDAO;
import com.sesoc.csignup.vo.StudentVO;

@Controller
public class StudentController {
	@Autowired
	private StudentDAO daoSt;
	
	@RequestMapping(value = "student/studentMain", method = RequestMethod.GET)
	public String studentMain(HttpSession session, Model model) {
		StudentVO vo = daoSt.studentRead(session);
		model.addAttribute("vo", vo);
		
		return "/student/studentMain";
	}
	
	@RequestMapping(value = "student/studentUpdateForm", method = RequestMethod.GET)
	public String studentUpdateForm(HttpSession session, Model model) {
		StudentVO vo = daoSt.studentRead(session);
		model.addAttribute("vo", vo);
		
		return "/student/studentUpdateForm";
	}
	
	@RequestMapping(value = "student/studentUpdate", method = RequestMethod.POST)
	public String studentUpdate(StudentVO vo, HttpSession session, RedirectAttributes rttr) {
		boolean result = daoSt.studentUpdate(session, vo);
		rttr.addFlashAttribute("updateResult", result);
		if(result) {
			StudentVO voSt = daoSt.studentRead(session);
			session.setAttribute("voSt", voSt);
		}
		
		return "redirect:/student/studentMain";
	}
	
}
