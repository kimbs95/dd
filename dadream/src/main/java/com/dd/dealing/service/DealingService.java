package com.dd.dealing.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.dd.dealing.vo.BoardVO;
import com.dd.dealing.vo.MemberVO;

public interface DealingService {

	// 회원가입
	public int addMember(MemberVO member) throws DataAccessException;

//	회원가입 아이디 중복체크
	public int idcheck(String user_Id) throws DataAccessException;

//	로그인체크
	public MemberVO login(MemberVO memberVO) throws Exception;

	// 매물등록
	public int addNewdealing(Map dealingMap) throws DataAccessException;

	// 인테리어 게시글추가
	public int addinteboard(BoardVO board) throws DataAccessException;

//	인테리어 목록보기
	public List<BoardVO> listArticles() throws Exception;

//	신고하기
	public int addReport(Map rpMap) throws DataAccessException;
}
