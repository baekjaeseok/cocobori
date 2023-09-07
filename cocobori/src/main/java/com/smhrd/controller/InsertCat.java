package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.CocoPetDAO;
import com.smhrd.model.CocoPetDTO;

public class InsertCat extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = request.getServletContext().getRealPath("./pet_file");
		System.out.println("저장경로 path >> " + path);

		int maxSize = 1024 * 1024 * 10; // 10mb

		String encoding = "UTF-8";

		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();

		try {
			MultipartRequest multi = new MultipartRequest(request, path, maxSize, encoding, rename);
			String pet_type = multi.getParameter("pet_type");
			String pet_breed = multi.getParameter("pet_breed");
			String pet_pic = multi.getFilesystemName("pet_pic");
			String pet_affno = multi.getParameter("pet_affno");
			String pet_aff = multi.getParameter("pet_aff");
			String pet_actno = multi.getParameter("pet_actno");
			String pet_act = multi.getParameter("pet_act");
			String pet_healthno = multi.getParameter("pet_healthno");
			String pet_health = multi.getParameter("pet_health");
			String pet_groomno = multi.getParameter("pet_groomno");
			String pet_groom = multi.getParameter("pet_groom");
			

			CocoPetDTO dto = new CocoPetDTO(pet_type, pet_breed, pet_pic, pet_affno, pet_aff, pet_actno, pet_act, pet_healthno, pet_health, pet_groomno, pet_groom);
			System.out.println(dto);

			System.out.println(path + "'\'" + dto.getPet_pic());

			CocoPetDAO dao = new CocoPetDAO();

			int cnt = dao.insertCat(dto);

			if (cnt > 0) {
				System.out.println("동물백과 등록 성공");
				/*
				 * HttpSession session = request.getSession(); session.setAttribute("pet_breed",
				 * pet_breed);
				 */
				response.sendRedirect("InsertCat.jsp");
			} else {
				System.out.println("동물백과 등록 실패");
				response.sendRedirect("InsertCat.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

