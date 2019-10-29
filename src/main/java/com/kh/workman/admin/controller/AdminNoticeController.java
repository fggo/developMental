package com.kh.workman.admin.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminNoticeController {
	
	private Logger logger=LoggerFactory.getLogger(AdminNoticeController.class);
	
//	@Autowired
//	AdminNoticeService service;
	
	@RequestMapping("/admin/noticeList")
	public ModelAndView noticeList(@RequestParam(value="cPage", required=false, defaultValue="0") int cPage) {
		ModelAndView mv = new ModelAndView();
		
		int numPerPage=10;
//		List<Map<String,String>> list = service.selectNoticeList(cPage,numPerPage);
		
		return mv;
	}
	
	
//	@RequestMapping("/admin/noticeInsert.do")
	
	

}
