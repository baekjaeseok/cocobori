package com.smhrd.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.CocoMemberDAO;

public class MemberDeleteService extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_email = request.getParameter("user_email");
		System.out.println(user_email);
		CocoMemberDAO dao = new CocoMemberDAO();
		int cnt = dao.deleteMember(user_email);
		System.out.println(cnt);

		if (cnt > 0) {
			System.out.println("회원탈퇴 성공");
			HttpSession session = request.getSession();
			session.invalidate();
			response.setContentType("text/html; charset=UTF-8");
			/*
			 * PrintWriter out = response.getWriter();
			 * 
			 * out.println("<script>alert('회원탈퇴 성공'); location.href='main.jsp';</script>");
			 * 
			 * out.close();
			 */
			    

			response.sendRedirect("main.jsp");
		} else {
			System.out.println("회원탈퇴 실패");
			response.sendRedirect("my_page.jsp");
		}
	}
}


