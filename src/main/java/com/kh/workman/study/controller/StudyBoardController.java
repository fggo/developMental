package com.kh.workman.study.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.workman.common.PageBarFactory;
import com.kh.workman.study.model.service.StudyService;

@Controller
public class StudyBoardController {
	private Logger logger = LoggerFactory.getLogger(StudyBoardController.class);
	
	 @Autowired
	 private StudyService service;

	@RequestMapping("/study/studyList")
	public ModelAndView boardList(@RequestParam(value="cPage", 
	required=false, defaultValue="0") int cPage) {
		ModelAndView mv=new ModelAndView();
		
		int numPerPage=5;
		List<Map<String,String>> list=service.selectStudyBoardList(cPage,numPerPage);
		int totalCount=service.selectStudyBoardCount();
		mv.addObject("pageBar",PageBarFactory.getAdminPageBar(totalCount, cPage, numPerPage, "/spring/study/studyList"));
		mv.addObject("count",totalCount);
		mv.addObject("list",list);
		mv.setViewName("study/studyBoardList");
		return mv;
	}
	
	  
	 
}
