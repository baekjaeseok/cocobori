package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class CocoFriendDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	// 친구 목록
	public List<CocoFriendDTO> showAllFriends(String user_email) {
		List<CocoFriendDTO> friendList = null;
				
		friendList = sqlSession.selectList("com.smhrd.database.CocoFriendMapper.showAllFriends", user_email);

		sqlSession.close();
		
		return friendList;
	}
	
	// 친구 검색
	public List<CocoFriendDTO> searchFriend(CocoFriendDTO dto) {
		List<CocoFriendDTO> searchResult = null;
		
		searchResult = sqlSession.selectList("com.smhrd.database.CocoFriendMapper.searchFriend", dto);
		
		return searchResult;
	}
	
	// 친구 정보
	public List<CocoMemberDTO> friendInfo(String user_email) {
		List<CocoMemberDTO> friendInfo = null;
				
		friendInfo = sqlSession.selectList("com.smhrd.database.CocoFriendMapper.friendInfo", user_email);
		
		return friendInfo;
	}
	
	// 친구 활동 내력
	public List<CocoBoardDTO> friendHistory(String user_email) {
		List<CocoBoardDTO> friendHistory = null;
		
		friendHistory = sqlSession.selectList("com.smhrd.database.CocoFriendMapper.friendHistory", user_email);
		
		sqlSession.close();
		
		return friendHistory;
	}
	
	// 친구 추가
	public int insertFriend(CocoFriendDTO dto) {
		int insertResult = 0;
		
		insertResult = sqlSession.insert("com.smhrd.database.CocoFriendMapper.insertFriend", dto);

		return insertResult;
	}
	
	// 친구 삭제
	public int deleteFriend(CocoFriendDTO dto) {
		int deleteResult = 0;
		
		deleteResult = sqlSession.delete("com.smhrd.database.CocoFriendMapper.deleteFriend", dto);
		
		sqlSession.close();
		
		return deleteResult;
	}
	
	// 친구 번호 수정
	public int updateFriend(CocoFriendDTO dto) {
		int updateResult = 0;
		
		updateResult = sqlSession.update("com.smhrd.database.CocoFriendMapper.updateFriend", dto);
		
		sqlSession.close();
		
		return updateResult;
	}
	
}
