package com.kh.workman.home.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
  
  @RequestMapping("/")
  public String home() {
    return "index";
  }
  
  @RequestMapping("/mainView")
  public String mainView(HttpServletRequest req) {
    return "home/mainView";
  }
}
