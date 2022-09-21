package com.dd.dealing.service;

import org.springframework.dao.DataAccessException;

import com.dd.dealing.vo.MemberVO;

public interface DealingService {

	// 회원가입
	public int addMember(MemberVO member) throws DataAccessException;

//	로그인체크
	public MemberVO login(MemberVO memberVO) throws Exception;
}
