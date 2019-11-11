package com.kh.workman.common.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

  /**
   * @apiNote saramin
   * @author jnuho@outlook.com
   * @since 2019.11.03
   */
//@PropertySource("classpath:/properties/config.properties")
public class JobSaramIn {
//	@Value("${junho}")
//	private static String junho;

  public static void main(String[] args) throws IOException {
    String reqUrl ="http://oapi.saramin.co.kr/job-search";

    String junho="9cqG2CIeznBzcZq9soJjeJmbsNP18TVHbNr7g8eeOpvp7BHn06";
    reqUrl+= "?access-key=" + junho;
    String keywords = "자바 백엔드".replace(" ", "%20");
    reqUrl += "&keywords=" + keywords; //separated by %20 and , // PHP%20MySQL, PHP+MySQL, PHP,MySQL
    reqUrl += "&job_type=" + "1"; //"" all 1 full time / 2 contract
    reqUrl += "&loc_cd=" + "101000"; //location 101000  서울
    reqUrl += "&ind_cd=" + "308"; //industry category 308 정보보안·백신 3
    reqUrl += "&job_category=" + "402"; //job category 402 서버·네트워크·보안  4
    reqUrl += "&count=10"; //10 ~ max 110 jobs
    reqUrl += "&sort=da";
    System.out.println(reqUrl);

    URL url = new URL(reqUrl);
    HttpURLConnection conn = (HttpURLConnection)url.openConnection();
    conn.setRequestMethod("GET");
    conn.setRequestProperty("Accept", "application/json");  // conn.setRequestProperty("Content-Type", "application/json");
    //read
    String result = "";
    String line = "";

    try(InputStreamReader is = new InputStreamReader(conn.getInputStream());
      BufferedReader br = new BufferedReader(is);){
      line = br.readLine();
      System.out.println(line);

//      while((line = br.readLine()) != null)
//        result += (line + "\n");
      
      System.out.println(result);
      
    } catch(IOException e) {
      e.printStackTrace();
    }

//    ObjectMapper mapper = new ObjectMapper();
//    List<Map<String, String>> list = bService.selectBoardList(1, 5);
//    return mapper.writeValueAsString(list);
  }
}
