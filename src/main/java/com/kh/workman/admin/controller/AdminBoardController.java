package com.kh.workman.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminBoardController {
	
//	@Autowired
//	private AdminBoardService service;
	
	@RequestMapping("/admin/adminBoard")
	public String board() {
		return "admin/adminBoard";
	}

}
