package com.kh.workman.collabo.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.workman.collabo.model.dao.CollaboDao;
import com.kh.workman.collabo.model.vo.CollaboCard;
import com.kh.workman.collabo.model.vo.CollaboList;
import com.kh.workman.collabo.model.vo.CollaboTool;
import com.kh.workman.collabo.model.vo.DataPacket;
import com.kh.workman.member.model.vo.Member;

@Service
public class CollaboServiceImpl implements CollaboService {
	@Autowired
	CollaboDao dao;

	@Autowired
	SqlSessionTemplate session;

	@Override
	public int createList(DataPacket receive) {
		return dao.createList(session, receive);
	}

	@Override
	public CollaboList selectCollaboListOne(int target) {
		return dao.selectCollaboListOne(session, target);
	}

	@Override
	public List<HashMap> participation(int collaboNo) {
		return dao.participation(session, collaboNo);
	}

	@Override
	public int createCard(DataPacket receive) {
		return dao.createCard(session, receive);
	}

	@Override
	public List<CollaboList> selectCollaboLists(int collaboNo) {
		return dao.selectCollaboLists(session, collaboNo);
	}

	@Override
	public List<CollaboCard> selectCollaboCards(int collaboNo) {
		return dao.selectCollaboCards(session, collaboNo);
	}

	@Override
	public int moveCard(DataPacket receive) {
		return dao.moveCard(session, receive);
	}

	@Override
	public List<Member> selectCollaboMembers(int collaboNo) {
		return dao.selectCollaboMembers(session, collaboNo);
	}

	@Override
	public int updateCard(DataPacket receive) {
		return dao.updateCard(session, receive);
	}

	@Override
	public List<CollaboTool> selectCollaboTools(String userId) {
		return dao.selectCollaboTools(session, userId);
	}

	@Override
	public int deleteCard(DataPacket receive) {
		return dao.deleteCard(session, receive);
	}

	@Override
	public int deleteList(DataPacket receive) {
		return dao.deleteList(session, receive);
	}

	@Override
	public int deleteListToCards(DataPacket receive) {
		return dao.deleteListToCards(session, receive);
	}

	@Override
	public int updateList(DataPacket receive) {
		return dao.updateList(session, receive);
	}

	@Override
	public int moveList(DataPacket receive) {
		return dao.moveList(session, receive);
	}

	@Override
	public int insertCollaboMember(Map<String, Object> temp) {
		return dao.insertCollaboMember(session, temp);
	}

	@Override
	public int searchListPlaceNo(DataPacket receive) {
		return dao.searchListPlaceNo(session, receive);
	}

	@Override
	public List<Map<String, String>> selectCollaboMemberList(String userId) {
		return dao.selectCollaboMemberList(session, userId);
	}

	@Override
	public int createCollaboTool(Map<String, Object> temp) {
		return dao.createCollaboTool(session, temp);
	}
}
