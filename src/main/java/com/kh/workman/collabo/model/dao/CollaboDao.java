package com.kh.workman.collabo.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.workman.collabo.model.vo.CollaboCard;
import com.kh.workman.collabo.model.vo.CollaboList;
import com.kh.workman.collabo.model.vo.DataPacket;
import com.kh.workman.member.model.vo.Member;

public interface CollaboDao {

	int createList(SqlSessionTemplate session, DataPacket receive);

	CollaboList selectCollaboListOne(SqlSessionTemplate session, int target);

	List<HashMap> participation(SqlSessionTemplate session, int collaboNo);

	int createCard(SqlSessionTemplate session, DataPacket receive);

	List<CollaboList> selectCollaboLists(SqlSessionTemplate session, int collaboNo);

	List<CollaboCard> selectCollaboCards(SqlSessionTemplate session, int collaboNo);

	int moveCard(SqlSessionTemplate session, DataPacket receive);

	List<Member> selectCollaboMembers(SqlSessionTemplate session, int collaboNo);

	int updateCard(SqlSessionTemplate session, DataPacket receive);

	int deleteCard(SqlSessionTemplate session, DataPacket receive);

	int deleteList(SqlSessionTemplate session, DataPacket receive);

	int deleteListToCards(SqlSessionTemplate session, DataPacket receive);

	int updateList(SqlSessionTemplate session, DataPacket receive);

}
