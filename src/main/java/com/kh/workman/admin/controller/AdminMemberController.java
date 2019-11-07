package com.kh.workman.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.workman.admin.model.service.AdminMemberService;
import com.kh.workman.admin.model.vo.AdminMember;
import com.kh.workman.common.PageBarFactory;

@Controller
public class AdminMemberController {

	@Autowired
	private AdminMemberService service;
	
	@RequestMapping("/admin/adminMain")
	public String admin() {
		return "admin/adminMain";
	}
	
	
	@RequestMapping("/admin/memberSearch.do")
	public ModelAndView list(@RequestParam(required=false, defaultValue="") String searchType, 
								@RequestParam(required=false, defaultValue="") String keyword) {
		List<AdminMember> list = service.listAll(searchType, keyword);
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		
		mv.addObject("list", list);
		mv.addObject("map", map);
		
		mv.setViewName("admin/adminMemberList");
		
		return mv;
	}

	@RequestMapping("/admin/selectMemberList.do")
	public ModelAndView selectMemberList(@RequestParam(value="cPage", required=false, defaultValue="0") int cPage, 
												Model model) {
		ModelAndView mv = new ModelAndView();
		int numPerPage=10;
		List<AdminMember> list = service.selectMemberList(cPage,numPerPage);
		
		int totalCount=service.selectMemberCount();
				
		mv.addObject("pageBar",PageBarFactory.getAdminPageBar(totalCount, cPage, numPerPage, "/spring/admin/selectMemberList.do"));
		mv.addObject("count",totalCount);
		mv.addObject("list",list);
		mv.setViewName("admin/adminMemberList");
		
		return mv;
	}

	@RequestMapping("/admin/statusUpdate")
	public String statusUpdate(@RequestParam int status, @RequestParam int no, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("status", status);
		map.put("no", no);
		
		int num = service.statusUpdate(map);
		String msg="";
		String loc="";
		if(num==1) {
			msg+="성공하였습니다.";
			loc+="selectMemberList.do";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);
		}
		else {
			msg+="실패하였습니다. 관리자 문의요망";
			loc+="selectMemberList.do";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);
		}
		
		return "common/msg";
	}

	@RequestMapping("/admin/memberDelete")
	public String memberDelete(@RequestParam String id, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		
		int num = service.deleteMember(map);
		
		String msg="";
		String loc="";
		if(num==1) {
			msg+="회원 삭제 완료";
			loc+="selectMemberList.do";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);
		}
		else {
			msg+="회원 삭제 실패";
			loc+="selectMemberList.do";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);
		}
		
		return "common/msg";
	}
	
	@RequestMapping("/admin/memberView")
	public ModelAndView memberView(String id) {
		System.out.println(id);
		ModelAndView mv = new ModelAndView();
		Map<String, String> member = service.memberView(id);
		
		mv.addObject("member", member);
		mv.setViewName("admin/adminMemberView");
		
		return mv;
		
	}
	
	

}
