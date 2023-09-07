package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.CocoMemberDAO;
import com.smhrd.model.CocoMemberDTO;

public class UpdateService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String path = request.getServletContext().getRealPath("/upload");

		System.out.println("저장 경로 : " + path);

		int maxSize = 1024 * 1024 * 10; // 10MB

		String encoding = "UTF-8";

		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();

		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(request, path, maxSize, encoding, rename);
		} catch (IOException e) {
			System.out.println("글쓰기 값 읽기 실패");

			e.printStackTrace();
		}

		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		CocoMemberDTO member = (CocoMemberDTO) session.getAttribute("loginMember");

		String user_email = member.getUser_email();
		String user_pw = multi.getParameter("user_pw");
		String user_nick = multi.getParameter("user_nick");
		String user_phone = multi.getParameter("user_phone");
		String user_file = multi.getFilesystemName("user_file");

		CocoMemberDTO dto = new CocoMemberDTO(user_email, user_pw, user_nick, user_phone, user_file);
		System.out.println(dto);
		CocoMemberDAO dao = new CocoMemberDAO();

		int cnt = dao.updateMember(dto);

		if (cnt > 0) {
			System.out.println("회원정보수정 성공!");
			session.setAttribute("loginMember", dto);
			response.sendRedirect("main.jsp");
		} else {
			System.out.println("회원정보수정 실패...");
			response.sendRedirect("my_page.jsp");
		}

	}
	

}
