package com.kh.workman.job.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class JobDaoImpl implements JobDao {

  @Override
  public List<Map<String, Object>> selectJobBoardList(SqlSessionTemplate session) {
    return session.selectList("job.selectJobBoardList");
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

}
