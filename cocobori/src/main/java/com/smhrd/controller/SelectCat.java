package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.CocoPetDAO;
import com.smhrd.model.CocoPetDTO;

public class SelectCat extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getServletContext().getRealPath("./pet_file");
		System.out.println("저장경로 path >> " + path);

		int maxSize = 1024 * 1024 * 10; // 10mb

		String encoding = "UTF-8";

		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		
		try {
			MultipartRequest multi = new MultipartRequest(request, path, maxSize, encoding, rename);
			String pet_breed = multi.getParameter("pet_breed");
			
			CocoPetDTO dto = new CocoPetDTO(pet_breed);
			System.out.println(dto);
			
			CocoPetDAO dao = new CocoPetDAO();
			CocoPetDTO pet = dao.selectCat(dto);
			
			if (pet != null) {
				System.out.println("동물백과 조회 성공");
				HttpSession session = request.getSession();
				session.setAttribute("pet", pet);
				response.sendRedirect("dic_cat.jsp");
			} else {
				System.out.println("동물백과 조회 실패");
				response.sendRedirect("dic_cat.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
