package com.kh.workman.collabo.model.service;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.workman.collabo.model.dao.CollaboDao;
import com.kh.workman.collabo.model.dao.CollaboDaoImpl;

@Service
public class CollaboServiceImpl implements CollaboService {
	@Autowired
	CollaboDao dao;
	
//	CollaboDao dao = new CollaboDaoImpl();
	
	@Autowired
	SqlSessionTemplate session;
	


	@Override
	public int createList(HashMap receiveMessage) {
		System.out.println("asdf");
		return dao.createList(session,receiveMessage);
	}
}
