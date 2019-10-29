package com.kh.workman.collabo.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.workman.collabo.model.vo.CollaboCard;
import com.kh.workman.collabo.model.vo.CollaboList;
import com.kh.workman.collabo.model.vo.DataPacket;
import com.kh.workman.member.model.vo.Member;

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

	@Override
	public int createCard(SqlSessionTemplate session, DataPacket receive) {
		return session.insert("collabo.createCard", receive);
	}

	@Override
	public List<CollaboList> selectCollaboLists(SqlSessionTemplate session, int collaboNo) {
		return session.selectList("collabo.selectCollaboLists", collaboNo);
	}

	@Override
	public List<CollaboCard> selectCollaboCards(SqlSessionTemplate session, int collaboNo) {
		return session.selectList("collabo.selectCollaboCards", collaboNo);
	}

	@Override
	public int moveCard(SqlSessionTemplate session, DataPacket receive) {
		return session.update("collabo.moveCard", receive);
	}

	@Override
	public List<Member> selectCollaboMembers(SqlSessionTemplate session, int collaboNo) {
		return session.selectList("collabo.selectCollaboMembers",collaboNo);
	}

	@Override
	public int updateCard(SqlSessionTemplate session, DataPacket receive) {
		return session.update("collabo.updateCard",receive);
	}

}
