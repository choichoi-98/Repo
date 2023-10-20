package com.hta.movieplus.handler;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;



@Component  //SocketHandler 빈 등록
public class SocketHandler extends TextWebSocketHandler{

	private static final Logger logger = LoggerFactory.getLogger(SocketHandler.class);
	
	
	HashMap<String, WebSocketSession> sessionMap = new HashMap<>(); //웹소켓 세션을 담아둘 맵
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) {
		//메시지 발송 - 메시지 수신 시 실행
		
		String msg = message.getPayload();
		for(String key : sessionMap.keySet()) {
			WebSocketSession wss = sessionMap.get(key);
			try {
				wss.sendMessage(new TextMessage(msg));
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//소켓 연결 - 웹소켓 연결 시 동작
		logger.info("afterConnectionEstablished");
		super.afterConnectionEstablished(session);
		logger.info("afterConnection의 session" + session);
		sessionMap.put(session.getId(), session);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//소켓 종료 - 웹소켓 종료 시 동작
		sessionMap.remove(session.getId());
		super.afterConnectionClosed(session, status);
	}

}
