package com.kh.workman.common.api;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import com.fasterxml.jackson.databind.ObjectMapper;

import org.springframework.context.annotation.PropertySource;

  /** GitHub Jobs API implementation
   * @apiNote https://oapi.saramin.co.kr
   * @author junholee(jnuho@outlook.com)
   * @since 2019.11.03
   */
@PropertySource("classpath:s3cr3tk3y.properties")
public class JobSaramIn {
  private String id; // The unique identifier for a job.
  private String url; //채용공고 표준 URL. 공채속보의 경우, 리디렉션이 있을 수 있습니다.
  private int active;  //공고 진행 여부 1 : 진행중  0 : 마감

  private static Properties prop = new Properties();

  public static void main(String[] args) {
    System.out.println();
//    File file = new File("/").

    try {
      String path = JobSaramIn.class.getResource("/s3cr3tk3y.properties").getPath();
      prop.load(new FileReader(path));
    } catch(IOException e) {
      e.printStackTrace();
    }
    
    String key = prop.getProperty("apikey");


    ObjectMapper mapper = new ObjectMapper();

    
  }
}
