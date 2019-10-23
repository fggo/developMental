package com.kh.workman.collabo.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;


public interface CollaboDao {

	int createList(SqlSessionTemplate session, HashMap receiveMessage);

}
