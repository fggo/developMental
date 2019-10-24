package com.kh.workman.collabo.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.workman.collabo.model.vo.CollaboList;
import com.kh.workman.collabo.model.vo.DataPacket;

@Repository
public class CollaboDaoImpl implements CollaboDao {

	@Override
	public int createList(SqlSessionTemplate session, DataPacket receive) {
		return session.insert("collabo.createList", receive);
	}

	@Override
	public CollaboList selectCollaboListOne(SqlSessionTemplate session, int target) {
		return session.selectOne("collabo.selectCollaboListOne", target);
	}

	@Override
	public List<HashMap> participation(SqlSessionTemplate session, int collaboNo) {
		return session.selectList("collabo.participation", collaboNo);
	}

}
