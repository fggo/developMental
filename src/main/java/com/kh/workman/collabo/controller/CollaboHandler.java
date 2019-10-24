package com.kh.workman.collabo.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.workman.collabo.model.service.CollaboService;
import com.kh.workman.collabo.model.vo.CollaboList;
import com.kh.workman.collabo.model.vo.DataPacket;

public class CollaboHandler extends TextWebSocketHandler {
	private static Map<String, WebSocketSession> sessionList = new HashMap<String, WebSocketSession>();
	private static Map<String, Integer> collaboList = new HashMap<String, Integer>();
	private Logger logger = LoggerFactory.getLogger(CollaboHandler.class);

	@Autowired
	CollaboService service;

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		DataPacket receive = parsingJson(message.getPayload());
		System.out.println(receive);
//		ObjectMapper om = new ObjectMapper();
//		Map<String, Object> temp = om.readValue(message.getPayload(), Map.class);
//		System.out.println(temp);
		switch (receive.getType()) {
		case "connect":
			sessionList.put(receive.getUserId(), session);
			collaboList.put(receive.getUserId(), receive.getCollaboNo());
			logger.debug(receive.getUserId() + " 님이 " + collaboList.get(receive.getUserId())
					+ "번 방에 접속하셨습니다. SESSION ID = {}", sessionList.get(receive.getUserId()).getId());
			break;
		case "list":
			switch (receive.getMethod()) {
			case "create":
				createList(receive, session);
				break;
			case "update":
				break;
			case "delete":
				break;
			}
			break;
		case "card":
			switch (receive.getMethod()) {
			case "create":
				break;
			case "update":
				break;
			case "delete":
				break;
			}
			break;
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		logger.debug("{} 연결종료", session.getId());
	}

	public boolean createList(DataPacket receive, WebSocketSession session) throws IOException {
		boolean isCompleted = service.createList(receive) == 1 ? true : false;
		System.out.println(receive);
		List<HashMap> collabos = service.participation(receive.getCollaboNo());
		System.out.println(collabos);
		CollaboList tempCollaboList = service.selectCollaboListOne(receive.getListNo() - 1);
		System.out.println(tempCollaboList);
		
		if (isCompleted) {
			for (String key : sessionList.keySet()) {
				for (int i = 0; i < collabos.size(); i++) {
					if (key.equals(collabos.get(i).get("ID"))) {
						sessionList.get(key).sendMessage(new TextMessage(toJson(receive)));
						break;
					}
				}
			}
		}

		return isCompleted;
	}

	public DataPacket parsingJson(String receiveMessage) {
		Gson gson = new GsonBuilder().create();
		DataPacket temp = gson.fromJson(receiveMessage, DataPacket.class);
		return temp;
	}

	public String toJson(Object obj) {
		Gson gson = new GsonBuilder().create();
		return gson.toJson(obj);
	}

}
