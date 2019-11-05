package com.kh.workman.admin.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.workman.admin.model.service.NoticeService;
import com.kh.workman.admin.model.vo.AdminAttachment;
import com.kh.workman.admin.model.vo.AdminNotice;
import com.kh.workman.common.PageBarFactory;

@Controller
public class AdminNoticeController {
	
	private Logger logger=LoggerFactory.getLogger(AdminNoticeController.class);
	
	@Autowired
	NoticeService service;
	
	@RequestMapping("/admin/noticeList")	
	public ModelAndView noticeList(@RequestParam(value="cPage", required=false, defaultValue="0") int cPage) {
		ModelAndView mv = new ModelAndView();
		
		int numPerPage=10;
		//공지사항 리스트 전부 불러오기
		List<AdminNotice> list = service.selectNoticeList(cPage,numPerPage);
		//사진파일 리스트 전부 불러오기
		List<AdminAttachment> attList = service.selectAttachList();
		
		int totalCount = service.selectNoticeCount();
		mv.addObject("pageBar", PageBarFactory.getAdminPageBar(totalCount, cPage, numPerPage, "/admin/noticeList"));
		mv.addObject("count",totalCount);
		mv.addObject("list", list);
		mv.addObject("attList", attList);
		
		System.out.println("list : "+list);
		System.out.println("totalcnt : "+totalCount);
		System.out.println("attList : "+attList);
		
		mv.setViewName("admin/notice/adminNoticeList");
		
		return mv;
	}
	
	@RequestMapping("/admin/noticeForm")
	public String noticeForm() {
		return "admin/notice/adminNoticeForm";
	}
	
	@RequestMapping("/admin/noticeFormEnd.do")
	public ModelAndView insertNotice(@RequestParam Map<String,String> param, 
			@RequestParam(value="upFile", required=false) MultipartFile[] upFile ,HttpServletRequest request) {
		
		System.out.println("param : "+param);
		System.out.println("upFile : "+upFile);
		
		//1. 저장경로 지정하기
		String saveDir=request.getSession().getServletContext().getRealPath("/resources/upload/notice");
		List<AdminAttachment> attachList=new ArrayList();//여러파일 보관용
		
		File dir=new File(saveDir);
		if(!dir.exists()) logger.debug("생성결과 : "+dir.mkdirs());
		for(MultipartFile f : upFile) {
			if(!f.isEmpty()) {
				//파일명 생성(rename)
				String oriFileName=f.getOriginalFilename();
				String ext=oriFileName.substring(oriFileName.lastIndexOf("."));
				
				//규칙설정
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHMMssSSS");
				int rdv=(int)(Math.random()*1000);
				String reName=sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
				
				//파일 실제 저장하기
				try {
					f.transferTo(new File(saveDir+"/"+reName));
				}catch (Exception e) {//IlligalStateException|IOException
					e.printStackTrace();
				}
				//DB에 저장할 데이터 보관
				AdminAttachment att=new AdminAttachment();
				att.setOriginalFileName(oriFileName);
				att.setRenamedFileName(reName);
				attachList.add(att);
			}

		}
		int result=service.insertNotice(param,attachList);
		
		String msg="";
		String loc="/admin/noticeList";
		if(result>0) {
			msg="입력성공";
		}else {
			msg="입력실패";
		}
		ModelAndView mv= new ModelAndView();
				
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/admin/noticeDelete")
	public String noticeDelete(@RequestParam String noticeNo, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("noticeNo", noticeNo);
		
		int num = service.deleteNotice(map);
		
		String msg="";
		String loc="";
		
		if(num==1) {
			msg+="공지사항 삭제 완료";
			loc+="/admin/noticeList";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);
		}else {
			msg+="공지사항 삭제 실패";
			loc+="/admin/noticeList";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);
		}
		
		return "common/msg";
	}
	
	@RequestMapping("/admin/adminNoticeView.do")
	public ModelAndView noticeView(String noticeNo) {
		System.out.println("찍히나? : "+noticeNo);
		ModelAndView mv = new ModelAndView();
//		Map<String, String> notice = service.noticeView(noticeNo);
//		mv.addObject("notice", notice);
		mv.setViewName("admin/notice/adminNoticeView");
		
		return mv;
	}

}
