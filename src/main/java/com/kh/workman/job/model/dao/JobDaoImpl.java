package com.kh.workman.job.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.workman.job.model.vo.JobBoard;
import com.kh.workman.member.model.vo.Member;

@Repository
public class JobDaoImpl implements JobDao {

  @Override
  public JobBoard selectJobBoardOne(SqlSessionTemplate session, JobBoard j) {
    return session.selectOne("job.selectJobBoardOne", j);
  }
  
  @Override
  public List<Map<String, Object>> selectPageJobBoardList(SqlSessionTemplate session, int cPage, int numPerPage) {
    RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);

    return session.selectList("job.selectPageJobBoardList", null, rows);
  }

  @Override
  public int selectJobBoardCount(SqlSessionTemplate session) {
    return session.selectOne("job.selectJobBoardCount");
  }

  @Override
  public int insertJobBoard(SqlSessionTemplate session, JobBoard job) {
    return session.insert("job.insertJobBoard", job);
  }

  
  
}
