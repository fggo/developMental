package com.kh.workman.job.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.workman.job.model.vo.JobBoard;

public interface JobDao {

  JobBoard selectJobBoardOne(SqlSessionTemplate session, JobBoard j);

  List<Map<String, Object>> selectPageJobBoardList(SqlSessionTemplate session, int cPage, int numPerPage);
  
  int selectJobBoardCount(SqlSessionTemplate session);
  
  int insertJobBoard(SqlSessionTemplate session, JobBoard job);
}
