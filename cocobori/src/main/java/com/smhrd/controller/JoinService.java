package com.smhrd.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.CocoMemberDAO;
import com.smhrd.model.CocoMemberDTO;


public class JoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// MultipartRequest
		// 파일 업로드 cos.jar에 포함 되어있음

		// 1. 모든 정보가 담겨있는 request 객체
		// 2. 데이터를 저장할 경로
		String path = request.getServletContext().getRealPath("/upload");
		// 경로 확인
		System.out.println("저장 경로 : " + path);

		// 3. 데이터의 최대 크기
		int maxSize = 1024 * 1024 * 10; // 10MB

		// 4. 인코딩 방식
		String encoding = "UTF-8";

		// 5. 중복 제거 (파일명 뒤에 숫자 부여)
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		
		Date now = new Date();

		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(request, path, maxSize, encoding, rename);
			String user_email = multi.getParameter("user_email");
			String user_pw = multi.getParameter("user_pw");
			String user_name = multi.getParameter("user_name");
			String user_nick = multi.getParameter("user_nick");
			String user_phone = multi.getParameter("user_phone");
			Date user_joindate = now;
			String admin_yn = "N";
			String user_file = multi.getFilesystemName("user_file");
			
			CocoMemberDTO dto = new CocoMemberDTO(user_email, user_pw, user_name, user_nick, user_phone, user_joindate, admin_yn, user_file);
			System.out.println("dto :" + dto);
			CocoMemberDAO dao = new CocoMemberDAO();
			
			int cnt = dao.insertMember(dto);
			System.out.println(cnt);
			if(cnt != 0) {
				System.out.println("회원가입 성공");
				HttpSession session = request.getSession();
				session.setAttribute("loginMember", dto);
				response.sendRedirect("login.jsp");
			}else {
				System.out.println("회원가입 실패");
				response.sendRedirect("login.jsp");		
			}
			
		} catch (IOException e) {
			System.out.println("글쓰기 값 읽기 실패");
			e.printStackTrace();
		}
	}
}

		
		



