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
import com.dd.dealing.vo.NoticeVO;

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

	// 지도창에서 검색
	@Override
	public List<DealingVO> selectMap2(Map<String, Object> dlMap) throws DataAccessException {
		List<DealingVO> dlReqp = dealingDAO.selectMap2(dlMap);
		return dlReqp;
	}

	// 게시글추가
	@Override
	public int addinteboard(BoardVO board) throws DataAccessException {
		return dealingDAO.insertboard(board);
	}

	// 게시글 목록 조회
	@Override
	public List<BoardVO> listArticles() throws Exception {
		List<BoardVO> articlesList = null;
		articlesList = dealingDAO.selectAllArticlesList();
		return articlesList;
	}

	// 상세보기
	@Override
	public BoardVO getBoardContents(int inte_Num) throws Exception {
		return dealingDAO.getBoardContents(inte_Num);
	}

	// 인테리어 글 수정
	@Override
	public void updateBoard(BoardVO boardVO) throws Exception {
		dealingDAO.updateBoard(boardVO);
	}

	// 인테리어 글 삭제
	@Override
	public void removeArticle(int inte_Num) throws Exception {
		dealingDAO.deleteArticle(inte_Num);
	}

	// 인테리어 수정
	@Override
	public void modArticle(Map dealingMap) throws Exception {
		dealingDAO.updateArticle(dealingMap);
	}

	// 공지사항 게시판 목록 조회
	@Override
	public List<NoticeVO> listNoticles() throws Exception {
		List<NoticeVO> noticlesList = null;
		noticlesList = dealingDAO.selectAllNoticlesList();
		return noticlesList;
	}

	// 공지사항 글 등록
	@Override
	public void insertnotice(NoticeVO searchVO) throws Exception {
		dealingDAO.insertnotice(searchVO);
	}

	// 조회수 증가
	@Override
	public void updateView(int viewCounts) throws Exception {
		dealingDAO.updateView(viewCounts);
	}

//	신고하기
	@Override
	public int addReport(Map rpMap) throws DataAccessException {
		return dealingDAO.insertReport(rpMap);
	}

}
