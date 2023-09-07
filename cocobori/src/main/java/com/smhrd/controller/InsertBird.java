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

public class InsertBird extends HttpServlet {
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
			String pet_temp = multi.getParameter("pet_temp");
			String pet_eat = multi.getParameter("pet_eat");
			String pet_cage = multi.getParameter("pet_cage");
			String pet_health = multi.getParameter("pet_health");
			String pet_adapt = multi.getParameter("pet_adapt");
			String pet_etc = multi.getParameter("pet_etc");
			
			CocoPetDTO dto = new CocoPetDTO(pet_type, pet_breed, pet_pic, pet_temp, pet_eat, pet_cage, pet_health, pet_adapt, pet_etc);
			System.out.println(dto);

			System.out.println(path + "'\'" + dto.getPet_pic());

			CocoPetDAO dao = new CocoPetDAO();

			int cnt = dao.insertBird(dto);
			System.out.println(cnt);
			if (cnt > 0) {
				System.out.println("동물백과 등록 성공");
				response.sendRedirect("InsertBird.jsp");
			} else {
				System.out.println("동물백과 등록 실패");
				response.sendRedirect("InsertBird.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
