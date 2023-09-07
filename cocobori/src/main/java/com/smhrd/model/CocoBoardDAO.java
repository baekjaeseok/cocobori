package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class CocoBoardDAO {
	//db연결
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	//게시글 업로드
	public int boardUpload(CocoBoardDTO dto) {
		
		int cnt = sqlSession.insert("com.smhrd.database.CocoBoardMapper.boardUpload", dto);
		
		sqlSession.close();
		
		return cnt;
	}
	
	
	
	//게시글 조회
	public List<CocoBoardDTO> showBoard() {
		
		List<CocoBoardDTO> board_list = sqlSession.selectList("com.smhrd.database.CocoBoardMapper.showBoard");
		
		sqlSession.close();
		
		return board_list;
	}
	
	//세부 게시글 조회
		public List<CocoBoardDTO> detail_showBoard(int b_seq) {
			
			List<CocoBoardDTO> d_board_list = sqlSession.selectList("com.smhrd.database.CocoBoardMapper.detail_showBoard",b_seq);
			
			sqlSession.close();
			
			return d_board_list;
		}
		
	// 게시글 수정
		public int modifyBoard(CocoBoardDTO dto){
			
			int cnt = sqlSession.update("com.smhrd.database.CocoBoardMapper.boardModify", dto);
			
			sqlSession.close();
			
			return cnt ;
		}
		
	// 게시글 삭제
		public int deleteBoard(int b_seq) {
			int cnt = 0;
			
			cnt = sqlSession.delete("com.smhrd.database.CocoBoardMapper.boardDelete",b_seq);
			
			sqlSession.close();
			
			return cnt;
		}
		
	// 내용 검색
		public List<CocoBoardDTO> searchcontent(String b_content) {
			
			List<CocoBoardDTO> searchContent = sqlSession.selectList("com.smhrd.database.CocoBoardMapper.searchContent", b_content);
			
			sqlSession.close();
			
			return searchContent;
		}
		
	// 글쓴이 검색	
		public List<CocoBoardDTO> searchwriter(String user_email) {
			
			List<CocoBoardDTO> searchWriter = sqlSession.selectList("com.smhrd.database.CocoBoardMapper.searchWriter", user_email);
			
			sqlSession.close();
			
			return searchWriter;
		}
}





