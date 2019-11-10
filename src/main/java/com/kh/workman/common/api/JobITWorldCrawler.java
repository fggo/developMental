package com.kh.workman.common.api;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class JobITWorldCrawler {
    
  /**
   * @since 19.11.10
   * @author jnuho@outlook.com
   * @param id : parameter appended to request url
   * @return url : company logo image url
   * @implNote visited http://www.itworld.co.kr/robots.txt to check if crawling is allowed.
   */
//  The following is specification from http://www.itworld.co.kr/robots.txt
  
//  User-agent: *
//  Crawl-delay: 5
//  Allow: /
//
//  Disallow: 
//  # Directories
//  Disallow: /_connector/
//  Disallow: /_extension/
//  Disallow: /download/
//  # Paths (clean URLs)
//  Disallow: /node/
//  Disallow: /admin/

  public static List<Map<String,String>> crawlNewsList() {

    String url = "http://www.itworld.co.kr/main/";

    Document doc = null;
    try {
      doc = Jsoup.connect(url).get();
    } catch(IOException e) {
      e.printStackTrace();
    }

    //메인뉴스 리스트
    Elements headerList = doc.select("#main_top_news_list div.main_news_list "
        + "div.fl div.of-h").next().select("h4.news_list_title a");

    //메인뉴스 썸네일 이미지 리스트
    Elements imgList = doc.select("#main_top_news_list div.main_news_list "
        + "div.news_list_image img.fit_image");

    List<Map<String, String>> list = new ArrayList<Map<String, String>>();
    Map<String, String> map = new HashMap<String, String>();

    for(int i =0 ;i<5; i++) {
      Element head = headerList.get(i);
      head.attr("href", "http://www.itworld.co.kr" + head.attr("href"));
      head.attr("target", "_blank");

      map = new HashMap<String, String>();
      map.put("newsTag", head.toString());
      map.put("newsImageUrl", imgList.get(i).absUrl("src"));

      list.add(map);
    }

    return list;
  }
}
