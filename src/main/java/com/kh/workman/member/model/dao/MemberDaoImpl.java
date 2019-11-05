package com.kh.workman.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.workman.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public Member selectLogin(SqlSessionTemplate session, Member m) {
		
		return session.selectOne("member.selectLogin", m);
	}
	
	@Override
	public int insertMember(SqlSessionTemplate session, Member m) {
		
		return session.insert("member.insertMember", m);
	}
	
	@Override
	public Member selectFindEmail(SqlSessionTemplate session, String toemail) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectFindEmail", toemail);
	}
	
	@Override
	public int updateMember(SqlSessionTemplate session, Member m) {
		// TODO Auto-generated method stub
		return session.update("member.updateMemberEmail", m);
	}
	
	@Override
	public int updateInfoMember(SqlSessionTemplate session, Member m) {
		// TODO Auto-generated method stub
		return session.update("member.updateInfoMember", m);
	}

}
