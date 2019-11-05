package com.kh.workman.study.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class StudyDaoImpl implements StudyDao {

	@Override
	public int selectStudyBoardCount(SqlSessionTemplate session) {
		return session.selectOne("study.selectStudyBoardCount");
	}

	@Override
	public List<Map<String, String>> selectStudyBoardList(SqlSessionTemplate session, int cPage, int numPerPage) {
		RowBounds rows=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("study.selectStudyBoardList",null,rows);
	}
	
	
	
}
