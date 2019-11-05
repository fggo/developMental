package com.kh.workman.collabo.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.workman.collabo.model.vo.CollaboCard;
import com.kh.workman.collabo.model.vo.CollaboList;
import com.kh.workman.collabo.model.vo.CollaboTool;
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
		return session.selectList("collabo.selectCollaboMembers", collaboNo);
	}

	@Override
	public int updateCard(SqlSessionTemplate session, DataPacket receive) {
		return session.update("collabo.updateCard", receive);
	}

	@Override
	public int deleteCard(SqlSessionTemplate session, DataPacket receive) {
		return session.delete("collabo.deleteCard", receive);
	}

	@Override
	public int deleteList(SqlSessionTemplate session, DataPacket receive) {
		return session.delete("collabo.deleteList", receive);
	}

	@Override
	public int deleteListToCards(SqlSessionTemplate session, DataPacket receive) {
		return session.delete("collabo.deleteListToCards", receive);
	}

	@Override
	public int updateList(SqlSessionTemplate session, DataPacket receive) {
		return session.delete("collabo.updateList", receive);
	}

	@Override
	public int moveList(SqlSessionTemplate session, DataPacket receive) {
		return session.update("collabo.moveList", receive);
	}

	@Override
	public int searchListPlaceNo(SqlSessionTemplate session, DataPacket receive) {
		return session.selectOne("collabo.searchListPlaceNo", receive);
	}

	@Override
	public List<CollaboTool> selectCollaboTools(SqlSessionTemplate session, String userId) {
		return session.selectList("collabo.selectCollaboTools", userId);
	}

	@Override
	public List<Map<String, String>> selectCollaboMemberList(SqlSessionTemplate session, String userId) {
		return session.selectList("collabo.selectCollaboMemberList", userId);
	}

	@Override
	public int createCollaboTool(SqlSessionTemplate session, Map<String, Object> temp) {
		return session.insert("collabo.createCollaboTool", temp);
	}

	@Override
	public int insertCollaboMember(SqlSessionTemplate session, Map<String, Object> temp) {
		return session.insert("collabo.insertCollaboMember", temp);
	}

}
