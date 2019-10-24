package com.kh.workman.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.workman.member.model.service.MemberService;
import com.kh.workman.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	@RequestMapping("/member/login.do")
	public ModelAndView login(Member m, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		
		String msg = "";
		String loc = "/";
		
		Member loginMember = service.selectLogin(m);
		
		System.out.println(m.getId());
		System.out.println(m.getPw());
		System.out.println(m.getId().equals(loginMember.getId()));
		System.out.println(pwEncoder.matches(m.getPw(), loginMember.getPw()));
		
		
		
		if(m.getId().equals(loginMember.getId()) && pwEncoder.matches(m.getPw(), loginMember.getPw()))
		{
			msg = "로그인 성공";
			session.setAttribute("loginMember", loginMember);			
		}
		else
		{
			msg = "로그인 실패";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		
		return mv;
		
	}
	
	@RequestMapping("member/logout.do")
	public String logout(Model model,HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		String msg = "로그아웃 완료";
		String loc = "/";
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	@RequestMapping("signUp.do")
	public String signUp()
	{
		return "member/signUpView";
	}
	
	@RequestMapping("member/mainPage.do")
	public String mainPage()
	{
		return "redirect:/";
	}
	
	@RequestMapping("/member/register.do")
	public ModelAndView register(Member m, Model model)
	{
		m.setPw(pwEncoder.encode(m.getPw()));
		int result = service.insertMember(m);
				
		String msg = "";
		String loc = "/";
		
		ModelAndView mv = new ModelAndView();
		
		if(result > 0)
		{
			msg = "가입완료";
		}else
		{
			msg = "가입실패";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		
		return mv;
	}

}
