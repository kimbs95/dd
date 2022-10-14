package com.dd.dealing.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dd.dealing.dao.DealingDAO;
import com.dd.dealing.vo.BoardVO;
import com.dd.dealing.vo.DealingVO;
import com.dd.dealing.vo.KakaoLoginVO;
import com.dd.dealing.vo.MemberVO;
import com.dd.dealing.vo.NoticeVO;
import com.dd.dealing.vo.ReportVO;

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

	/* 회원탈퇴 */
	@Override
	public void removeMem(String user_Id) throws Exception {
		dealingDAO.removeMem(user_Id);
	}

	/* 회원탈퇴 비번 체크 */
	@Override
	public int pwdCheck(@Param("user_Pwd") String user_Pwd, @Param("user_Id") String user_Id) throws Exception {
		int result = dealingDAO.pwdCheck(user_Pwd, user_Id);
		return result;

	}

//	로그인확인
	@Override
	public MemberVO login(MemberVO memberVO) throws Exception {
		return dealingDAO.loginById(memberVO);
	}

//	카카오 로그인 
	public int kakaologin(Map<String, Object> user) throws Exception {
		return dealingDAO.kakaologin(user);
	}

//	카카오 아이디 이름 반환
	public KakaoLoginVO kakaoresult(Map<String, Object> user) throws Exception {
		return dealingDAO.kakaoresult(user);
	}

	// 매물등록
	@Override
	public int addNewdealing(Map<String, Object> dealingMap) throws DataAccessException {
		return dealingDAO.addNewdealing(dealingMap);
	}

//	매물 조회수
	public void viewCount(int dl_Num) throws DataAccessException {
		dealingDAO.viewCount(dl_Num);
	}

//	매물 전부 리스트 검색
	public List<DealingVO> allListdealing() throws DataAccessException {
		List<DealingVO> allListdealing = dealingDAO.allListdealing();
		return allListdealing;
	}

	// 지도 검색(건물형태 버튼)
	@Override
	public List<DealingVO> selectMap(Map<String, Object> dlSearch) throws DataAccessException {
		List<DealingVO> dlMap = dealingDAO.selectMap(dlSearch);
		return dlMap;
	}

	// 지도 검색(건물형태 버튼)
	@Override
	public List<DealingVO> selectMap3(Map<String, Object> dlSearch) throws DataAccessException {
		List<DealingVO> dlMap = dealingDAO.selectMap3(dlSearch);
		return dlMap;
	}

	// 지도창에서 검색
	@Override
	public List<DealingVO> selectMap2(Map<String, Object> dlMap) throws DataAccessException {
		List<DealingVO> dlReqp = dealingDAO.selectMap2(dlMap);
		return dlReqp;
	}

	/* 현재위치 검색 */
	@Override
	public List<DealingVO> hereMe(Map<String, Object> hereMap) throws DataAccessException {
		List<DealingVO> hereList = dealingDAO.hereMe(hereMap);
		return hereList;
	}

	/* 로컬스토리지 보류 */
	/* 메인페이지 검색조건 리스트 */
//	@Override
//	public List<DealingVO> dlMainMap(Map<String, Object> mainMap) throws DataAccessException {
//		List<DealingVO> dlMain = dealingDAO.dlMainMap(mainMap);
//		return dlMain;
//	}

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

	// 인테리어 글추가
	@Override
	public int insertboard(Map<String, Object> boardMap) throws DataAccessException {
		return dealingDAO.insertboard(boardMap);
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
		return dealingDAO.selectAllNoticlesList();
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
	public int addReport(Map<String, Object> report) throws DataAccessException {
		return dealingDAO.insertReport(report);
	}

	// 매물상세보기
	@Override
	public DealingVO getDealingContents(int dl_Num) throws Exception {
		return dealingDAO.getDealingContents(dl_Num);
	}

	/* 마이페이지 신고리스트 */
	@Override
	public List<ReportVO> myReport(String user_Id) throws DataAccessException {
		return dealingDAO.myReport(user_Id);
	}

	/* 마이페이지 신고리스트 */
	@Override
	public List<DealingVO> myDealing(String user_Id) throws DataAccessException {
		return dealingDAO.myDealing(user_Id);
	}
}
