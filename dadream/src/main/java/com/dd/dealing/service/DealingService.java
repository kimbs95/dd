package com.dd.dealing.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.dd.dealing.vo.BoardVO;
import com.dd.dealing.vo.MemberVO;

public interface DealingService {

	// 회원가입
	public int addMember(MemberVO member) throws DataAccessException;

//	로그인체크
	public MemberVO login(MemberVO memberVO) throws Exception;

	// 매물등록
	public int addNewdealing(Map dealingMap) throws DataAccessException;

	// 인테리어 게시글추가
	public int addinteboard(BoardVO board) throws DataAccessException;

//	신고하기
	public int addReport(Map rpMap) throws DataAccessException;
}
