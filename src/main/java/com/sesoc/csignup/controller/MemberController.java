package com.sesoc.csignup.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sesoc.csignup.dao.MemberDAO;
import com.sesoc.csignup.dao.StudentDAO;
import com.sesoc.csignup.vo.MemberVO;
import com.sesoc.csignup.vo.StudentVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private StudentDAO daoSt;
	
	@RequestMapping(value = "member/signupForm", method = RequestMethod.GET)
	public String signupForm() {
	
		return "/member/signupForm";
	}
	
	@ResponseBody
	@RequestMapping(value = "member/idCheckSignup", method = RequestMethod.GET)
	public int idCheck(String userid) {
		return dao.checkId(userid);
	}
	
	@ResponseBody
	@RequestMapping(value = "member/stNumCheckSignup", method = RequestMethod.GET)
	public int idCheck(int stNum) {
		int result = dao.checkStNumfromMember(stNum)+dao.checkStNumfromStudent(stNum);
		return result;
	}
	
	@RequestMapping(value = "member/signup", method = RequestMethod.POST)
	public String signup(MemberVO vo, RedirectAttributes rttr) {
		boolean result = dao.signup(vo);
		rttr.addFlashAttribute("signupResult", result);
		if(result==true) return "redirect:/";
		return "redirect:/member/signupForm";
	}
	
	@RequestMapping(value = "member/loginForm", method = RequestMethod.GET)
	public String loginForm() {
	
		return "/member/loginForm";
	}
	
	@RequestMapping(value = "member/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpSession session, RedirectAttributes rttr) {
		boolean result = dao.login(vo);
		rttr.addFlashAttribute("loginResult", result);
		
		if(result) {
			session.setAttribute("userid", vo.getUserid());
			StudentVO voSt = daoSt.studentRead(session);
			session.setAttribute("voSt", voSt);
			
			
			return "redirect:/";
		}
		return "redirect:/member/loginForm";
	}
	
	@RequestMapping(value = "member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		dao.logout(session);
		return "redirect:/";
	}
}
