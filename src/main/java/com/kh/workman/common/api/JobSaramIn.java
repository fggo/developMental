package com.kh.workman.common.api;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;

import com.fasterxml.jackson.databind.ObjectMapper;

  /**
   * @apiNote saramin
   * @author jnuho@outlook.com
   * @since 2019.11.03
   */
@PropertySource("classpath:/properties/config.properties")
public class JobSaramIn {
  private String keywords; // The unique identifier for a job.
  private int active;  //공고 진행 여부 1 : 진행중  0 : 마감

	@Value("${junho}")
	private static String junho;

  public static void main(String[] args) {

    //params >=1 is separated by %20 ,
    //e.g. PHP%20MySQL PHP+MySQL, PHP,MySQL
    String url ="http://oapi.saramin.co.kr/job-search";
    url += "?access-key=" + junho;
    url += "&keywords=" + "웹+퍼블리셔";
    url += "&job_type=" + "1"; //full time / contract
//      전체
//    1 정규직
//    2 계약직
    url += "&loc_cd=" + "102000"; //location
//    117000  전국
//    101000  서울
//    102000  경기
//    103000  광주
//    104000  대구
//    105000  대전
//    106000  부산
//    107000  울산
//    108000  인천
//    109000  강원
//    110000  경남
//    111000  경북
//    112000  전남
//    113000  전북
//    114000  충북
//    115000  충남
//    116000  제주
//    118000  세종
    url += "&ind_cd=" + "308"; //industry category
//    301 솔루션·SI·ERP·CRM  3
//    302 웹에이젼시 3
//    304 쇼핑몰·오픈마켓  3
//    305 포털·인터넷·컨텐츠  3
//    306 네트워크·통신·모바일 3
//    307 하드웨어·장비 3
//    308 정보보안·백신 3
//    313 IT컨설팅 3
//    314 게임  3
    url += "job_category=" + "402"; //job category
//    401 웹마스터·QA·테스터 4
//    402 서버·네트워크·보안  4
//    403 웹기획·PM  4
//    404 웹개발 4
//    405 게임·Game 4
//    406 컨텐츠·사이트운영 4
//    407 응용프로그램개발  4
//    408 시스템개발 4
//    409 ERP·시스템분석·설계  4
//    410 통신·모바일  4
//    411 하드웨어·소프트웨어  4
//    412 웹디자인  4
//    413 퍼블리싱·UI개발 4
//    414 동영상·편집·코덱 4
//    415 IT·디자인·컴퓨터교육  4
//    416 데이터베이스·DBA  4
//    417 인공지능(AI)·빅데이터 4
    url += "&count=10"; //10 ~ max 110 jobs
    url += "&sort=da"; // deadline ascending


    ObjectMapper mapper = new ObjectMapper();

    
  }
}
