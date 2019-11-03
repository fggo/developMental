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

SELECT * FROM MEMBER;
SELECT * FROM HASHTAG;
SELECT * FROM HASHTAG_JOB;
SELECT * FROM FILE_BOARD_JOB;
SELECT * FROM APPLY_JOB;
SELECT * FROM BOARD_JOB;

select BOARD_JOB_SEQ.currval from dual;
--delete from board_job;
commit;

-- no(int), writer, title, content, regdate(date), count(int), status(int)

INSERT into board_job values(default, 'user01', 'Not Hiring', 'clulululul dsajhda sjhdsajjdsa', default, default, default);
INSERT into board_job values(default, 'user02', 'Recruit', 'THis is a job description. Hello just apply and have an interview.', default, default, default);
INSERT into board_job values(default, 'user02', 'Skwwwwww', 'ehllo. please don;t. no interview available', default, default, default);
INSERT into board_job values(default, 'user00', 'Aint no joke', 'We are laboring company. Please dont apply.', default, default, default);
INSERT into board_job values(default, 'user00', 'Aint no joke', 'We are laboring company. Please dont apply.', default, default, default);
INSERT into board_job values(default, 'Yoon', 'TeamYS', 'we are hiring noobies. Please submit your $5000 fee and youre good to work here', default, default, default);

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

