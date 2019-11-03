package com.kh.workman.job.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.workman.job.model.dao.JobDao;
import com.kh.workman.job.model.vo.JobBoard;
import com.kh.workman.job.model.vo.JobBoardFile;

@Service
public class JobServiceImpl implements JobService {

  @Autowired
  JobDao dao;
  
  @Autowired
  SqlSessionTemplate session;

  @Override
  public JobBoard selectJobBoardOne(JobBoard j) {
    return dao.selectJobBoardOne(session, j);
  }
  
  @Override
  public List<Map<String, Object>> selectPageJobBoardList(int cPage, int numPerPage) {
    return dao.selectPageJobBoardList(session, cPage, numPerPage);
  }

  @Override
  public int selectJobBoardCount() {
    return dao.selectJobBoardCount(session);
  }

  @Override
  public int insertJobBoard(JobBoard job, List<JobBoardFile> jobBoardFileList) throws Exception{
    int result = 0;
    result = dao.insertJobBoard(session, job);
    if(result ==0) throw new RuntimeException(); //TransactionManager rollback automatically

    int boardNo =  dao.selectJobBoardSeq(session);
    
    if(jobBoardFileList != null && jobBoardFileList.size() > 0) {
      for(JobBoardFile f : jobBoardFileList) {
        f.setBoardNo(boardNo);
        result = dao.insertJobBoardFile(session, f);
        if(result ==0) throw new Exception();
      }
    }
    return result;
  }

}
