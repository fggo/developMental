package com.kh.workman.collabo.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.workman.collabo.model.service.CollaboService;
import com.kh.workman.collabo.model.vo.CollaboCard;
import com.kh.workman.collabo.model.vo.CollaboList;
import com.kh.workman.member.model.vo.Member;

@Controller
public class CollaboController {

	private Logger logger = LoggerFactory.getLogger(CollaboController.class);

	@Autowired
	CollaboService service;

	@RequestMapping("/collabo/main.do")
	public ModelAndView connectCollaboMain(ModelAndView mv) {
		mv.setViewName("collabo/main");
		return mv;
	}

	@RequestMapping("/collabo/detail.do")
	public ModelAndView connectCollaboDetail(@RequestParam("collaboNo") int collaboNo) {
		List<CollaboList> collaboLists = service.selectCollaboLists(collaboNo);
		List<CollaboCard> collaboCards = service.selectCollaboCards(collaboNo);
		List<Member> collaboMembers = service.selectCollaboMembers(collaboNo);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("collaboMembers",collaboMembers);
		mav.addObject("collaboLists",collaboLists);
		mav.addObject("collaboCards",collaboCards);
		mav.setViewName("collabo/detail");
		return mav;
	}
	
}
