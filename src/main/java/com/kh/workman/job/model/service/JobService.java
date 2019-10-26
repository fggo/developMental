package com.kh.workman.job.model.service;

import java.util.List;
import java.util.Map;

import com.kh.workman.job.model.vo.JobBoard;
import com.kh.workman.member.model.vo.Member;

public interface JobService {

  JobBoard selectJobBoardOne(JobBoard j);

  List<Map<String, Object>> selectPageJobBoardList(int cPage, int numPerPage);

  int selectJobBoardCount();
}
