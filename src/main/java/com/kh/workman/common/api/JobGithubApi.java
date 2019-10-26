package com.kh.workman.common.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;

public class JobGithubApi {

  /** GitHub Jobs API implementation
   * @apiNote https://jobs.github.com/api
   * @author jnuho@outlook.com
   * @since 2019.10.26
   * @param skill : required skills by recruiting company
   * @param loc : city around the world(e.g. Los Angeles, Hamburg, ...)
   * @param page : page Number (e.g. 0[DEFAULT], 1, ...)
   * @return JobGithub[] : list of jobs
   */
  public static JobGithub[] jobsGithubApi(String skill, String loc, int page) {
    skill = skill.replace(" ", "+");
    loc = loc.replace(" ", "+");

    // Jackson : mapper
    ObjectMapper mapper = new ObjectMapper();
    
    //1. change the default name mapping of a field when Jackson is parsing JSON
    //2. alternatively in model.vo add annotation above fields: @JsonProperty("created_at")
    mapper.setPropertyNamingStrategy(PropertyNamingStrategy.SNAKE_CASE);

    BufferedReader br = null;
    String urlJobs = "https://jobs.github.com/positions.json" 
                   + "?description=" + skill 
                   + "&location=" + loc
                   + "&page=" + page;

    //convert parsed from github job api call result (JSON string)
    //into array of JobGithub objects
    JobGithub[] jobs = null;

    try {
      URL url = new URL(urlJobs);
      HttpURLConnection urlconnection = (HttpURLConnection)url.openConnection();
      urlconnection.setRequestMethod("GET");
      br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
      
      String result = "";
      String line = "";
      while((line = br.readLine()) != null)
        result += (line + "\n");

//      System.out.println("Job list size : " +jobs.length);
//      System.out.println(result);
      
      //read JSON and convert to array of Object type
      jobs= mapper.readValue(result, JobGithub[].class);


      //Crawl company Logo images,
      //  and set as field of each JobGithub object
      for(JobGithub job : jobs) 
        job.setCompanyLogo(JobGithubCrawler.crawlImg(job.getId()));
      
    } catch(MalformedURLException e) {
      e.printStackTrace();
    } catch(IOException e) {
      e.printStackTrace();
    }

    return jobs;
  }
  
  public static void main(String[] args) {
    JobGithubApi.jobsGithubApi("java", "Los Angeles", 1);
  }

}
