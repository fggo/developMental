package com.kh.workman.collabo.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CollaboDaoImpl implements CollaboDao {

	@Override
	public int createList(SqlSessionTemplate session, HashMap receiveMessage) {
		System.out.println("asdf");
		return session.insert("collabo.createList", receiveMessage);
	}

}
