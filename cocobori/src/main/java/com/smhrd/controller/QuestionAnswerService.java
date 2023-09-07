package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.command.Command;
import com.smhrd.model.CocoQuestionDAO;
import com.smhrd.model.CocoQuestionDTO;

public class QuestionAnswerService implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		
		String num = request.getParameter("num");
		String answer = request.getParameter("answer");
		
			CocoQuestionDTO question = new CocoQuestionDTO(num, null, null, null, null, null, null, answer);
			CocoQuestionDAO dao = new CocoQuestionDAO();
			cnt = dao.questionUpdate(question);
		
		if(cnt > 0) {
			System.out.println("답변 성공");
		} else {
			System.out.println("답변 실패");
		}
		
		return "main.jsp";
		
	}
	
	
}
