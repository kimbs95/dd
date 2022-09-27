package com.dd.dealing.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dd.dealing.dao.DealingDAO;
import com.dd.dealing.vo.BoardVO;
import com.dd.dealing.vo.DealingVO;
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

//	회원가입 아이디 중복체크
	@Override
	public int idcheck(String user_Id) throws DataAccessException {

		int result = dealingDAO.idcheck(user_Id);
		return result;
	}

//	로그인확인
	@Override
	public MemberVO login(MemberVO memberVO) throws Exception {
		return dealingDAO.loginById(memberVO);
	}

	// 매물등록
	@Override
	public int addNewdealing(Map dealingMap) throws DataAccessException {
		return dealingDAO.addNewdealing(dealingMap);
	}

//	매물 전부 리스트 검색
	public List<DealingVO> allListdealing() throws DataAccessException {
		List<DealingVO> allListdealing = dealingDAO.allListdealing();
		return allListdealing;
	}

	// 지도 검색
	@Override
	public List<DealingVO> selectMap() throws DataAccessException {
		List<DealingVO> dlMap = dealingDAO.selectMap();
		return dlMap;
	}

	// 인테리어 게시글추가
	@Override
	public int addinteboard(BoardVO board) throws DataAccessException {
		return dealingDAO.insertboard(board);
	}

//	인테리어 목록보기
	public List<BoardVO> listArticles() throws Exception {
		List<BoardVO> articlesList = null;
		articlesList = dealingDAO.selectAllArticlesList();
		return articlesList;
	}

//	신고하기
	@Override
	public int addReport(Map rpMap) throws DataAccessException {
		return dealingDAO.insertReport(rpMap);
	}
}
