package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.CocoChattingDAO;
import com.smhrd.model.CocoChattingDTO;

public class ChatService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String me = (String)session.getAttribute("me");
		String FRIEND_EMAIL = (String)session.getAttribute("friend_email");
		String talker = me;
		String talking = request.getParameter("talking");
		
		Double FriendCode = new CocoChattingDAO().ChatCode(FRIEND_EMAIL); 
			
		CocoChattingDTO dto = new CocoChattingDTO(FriendCode, talker, talking); // 채팅방 번호는 친구 테이블에서 가져온다.
		CocoChattingDAO dao = new CocoChattingDAO();
		int cnt = dao.SaveChat(dto);
		
		if(cnt > 0) {
			response.sendRedirect("chat.jsp");
		} else {
			response.sendRedirect("chat.jsp");
		}
		
	}

}