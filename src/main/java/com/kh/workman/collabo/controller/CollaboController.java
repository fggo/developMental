package com.kh.workman.collabo.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.workman.collabo.model.service.CollaboService;

@Controller
public class CollaboController {

	private Logger logger = LoggerFactory.getLogger(CollaboController.class);

	@Autowired
	CollaboService service;

	@RequestMapping("/collabo/main.do")
	public ModelAndView connectCollaboMain(ModelAndView mv) {
		mv.setViewName("collabo/main");
		return mv;
	}

	@RequestMapping("/collabo/detail.do")
	public String connectCollaboDetail() {
		return "/collabo/detail";
	}

	public int createList(HashMap receiveData) {
		System.out.println(receiveData);
		return service.createList(receiveData);
	}

//	@Override
//	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
//		// TODO Auto-generated method stub
//		// super.handleMessage(session, message);
//		String sMessage = message.getPayload().toString();
//		Gson gson = new GsonBuilder().create();
//		// receiveMessage rm = gson.fromJson(sMessage, receiveMessage.class);
//		HashMap receiveMessage = gson.fromJson(sMessage, HashMap.class); // 두번제 인자값에 클래스넣어주면 알아서 해주는친구
//		logger.debug(receiveMessage.toString());
//
//		int result = service.createList(receiveMessage); // <<<그런듯...
//	}
//
//	@Override
//	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
//		// TODO Auto-generated method stub
//		// super.afterConnectionClosed(session, status);
//		sessionList.remove(session);
//	}
//
//	@Override
//	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//		// TODO Auto-generated method stub
//		// super.afterConnectionEstablished(session);
//		sessionList.add(session);
//	}

}
