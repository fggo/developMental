package com.kh.workman.collabo.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.workman.collabo.model.vo.CollaboList;
import com.kh.workman.collabo.model.vo.DataPacket;

public interface CollaboDao {

	int createList(SqlSessionTemplate session, DataPacket receive);

	CollaboList selectCollaboListOne(SqlSessionTemplate session, int target);

	List<HashMap> participation(SqlSessionTemplate session, int collaboNo);

}
