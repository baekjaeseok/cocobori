package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class CocoPetDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	// 강아지 동물백과 등록
	public int insertDog(CocoPetDTO dto) {
		int cnt = 0;
		cnt = sqlSession.insert("com.smhrd.database.CocoPetMapper.insertDog", dto);
		sqlSession.close();
		return cnt;
	}
	
	// 고양이 동물백과 등록
	public int insertCat(CocoPetDTO dto) {
		int cnt = 0;
		cnt = sqlSession.insert("com.smhrd.database.CocoPetMapper.insertCat", dto);
		sqlSession.close();
		return cnt;
	}
	
	// 파충류 동물백과 등록
	public int insertRep(CocoPetDTO dto) {
		int cnt = 0;
		cnt = sqlSession.insert("com.smhrd.database.CocoPetMapper.insertRep", dto);
		sqlSession.close();
		return cnt;
	}
	
	public int insertBird(CocoPetDTO dto) {
		int cnt = 0;
		cnt = sqlSession.insert("com.smhrd.database.CocoPetMapper.insertBird", dto);
		sqlSession.close();
		return cnt;
	}
	
	
	public CocoPetDTO selectDog(CocoPetDTO dto) {
		CocoPetDTO pet = null;
		pet = sqlSession.selectOne("com.smhrd.database.CocoPetMapper.selectDog", dto);
		// System.out.println("pet >> " + pet);
		sqlSession.close();
		return pet;
	}
	
	public CocoPetDTO selectCat(CocoPetDTO dto) {
		CocoPetDTO pet = null;
		pet = sqlSession.selectOne("com.smhrd.database.CocoPetMapper.selectCat", dto);
		// System.out.println("pet >> " + pet);
		sqlSession.close();
		return pet;
	}
	
	public CocoPetDTO selectRep(CocoPetDTO dto) {
		CocoPetDTO pet = null;
		pet = sqlSession.selectOne("com.smhrd.database.CocoPetMapper.selectRep", dto);
		// System.out.println("pet >> " + pet);
		sqlSession.close();
		return pet;
	}
	
	public CocoPetDTO selectBird(CocoPetDTO dto) {
		CocoPetDTO pet = null;
		pet = sqlSession.selectOne("com.smhrd.database.CocoPetMapper.selectBird", dto);
		sqlSession.close();
		return pet;
	}
	
	// 고양이 백과사전 전체 목록 조회
	public List<CocoPetDTO> selAllCat() {
		List<CocoPetDTO> pet = null;
		pet = sqlSession.selectList("com.smhrd.database.CocoPetMapper.selAllCat");
		sqlSession.close();
		return pet;
	}
	
	// 고양이 백과사전 전체 목록 조회
	public List<CocoPetDTO> selAllDog() {
		List<CocoPetDTO> pet = null;
		pet = sqlSession.selectList("com.smhrd.database.CocoPetMapper.selAllDog");
		sqlSession.close();
		return pet;
	}
	
	// 파충류 백과사전 전체 목록 조회
	public List<CocoPetDTO> selAllRep() {
		List<CocoPetDTO> pet = null;
		pet = sqlSession.selectList("com.smhrd.database.CocoPetMapper.selAllRep");
		sqlSession.close();
		return pet;
	}
	
	// 조류 백과사전 전체 목록 조회
	public List<CocoPetDTO> selAllBird() {
		List<CocoPetDTO> pet = null;
		pet = sqlSession.selectList("com.smhrd.database.CocoPetMapper.selAllBird");
		sqlSession.close();
		return pet;
	}

}
