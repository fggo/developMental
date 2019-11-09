//      전체
//    1 정규직
//    2 계약직
    url += "&loc_cd=" + "102000"; //location
  <div class="col-auto my-1">
    <select class="form-control-sm custom-select mr-2" id="inlineFormCustomSelect">
      <option selected disabled>지역</option>
      <option value="117000">전국</option>
    </select>
  </div>
      <option value="117000">전국</option>
      <option value="101000">서울</option>
      <option value="102000">경기</option>
      <option value="103000">광주</option>
      <option value="104000">대구</option>
      <option value="105000">대전</option>
      <option value="106000">부산</option>
      <option value="107000">울산</option>
      <option value="108000">인천</option>
      <option value="109000">강원</option>
      <option value="110000">경남</option>
      <option value="111000">경북</option>
      <option value="112000">전남</option>
      <option value="113000">전북</option>
      <option value="114000">충북</option>
      <option value="115000">충남</option>
      <option value="116000">제주</option>
      <option value="118000">세종</option>

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
select * from tab;

SELECT J.*, (SELECT COUNT(*) FROM APPLY_JOB WHERE J.NO = MEMBERNO) AS APPLICANTS
  FROM BOARD_JOB J ORDER BY REGDATE DESC;

SELECT * FROM APPLY_MEETUP;
SELECT * FROM BOARD_FREE;
SELECT * FROM BOARD_MEETUP;
SELECT * FROM BOARD_QNA;
SELECT * FROM COLLABO_CARD;
SELECT * FROM COLLABO_LIST;
SELECT * FROM COLLABO_MEMBER;
SELECT * FROM COLLABO_TOOL;
SELECT * FROM FILE_BOARD_FREE;
SELECT * FROM FILE_BOARD_MEETUP;
SELECT * FROM FILE_BOARD_QNA;
SELECT * FROM HASHTAG_FREE;
SELECT * FROM HASHTAG_MEETUP;
SELECT * FROM HASHTAG_QNA;
SELECT * FROM QNA_CATEGORY;
SELECT * FROM HASHTAG;

SELECT * FROM HASHTAG_JOB;
SELECT * FROM MEMBER;
SELECT * FROM BOARD_JOB;
SELECT * FROM FILE_BOARD_JOB;
SELECT * FROM APPLY_JOB;

select BOARD_JOB_SEQ.currval from dual;

--delete from apply_job where boardno=83;
--delete from file_board_job where orgname='Datadog.jpg';
--delete from board_job where writer='Datadog';
--delete from member where id='Datadog';

commit;

-- no(int), writer, title, content, regdate(date), count(int), status(int)

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME ='BOARD_JOB';
select * from user_sequences;

-----------------DDL-----------------
--DB 업데이트 11.02 : BOARD_JOB 컬럼 (content varchar2 -> content clob)
CREATE TABLE "WORKMAN"."BOARD_JOB" (
  "NO" NUMBER(5,0) NOT NULL, 
  "WRITER" VARCHAR2(100 BYTE) NOT NULL, 
  "TITLE" VARCHAR2(300 BYTE) NOT NULL, 
  "CONTENT" CLOB, 
  "REGDATE" DATE DEFAULT SYSDATE, 
  "COUNT" NUMBER(5,0) DEFAULT 0, 
  "STATUS" NUMBER(1,0) DEFAULT 1,

   CONSTRAINT "BOARD_JOB_PK" PRIMARY KEY ("NO"), 
   CONSTRAINT "BOARD_JOB_STATUS_CHK" CHECK (STATUS IN (0,1)),
   CONSTRAINT "BOARD_JOB_FK" FOREIGN KEY ("WRITER")
    REFERENCES "WORKMAN"."MEMBER" ("NICKNAME") 
   );
   COMMENT ON COLUMN "WORKMAN"."BOARD_JOB"."NO" IS '게시판번호 PK';
   COMMENT ON COLUMN "WORKMAN"."BOARD_JOB"."WRITER" IS '회원번호 FK';
   COMMENT ON COLUMN "WORKMAN"."BOARD_JOB"."TITLE" IS '제목';
   COMMENT ON COLUMN "WORKMAN"."BOARD_JOB"."CONTENT" IS '게시글 내용';
   COMMENT ON COLUMN "WORKMAN"."BOARD_JOB"."REGDATE" IS '작성일';
   COMMENT ON COLUMN "WORKMAN"."BOARD_JOB"."COUNT" IS '조회수';
   COMMENT ON COLUMN "WORKMAN"."BOARD_JOB"."STATUS" IS '게시글상태(0,1) ';

CREATE SEQUENCE BOARD_JOB_SEQ START WITH 1;
CREATE OR REPLACE TRIGGER "WORKMAN"."BOARD_JOB_TRG" 
BEFORE INSERT ON BOARD_JOB
FOR EACH ROW
BEGIN
SELECT BOARD_JOB_SEQ.NEXTVAL
INTO :NEW.NO
FROM DUAL;
END;
/

ALTER table board_job modify TITLE VARCHAR2(300 byte);
ALTER table board_job modify WRITER VARCHAR2(100 byte);
ALTER table board_job drop CONSTRAINT BOARD_JOB_STATUS_CHK;
ALTER table board_job add CONSTRAINT BOARD_JOB_STATUS_CHK CHECK (STATUS IN (0,1));
--delete from board_job;
COMMIT;

CREATE TABLE "WORKMAN"."APPLY_JOB" (
  "BOARDNO" NUMBER(5,0) NOT NULL , 
  "MEMBERNO" NUMBER(5,0) NOT NULL, 
  "RESUME" VARCHAR2(100 BYTE) NOT NULL , 
  "INTRO" VARCHAR2(100 BYTE) NOT NULL , 

 CONSTRAINT "APPLY_JOB_BOARD_FK" FOREIGN KEY ("BOARDNO")
   REFERENCES "WORKMAN"."BOARD_JOB" ("NO") ENABLE, 
 CONSTRAINT "APPLY_JOB_MEMBER_FK" FOREIGN KEY ("MEMBERNO")
   REFERENCES "WORKMAN"."MEMBER" ("NO") ENABLE
 );
COMMENT ON COLUMN "WORKMAN"."APPLY_JOB"."BOARDNO" IS '게시판번호 FK';
COMMENT ON COLUMN "WORKMAN"."APPLY_JOB"."MEMBERNO" IS '회원번호 FK';
COMMENT ON COLUMN "WORKMAN"."APPLY_JOB"."RESUME" IS '이력서';
COMMENT ON COLUMN "WORKMAN"."APPLY_JOB"."INTRO" IS '자기소개';

COMMENT ON COLUMN FILE_BOARD_JOB.BOARDNO IS '게시판번호 FK';
COMMENT ON COLUMN FILE_BOARD_JOB.ORGNAME IS '첨부파일 원래이름';
COMMENT ON COLUMN FILE_BOARD_JOB.NEWNAME IS '첨부파일 바뀐이름';

COMMENT ON COLUMN HASHTAG_JOB.BOARDNO IS '게시판번호 FK';
COMMENT ON COLUMN HASHTAG_JOB.HASHTAGNO IS '해시태그번호 FK';


CREATE TABLE "WORKMAN"."FILE_BOARD_JOB" (
  "BOARDNO" NUMBER(3,0) NOT NULL ENABLE, 
  "ORGNAME" VARCHAR2(300 BYTE) NOT NULL ENABLE, 
  "NEWNAME" VARCHAR2(300 BYTE) NOT NULL ENABLE, 

   CONSTRAINT "FILE_BOARD_JOB_FK" FOREIGN KEY ("BOARDNO")
     REFERENCES "WORKMAN"."BOARD_JOB" ("NO")
 );
 COMMENT ON COLUMN "WORKMAN"."FILE_BOARD_JOB"."BOARDNO" IS '게시판번호 FK';
 COMMENT ON COLUMN "WORKMAN"."FILE_BOARD_JOB"."ORGNAME" IS '첨부파일 원래이름';
 COMMENT ON COLUMN "WORKMAN"."FILE_BOARD_JOB"."NEWNAME" IS '첨부파일 바뀐이름';

CREATE TABLE "WORKMAN"."HASHTAG_JOB" (
   "BOARDNO" NUMBER(3,0) NOT NULL ENABLE, 
   "HASHTAGNO" NUMBER(3,0) NOT NULL ENABLE, 

   CONSTRAINT "HASHTAG_JOB_BNO_FK" FOREIGN KEY ("BOARDNO")
     REFERENCES "WORKMAN"."BOARD_JOB" ("NO") ENABLE, 
   CONSTRAINT "HASHTAG_JOB_NO_FK" FOREIGN KEY ("HASHTAGNO")
     REFERENCES "WORKMAN"."HASHTAG" ("NO") ENABLE
 );
COMMENT ON COLUMN "WORKMAN"."HASHTAG_JOB"."BOARDNO" IS '게시판번호 FK';
COMMENT ON COLUMN "WORKMAN"."HASHTAG_JOB"."HASHTAGNO" IS '해시태그번호 FK';
