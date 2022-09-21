package com.dd.dealing.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dd.dealing.dao.DealingDAO;
import com.dd.dealing.vo.MemberVO;

@Service("dealingService")
@Transactional(propagation = Propagation.REQUIRED)
public class DealingServiceImpl implements DealingService {
	@Autowired
	private DealingDAO dealingDAO;

//	회원가입
	@Override
	public int addMember(MemberVO member) throws DataAccessException {
		return dealingDAO.insertMember(member);
	}

//	로그인확인
	@Override
	public MemberVO login(MemberVO memberVO) throws Exception {
		return dealingDAO.loginById(memberVO);
	}
}
