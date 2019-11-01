package com.kh.workman.common.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
  public static List<Map<String, Object>> jobsGithubApi(String skill, String loc, int page) {
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
    List<JobGithub> jobs = null;
    List<Map<String, Object>> newList = new ArrayList<Map<String,Object>>();

    try {
      URL url = new URL(urlJobs);
      HttpURLConnection urlconnection = (HttpURLConnection)url.openConnection();
      urlconnection.setRequestMethod("GET");
      br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
      
      String result = "";
      String line = "";
      while((line = br.readLine()) != null)
        result += (line + "\n");

      //read JSON and convert to array of Object type
      jobs= Arrays.asList(mapper.readValue(result, JobGithub[].class));

      System.out.println("Job list size : " +jobs.size());
      System.out.println(result);

      //Crawl company Logo images,
      //  and set as field of each JobGithub object
      // 'newMap' instance is basically equivalent to
      // 'JobBoard' + {"imageUrl": crawledImgurl}
      Map<String,Object> newMap = new HashMap<String, Object>();

      for(JobGithub job : jobs) {
        newMap = new HashMap<String, Object>();
        job.setCompanyLogo(JobGithubCrawler.crawlImg(job.getId()));

        String content = "Ⅰ. Job Type: " + job.getType() + "\n"
          + "Ⅱ. Location : " + job.getLocation() + "\n"
          + "Ⅲ. Description : " + job.getDescription() + "\n"
          + "Ⅳ. How to Apply : " + job.getHowToApply();

        newMap.put("NO", 0);
        newMap.put("WRITER", job.getCompany());
        newMap.put("TITLE", job.getTitle());
        newMap.put("CONTENT", content);
        newMap.put("REGDATE", new java.sql.Date(job.getCreatedAt().getTime()));
        newMap.put("COUNT", 0);
        newMap.put("STATUS", 1);
        newMap.put("APPLICANTS", 0);
        newMap.put("imageURL", job.getCompanyLogo());

        newList.add(newMap);
      }

      
    } catch(MalformedURLException e) {
      e.printStackTrace();
    } catch(IOException e) {
      e.printStackTrace();
    }

    return newList;
  }
}
