package com.kh.workman.collabo.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.workman.collabo.model.vo.CollaboCard;
import com.kh.workman.collabo.model.vo.CollaboList;
import com.kh.workman.collabo.model.vo.CollaboTool;
import com.kh.workman.collabo.model.vo.DataPacket;
import com.kh.workman.member.model.vo.Member;

public interface CollaboService {

	int createList(DataPacket receive);

	CollaboList selectCollaboListOne(int target);

	List<HashMap> participation(int collaboNo);

	int createCard(DataPacket receive);

	List<CollaboList> selectCollaboLists(int collaboNo);

	List<CollaboCard> selectCollaboCards(int collaboNo);

	int moveCard(DataPacket receive);

	List<Member> selectCollaboMembers(int collaboNo);

	int updateCard(DataPacket receive);

	int deleteCard(DataPacket receive);

	int deleteList(DataPacket receive);

	int deleteListToCards(DataPacket receive);

	int updateList(DataPacket receive);

	int moveList(DataPacket receive);

	int searchListPlaceNo(DataPacket receive);

	List<CollaboTool> selectCollaboTools(String userId);

	List<Map<String, String>> selectCollaboMemberList(String userId);

	int createCollaboTool(Map<String, Object> temp);

	int insertCollaboMember(Map<String, Object> temp);

}
