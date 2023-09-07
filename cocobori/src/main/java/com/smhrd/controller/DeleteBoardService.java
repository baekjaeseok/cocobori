package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.CocoBoardDAO;

public class DeleteBoardService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//게시물 삭제

		int b_seq = Integer.parseInt(request.getParameter("num"));
		
		CocoBoardDAO dao = new CocoBoardDAO();
		int cnt = dao.deleteBoard(b_seq);
		
		if (cnt>0) {
			System.out.println("게시물 삭제 성공");
		}else {
			System.out.println("게시물 삭제 실패");
		}
		response.sendRedirect("board.jsp");
		
	}

}
