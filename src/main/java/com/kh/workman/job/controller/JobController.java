package com.kh.workman.job.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.workman.common.PageBarFactory;
import com.kh.workman.common.api.JobGithubApi;
import com.kh.workman.job.model.service.JobService;
import com.kh.workman.job.model.vo.JobApply;
import com.kh.workman.job.model.vo.JobBoard;
import com.kh.workman.job.model.vo.JobBoardFile;
import com.kh.workman.member.model.vo.Member;

@Controller
public class JobController {

  private Logger logger = LoggerFactory.getLogger(JobController.class);

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

  @RequestMapping("/job/jobApply")
  public ModelAndView applyJob(JobBoard j, HttpSession session, String imageURL) {

//    int result = service.insertJobBoard(j);
//
//    JobApply apply = new JobApply();
//    apply.setBoardNo(j.getNo());
//    apply.setIntro("");
//    apply.setMemberNo(((Member)session.getAttribute("loginMember")).getNo());
//    apply.setResume("");

    ModelAndView mv = new ModelAndView();
    mv.addObject("jobBoard", j);
    mv.setViewName("job/jobApplyForm");
    
    return mv;
  }

  @RequestMapping("/job/jobApplyEnd.do")
  public ModelAndView applyJobEnd(HttpSession session,
      @RequestParam(value="orgNames", required=false) MultipartFile[] orgNames,
        String imageURL) {
//  private String company;
//  private String title; 
//  private String companyUrl; input type ="text"
//  private String url; input type="text"
//  private Date createdAt;  calendar
//  private String location; input google api
//  private String description; input type="text"
//  private String howToApply; input type="text"
//  private String companyLogo; input type="file"

    ModelAndView mv = new ModelAndView();
    mv.setViewName("/");
    
    return mv;
  }
  
  @RequestMapping("/job/jobEnroll")
  public ModelAndView jobEnrollView() {
    ModelAndView mv = new ModelAndView();

    mv.setViewName("job/jobEnroll");

    return mv;
  }
  
  @RequestMapping("/job/jobEnrollEnd.do")
  public ModelAndView jobEnrollEnd(JobBoard j, HttpSession session,
        @RequestParam(value="orgNames", required=false) MultipartFile[] orgNames,
        @RequestParam(value="jobType") String jobType,
        @RequestParam(value="location") String location,
        @RequestParam(value="description") String description,
        @RequestParam(value="howToApply") String howToApply){
    
    logger.debug("Original job board file name : " + orgNames[0].getOriginalFilename());

    /* 파일업로드 처리하기 */
    //1.저장경로 지정하기
    String saveDir = session.getServletContext().getRealPath("/resources/upload/job");
    List<JobBoardFile> jobBoardFileList = new ArrayList<JobBoardFile>(); //여러파일 보관용

    File dir = new File(saveDir);

    if(!dir.exists()) logger.debug("" + dir.mkdirs());

    for(MultipartFile f : orgNames) {
      if(!f.isEmpty()) {
        //rename file name
        String orgName = f.getOriginalFilename();
        String ext = orgName.substring(orgName.lastIndexOf("."));
        
        //set file renaming rules
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHMMssSSS");

        //generate random number for renaming
        int rdv = (int)(Math.random()*1000);
        String newName = sdf.format(System.currentTimeMillis()) + "_" + rdv+ ext;

        try {
          f.transferTo(new File(saveDir + "/" + newName));
        } catch(Exception e) {
          e.printStackTrace(); //IllegalStateException, IOException
        }
        
        //save data to insert to DB 
        JobBoardFile jbf = new JobBoardFile();
//        jbf.setBoardNo(j.getNo());
        jbf.setOrgName(orgName);
        jbf.setNewName(newName);
        jobBoardFileList.add(jbf);
      }
    }

    logger.debug(j.toString());
    logger.debug("--------------------------");
    logger.debug(jobType);
    logger.debug(location);
    logger.debug(description);
    logger.debug(howToApply);

    j.setContent("Ⅰ. Job Type : " + jobType
            + "\nⅡ. Location : " + location
            + "\nⅢ. Description : " + description
            + "\nⅣ. How to Apply : " + howToApply + "\n");

    int result = 0;
    try {
      result = service.insertJobBoard(j, jobBoardFileList);
    } catch(Exception e) {
      e.printStackTrace();
    }

    String msg = "", loc= "";
    if(result > 0) {
      msg = "Job Recruiting post Successful!";
      loc = "jobBoardList";
    }
    else {
      msg="Job Recruiting post Failed!\nYour company has already posted one...";
      loc="/";
    }
    
    ModelAndView mv = new ModelAndView();
    mv.addObject("msg", msg);
    mv.addObject("loc", loc);
    mv.setViewName("common/msg");

    return mv;
  }
}
