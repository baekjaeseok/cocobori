package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.CocoMemberDAO;
import com.smhrd.model.CocoMemberDTO;


public class LoginService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String user_email = request.getParameter("user_email");
		String user_pw = request.getParameter("user_pw");
		System.out.println(user_email);
		System.out.println(user_pw);

		CocoMemberDTO member = new CocoMemberDTO(user_email, user_pw);
		
		CocoMemberDAO dao = new CocoMemberDAO();
		CocoMemberDTO loginMember = dao.selectMember(member);
		System.out.println(loginMember);

		// 2-1. 회원이 존재할 경우, 세션영역에 저장하고 index.html로 이동
		if (loginMember != null) {
			System.out.println("로그인 성공!");
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", loginMember);
			response.sendRedirect("main.jsp");
			
		} else {
			System.out.println("로그인실패...");
			response.sendRedirect("login.jsp");
		}
	}

}
