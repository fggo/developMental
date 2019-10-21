package com.kh.workman.job.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.workman.job.model.service.JobService;
import com.kh.workman.job.model.vo.JobBoard;

@Controller
public class JobController {


  @Autowired
  private JobService service;
  
  @RequestMapping("/job/jobView")
  public String jobView() {
    return "job/jobView";
  }
  
  @RequestMapping("/job/jobBoardView")
  public String jobBoardView() {
    return "job/jobBoardView";
  }

  @RequestMapping("/job/jobBoardContent")
  public ModelAndView jobBoardContent(JobBoard j) {
    ModelAndView mv = new ModelAndView();
    mv.setViewName("job/jobBoardContent");
    
    return mv;
  }
  @RequestMapping("/job/jobApplyView")
  public String jobApplyView() {
    return "job/jobApplyView";
  }
  
}
