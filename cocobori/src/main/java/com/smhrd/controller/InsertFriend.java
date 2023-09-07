package com.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.command.Command;
import com.smhrd.database.SqlSessionManager;
import com.smhrd.model.CocoChattingDAO;
import com.smhrd.model.CocoFriendDAO;
import com.smhrd.model.CocoFriendDTO;
import com.smhrd.model.CocoMemberDTO;

public class InsertFriend implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		CocoMemberDTO member = (CocoMemberDTO)session.getAttribute("loginMember");
		
		String user_email = member.getUser_email();
		String friend_email = request.getParameter("friend_email");
		
		CocoFriendDTO fDto = new CocoFriendDTO(null, user_email, friend_email, null);
		CocoFriendDAO fDao = new CocoFriendDAO();
		
		fDao.insertFriend(fDto);
		
		CocoFriendDTO searchDto = new CocoFriendDTO(null, friend_email, user_email, null);
		List<CocoFriendDTO> searchResult = fDao.searchFriend(searchDto);
		
		if (!searchResult.isEmpty()) { //
			System.out.println("친구 찾기 결과 : " + searchResult);
			
			Double friend_seq = new CocoChattingDAO().ChatCode(user_email); //
			System.out.println("친구 번호 : " + friend_seq);
			
			CocoFriendDTO updateDto = new CocoFriendDTO(friend_seq, user_email, friend_email, null);
			
			int cnt = fDao.updateFriend(updateDto);
			
			if (cnt > 0) {
				System.out.println("수정 성공");
			} else {
				System.out.println("수정 실패"); 
			}
		
		} else {
			SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
			
			sqlSession.close();
		}
		
		return "friend.jsp";
	}

}
