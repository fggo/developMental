package com.kh.workman.common.api;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

public class JobGithubCrawler {
    
  /**
   * @since 19.10.26
   * @author jnuho@outlook.com
   * @param id : parameter appended to request url
   * @return url : company logo image url
   * @implNote visited https://jobs.github.com/robots.txt
   * to check if crawling is allowed.
   * and subdirectories. It turned out users are allowed to crawl pages with 
   * this particular url patterns : https://jobs.github.com/positions/JOB_POST_ID_HERE
   */
//  The following is specification from https://jobs.github.com/robots.txt
//  String robotsTxt =""
//      + "User-agent: *            "
//      + "Allow: /$                "
//      + "Allow: /positions        "
//      + "Disallow: /positions/*/  "
//      + "Allow: /positions/       "
//      + "Allow: /companies/       "
//      + "Allow: /faq              "
//      + "Allow: /api              "
//      + "Allow: /post             "
//      + "Disallow: /              ";

  public static String crawlImg(String id) {

    String link = "https://jobs.github.com/positions/" + id; //link to be crawled
    String url = ""; //crawled logo image url
    try {
      Document doc = Jsoup.connect(link).get();
      Element img = doc.select("div.module.logo div.inner div.logo a img").first();

      if(img != null) //logo image exists
        url = img.absUrl("src");
      else //logo image does not exists
        url = "/resources/images/noimage.png";

    } catch(IOException e) {
      e.printStackTrace();
    }
    
    return url;
  }
  
  public static void main(String[] args) {
    JobGithubCrawler.crawlImg("Sesame");
    JobGithubCrawler.crawlImg("Datadog");
    JobGithubCrawler.crawlImg("Qualia Investments");
    JobGithubCrawler.crawlImg("Rational Consulting");

    
  }
}
