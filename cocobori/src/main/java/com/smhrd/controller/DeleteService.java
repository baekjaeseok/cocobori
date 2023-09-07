package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.CocoMemberDAO;


public class DeleteService extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_email = request.getParameter("user_email");
		System.out.println(user_email);
		CocoMemberDAO dao = new CocoMemberDAO();
		int cnt = dao.deleteMember(user_email);
		System.out.println(cnt);

		if (cnt > 0) {
			System.out.println("회원삭제 성공");
			response.sendRedirect("admin_member.jsp");
		} else {
			System.out.println("회원삭제 실패");
			response.sendRedirect("admin_member.jsp");
		}
	}
	}


