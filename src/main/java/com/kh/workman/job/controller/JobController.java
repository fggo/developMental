package com.kh.workman.job.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.workman.common.PageBarFactory;
import com.kh.workman.common.api.JobGithubApi;
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
      @RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
      @RequestParam(value="skill", required=false) String skill,
      @RequestParam(value="loc", required=false) String loc,
      @RequestParam(value="page", required=false, defaultValue="1") String page) {

    //1. Job Listings From Database (At least 1 Member Applied for the position)
    ModelAndView mv = new ModelAndView();
    int numPerPage = 5;

    List<Map<String, Object>> list = service.selectPageJobBoardList(cPage, numPerPage);
    int totalCount = service.selectJobBoardCount();

    //2. Additional Job Listings From Github Job API (Not inserted into DB yet!)
    //   this data lists are inserted AFTER at least one Member applies for the position!
    //TODO: test data(to be replaced with User Input!)
//    skill="java";
//    loc = "Los Angeles";
//    page = "1";

    List<Map<String, Object>> newList = null;
    if(skill != null && loc!=null ) {
      newList = JobGithubApi.jobsGithubApi(skill, loc, Integer.valueOf(page));
    }

    mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/job/jobBoardList"));
    mv.addObject("count", totalCount);
    mv.addObject("list", list);
    mv.addObject("newList", newList);
    
    mv.setViewName("job/jobBoardList");

    return mv;
  }

  @RequestMapping("/job/jobContentView.do")
  public ModelAndView jobContentView(JobBoard j, 
        @RequestParam(value="imageURL", required=false) String imageURL) {

    System.out.println(j);
    JobBoard board = null;

    if(j.getNo() != 0)
      board = service.selectJobBoardOne(j);
    else
      board = j;

    ModelAndView mv = new ModelAndView();
    mv.addObject("jobBoard", board);
    mv.addObject("imageURL", imageURL);

    mv.setViewName("job/jobContentView");
    
    return mv;
  }
  @RequestMapping("/job/applyJob.do")
  public ModelAndView applyJob() {
    ModelAndView mv = new ModelAndView();
    
    return mv;
  }
  
  @RequestMapping("/job/jobEnroll")
  public ModelAndView jobEnrollView() {
    ModelAndView mv = new ModelAndView();

    mv.setViewName("job/jobEnroll");

    return mv;
  }

  @RequestMapping("/job/jobEnrollEnd.do")
  public ModelAndView jobEnrollEnd(JobBoard j) {
    ModelAndView mv = new ModelAndView();

    int result = service.insertJobBoard(j);
      
    String msg = "", loc= "";

    if(result == 0) {
      msg="Your company already enrolled Job Post.";
      loc="/";
    }
    else {
      msg = "Successfully enrolled company Job Post";
      loc = "mainView";
    }

    mv.addObject("msg", msg);
    mv.addObject("loc", loc);
      
    mv.setViewName("common/msg");

    return mv;
  }
}
