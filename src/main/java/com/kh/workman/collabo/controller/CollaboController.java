package com.kh.workman.collabo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.workman.collabo.model.service.CollaboService;
import com.kh.workman.collabo.model.vo.CollaboCard;
import com.kh.workman.collabo.model.vo.CollaboList;
import com.kh.workman.collabo.model.vo.CollaboTool;
import com.kh.workman.member.model.vo.Member;

@Controller
public class CollaboController {

	private Logger logger = LoggerFactory.getLogger(CollaboController.class);

	@Autowired
	CollaboService service;

//	  @RequestMapping("/collabo/main.do") public ModelAndView
//	  connectCollaboMain(ModelAndView mv) { mv.setViewName("collabo/main"); return
//	  mv; }

	@RequestMapping("/collabo/detail.do")
	public ModelAndView connectCollaboDetail(@RequestParam("collaboNo") int collaboNo) {
		List<CollaboList> collaboLists = service.selectCollaboLists(collaboNo);
		List<CollaboCard> collaboCards = service.selectCollaboCards(collaboNo);
		List<Member> collaboMembers = service.selectCollaboMembers(collaboNo);
		ModelAndView mav = new ModelAndView();
		mav.addObject("collaboNo",collaboNo);
		mav.addObject("collaboMembers", collaboMembers);
		mav.addObject("collaboLists", collaboLists);
		mav.addObject("collaboCards", collaboCards);
		mav.setViewName("collabo/detail");
		return mav;
	}

	@RequestMapping("/collabo/main")
	public ModelAndView connectCollaboMain(@RequestParam("userId") String userId) {
		logger.debug(userId);

		// List<CollaboTool> collaboTools = service.selectCollaboTools(userId);
		List<CollaboTool> collaboTools = service.selectCollaboTools(userId);
		List<Map<String, String>> collaboMemberList = service.selectCollaboMemberList(userId);
		logger.debug("" + collaboTools);

		ModelAndView mav = new ModelAndView();
		mav.addObject("collaboMemberList", collaboMemberList);
		mav.addObject("collaboTools", collaboTools);
		mav.setViewName("collabo/collaboMain");
		return mav;
	}

//	@RequestMapping("/collabo/create")
//	public String connectionCollaboCreate() {
//		return "collabo/createCollabo";
//	}

	@RequestMapping("/collabo/createCollabo")
	public ModelAndView createCollabo(@RequestParam("title") String title, @RequestParam("userId") String userId) {
		ModelAndView mav = new ModelAndView();
		if (userId != null && title != null) {
			Map<String, Object> temp = new HashMap<String, Object>();
			temp.put("userId", userId);
			temp.put("title", title);
			boolean isSuccess = service.createCollaboTool(temp) == 1 ? true : false;
			boolean isMemberSuccess = service.insertCollaboMember(temp) == 1 ? true : false;
			logger.debug("" + isSuccess);
			logger.debug("" + isMemberSuccess);
			mav.setViewName("common/msg");
			if (isSuccess && isMemberSuccess) {
				mav.addObject("msg", "생성에 성공했습니다.");
				mav.addObject("loc", "/collabo/main?userId=" + userId);
			} else {
				mav.addObject("msg", "생성에 실패했습니다.");
				mav.addObject("loc", "/collabo/main?userId=" + userId);
			}
		}
		return mav;
	}
}
