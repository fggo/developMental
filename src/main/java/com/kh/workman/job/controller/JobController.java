package com.kh.workman.job.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.workman.common.PageBarFactory;
import com.kh.workman.job.model.service.JobService;
import com.kh.workman.job.model.vo.JobBoard;
import com.kh.workman.member.model.vo.Member;

@Controller
public class JobController {


  @Autowired
  private JobService service;
  
  @RequestMapping("/job/jobApplyList")
  public String jobApplyList() {
    return "job/jobApplyList";
  }

  @RequestMapping("/job/jobBoardList")
  public ModelAndView jobBoardList(
    @RequestParam(value="cPage", required=false, defaultValue="1") int cPage) {
    ModelAndView mv = new ModelAndView();
    int numPerPage = 5;

    List<Map<String, Object>> list = service.selectPageJobBoardList(cPage, numPerPage);
    int totalCount = service.selectJobBoardCount();

    mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/job/jobBoardList"));
    mv.addObject("count", totalCount);
    mv.addObject("list", list);

    mv.setViewName("job/jobBoardList");

    return mv;
  }

  @RequestMapping("/job/jobContentView.do")
  public ModelAndView jobContentView(JobBoard j) {

    JobBoard board = service.selectJobBoardOne(j);

    ModelAndView mv = new ModelAndView();
    mv.addObject("jobBoard", board);
    mv.setViewName("job/jobContentView");
    
    return mv;
  }
  
  
  @RequestMapping("/job/postJob.do")
  public ModelAndView postJob(Member m) {
    ModelAndView mv = new ModelAndView();

    JobBoard j = new JobBoard();
    j.setNo(m.getNo());
    
    JobBoard board = service.selectJobBoardOne(j);

    mv.addObject("board", board);
    mv.setViewName("job/postJob");

    return mv;
  }
}
