package com.kh.workman.job.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class JobBoard {
  private int no;
  private String writer;
  private String title;
  private String content;
  private Date regDate;
  private int count;
  private int status;
}
