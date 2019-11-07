package com.kh.workman.member.model.service;

import java.util.List;

import com.kh.workman.member.model.vo.Member;

public interface MemberService {
	Member selectLogin(Member m);
	int insertMember(Member m);
	Member selectFindEmail(String toemail);
	int updateMember(Member m);
	int updateInfoMember(Member m);
	List<Member> selectAllMember();
	Member selectMemberNickname(Member m);
}
