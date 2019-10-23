package com.kh.workman.collabo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.workman.collabo.model.service.CollaboService;
import com.kh.workman.collabo.model.service.CollaboServiceImpl;

public class CollaboHandler extends TextWebSocketHandler {
	private static List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private Logger logger = LoggerFactory.getLogger(CollaboHandler.class);

	@Autowired
	CollaboService service;

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// Connection Client for Server
//		Map<String, Object> sessionItem = session.getAttributes();
//		System.out.println(sessionItem.get("collaboNo"));
//		System.out.println(sessionItem.get("userId")); 어디가 안됨 
		sessionList.add(session);
		logger.debug("{} Connection Clinet ", session.getId());
	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		// Data Communication
		String sMessage = message.getPayload().toString();
		Gson gson = new GsonBuilder().create();
//		receiveMessage rm = gson.fromJson(sMessage, receiveMessage.class);
		HashMap receiveMessage = gson.fromJson(sMessage, HashMap.class); // 두번제 인자값에 클래스넣어주면 알아서 해주는친구
		logger.debug(receiveMessage.toString());

		int result = service.createList(receiveMessage); // <<<그런듯...
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		logger.debug("{} 연결종료", session.getId());
	}

}
