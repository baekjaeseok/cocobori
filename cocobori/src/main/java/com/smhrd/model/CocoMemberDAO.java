package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class CocoMemberDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	// 회원가입 기능
	public int insertMember(CocoMemberDTO dto) {
		int cnt = 0;
		cnt = sqlSession.insert("com.smhrd.database.CocoMemberMapper.insertMember", dto);
		sqlSession.close();
		return cnt;
	}

	// 로그인 기능
	public CocoMemberDTO selectMember(CocoMemberDTO dto) {
		CocoMemberDTO member = null;
		member = sqlSession.selectOne("com.smhrd.database.CocoMemberMapper.selectMember", dto);
		System.out.println(member);
		sqlSession.close();
		return member;
	}

	// 회원정보수정 기능
	public int updateMember(CocoMemberDTO dto) {
		int cnt = 0;
		cnt = sqlSession.update("com.smhrd.database.CocoMemberMapper.updateMember", dto);
		sqlSession.close();
		return cnt;
	}

	// 전체회원정보 조회
	public List<CocoMemberDTO> selectAllMember() {
		List<CocoMemberDTO> list = sqlSession.selectList("com.smhrd.database.CocoMemberMapper.selectAllMember");

		sqlSession.close();

		return list;
	}

	// 회원탈퇴
	public int deleteMember(String user_email) {
		int cnt = 0;

		cnt = sqlSession.delete("com.smhrd.database.CocoMemberMapper.deleteMember", user_email);

		sqlSession.close();

		return cnt;
	}
	
	// 유저 검색
	public List<CocoMemberDTO> searchMember(CocoFriendDTO dto) {		
		List<CocoMemberDTO> searchMember = sqlSession.selectList("com.smhrd.database.CocoMemberMapper.searchMember", dto);
		
		sqlSession.close();
		
		return searchMember;
	}
	
}
