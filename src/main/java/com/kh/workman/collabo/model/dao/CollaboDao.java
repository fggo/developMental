package com.kh.workman.collabo.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.workman.collabo.model.vo.CollaboList;

public interface CollaboDao {

	int createList(SqlSessionTemplate session, HashMap<String, Object> receiveMessage);

	HashMap<String, Object> selectCollaboListOne(SqlSessionTemplate session, int target);

	List<HashMap> participation(SqlSessionTemplate session, int collaboNo);

}
