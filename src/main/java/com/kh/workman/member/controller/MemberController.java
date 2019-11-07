package com.kh.workman.member.controller;

import java.io.File;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.workman.member.model.service.MemberService;
import com.kh.workman.member.model.vo.Member;

@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService service;
	
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	//@Autowired
	//MyEncrypt en;

	@RequestMapping("/member/login.do")
	public ModelAndView login(Member m, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		
		String msg = "";
		String loc = "/";
				
		Member loginMember = service.selectLogin(m);
		System.out.println("로그인" + pwEncoder.matches(m.getPw(), loginMember.getPw()));
		
//		try {
//			loginMember.setPw(en.decrypt(loginMember.getPw()));
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		//System.out.println(m.getPw());
		//System.out.println(loginMember.getPw());
		
		if(m.getId().equals(loginMember.getId()) && pwEncoder.matches(m.getPw(), loginMember.getPw()))
		//if(m.getPw().equals(loginMember.getPw()))
		{
			if(session.getAttribute("loginMember") != null)
				session.removeAttribute("loginMember");
			
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
	
	@RequestMapping("/member/logout.do")
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
	
	@RequestMapping("/member/signUp.do")
	public String signUp()
	{
		return "member/signUpView";
	}
	
	@RequestMapping("/member/mainPage.do")
	public String mainPage()
	{
		return "redirect:/";
	}
	
	@RequestMapping("/member/register.do")
	public ModelAndView register(Member m, Model model)
	{	
		m.setPw(pwEncoder.encode(m.getPw()));
//		try
//		{
//			m.setPw(en.encrypt(m.getPw()));			
//		}catch(Exception e)
//		{
//			e.printStackTrace();
//		}
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
	
	@RequestMapping("/member/setting.do")
	public ModelAndView setting(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		String msg = "";
		String loc = "/";
		
		ModelAndView mv = new ModelAndView();
		
		if(session.getAttribute("loginMember") == null)
		{
			msg = "로그인 후 이용 가능";
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");
			
		}else
		{
			mv.setViewName("member/myPage");
		}
		
		return mv;
	}
	
	@RequestMapping("/member/updateInfoMember.do")
	public ModelAndView updateInfoMember(Member member, HttpServletRequest request,
			HttpSession session,
			@RequestParam(value="orgNames", required=false) MultipartFile[] orgNames
			)
	{
		String msg ="";
		String loc ="";
		System.out.println("dsfdsfsdf");
		System.out.println("pw" + member.getPw());
		
//		 //logger.debug("Original job board file name : " + orgNames[0].getOriginalFilename());
//		
//	 	/* 파일업로드 처리하기 */
//	    //1.저장경로 지정하기
	    String saveDir = session.getServletContext().getRealPath("/resources/upload/member");
	    File dir = new File(saveDir);

	    if(!dir.exists()) logger.debug("" + dir.mkdirs());

	    for(MultipartFile f : orgNames) {
	      if(!f.isEmpty()) {
	        //rename file name
	        String orgName = f.getOriginalFilename();
	        System.out.println(orgName);
	        member.setProfile(orgName);
	        
	        try {
	            f.transferTo(new File(saveDir + "/" + orgName));
	          } catch(Exception e) {
	            e.printStackTrace(); //IllegalStateException, IOException
	          }
	      }
	    }
		 
		if(member.getPw().equals(""))
		{
			member.setPw(null);
			System.out.println("지금 널이다");
			System.out.println(member.getPw());
		}else
		{
			System.out.println("지금 널이 아니다");
			member.setPw(pwEncoder.encode(member.getPw()));		
			System.out.println(member.getPw());
		}
		
		int result = service.updateInfoMember(member);
		System.out.println(result);
		if(result > 0)
		{
			Member loginMember = service.selectLogin(member);
					
			if(loginMember != null)
			{
				session.setAttribute("loginMember", loginMember);
				msg = "정보 변경 완료";
				loc = "/";
			}
			else
			{
				msg = "정보 변경 실패";
			}
		}else
		{
			msg = "정보 변경 실패";
		}
			
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("/common/msg");
		
		return mv;	
	}
}
