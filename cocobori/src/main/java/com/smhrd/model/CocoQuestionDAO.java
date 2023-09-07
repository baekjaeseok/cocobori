package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class CocoQuestionDAO {
	SqlSessionFactory sqlSessionFactory =  SqlSessionManager.getSqlSession();
	SqlSession sqlSession =  sqlSessionFactory.openSession(true);
	
	public int questionUpload(CocoQuestionDTO dto) {
		int cnt = 0;
		
		cnt = sqlSession.insert("com.smhrd.database.CocoQuestionMapper.questionUpload", dto);
		
		sqlSession.close();
		
		return cnt;
	}
	
	public List<CocoQuestionDTO> showQuestion() {

		List<CocoQuestionDTO> qustionList = sqlSession.selectList("com.smhrd.database.CocoQuestionMapper.questionList");
		
		sqlSession.close();
		
		return qustionList;
	}
	
	public List<CocoQuestionDTO> showQuestionDetail(String num) {

		List<CocoQuestionDTO> qustionDetail = sqlSession.selectList("com.smhrd.database.CocoQuestionMapper.questionDetail", num);
		
		sqlSession.close();
		
		return qustionDetail;
	}
	
	public List<CocoQuestionDTO> showMyQuestion(String writer) {

		List<CocoQuestionDTO> qustionList = sqlSession.selectList("com.smhrd.database.CocoQuestionMapper.myQuestion", writer);
		
		sqlSession.close();
		
		return qustionList;
	}
	
	public int questionUpdate(CocoQuestionDTO dto) {
		int cnt = 0;
		
		cnt = sqlSession.update("com.smhrd.database.CocoQuestionMapper.QuestionAnswer", dto);
		
		sqlSession.close();
		
		return cnt;
	}
}