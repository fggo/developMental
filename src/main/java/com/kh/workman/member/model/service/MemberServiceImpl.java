package com.kh.workman.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.workman.member.model.dao.MemberDao;
import com.kh.workman.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao dao;
	
	@Autowired
	SqlSessionTemplate session;
	
	
	@Override
	public Member selectLogin(Member m) {
		return dao.selectLogin(session, m);
	}
	
	@Override
	public int insertMember(Member m) {
		
		return dao.insertMember(session, m);
	}
	
	@Override
	public Member selectFindEmail(String toemail) {
		// TODO Auto-generated method stub
		return dao.selectFindEmail(session, toemail);
	}
	
	@Override
	public int updateMember(Member m)
	{
		return dao.updateMember(session, m);
	}
	
	@Override
	public int updateInfoMember(Member m) {
		
		return dao.updateInfoMember(session, m);
	}
	
	

}
