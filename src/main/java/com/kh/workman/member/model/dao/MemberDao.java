package com.kh.workman.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.workman.member.model.vo.Member;

public interface MemberDao {
	
	Member selectLogin(SqlSessionTemplate session, Member m);
	int insertMember(SqlSessionTemplate session, Member m);
}