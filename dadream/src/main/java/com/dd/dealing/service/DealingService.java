package com.dd.dealing.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.dd.dealing.vo.BoardVO;
import com.dd.dealing.vo.DealingVO;
import com.dd.dealing.vo.KakaoLoginVO;
import com.dd.dealing.vo.MemberVO;
import com.dd.dealing.vo.NoticeVO;
import com.dd.dealing.vo.ReportVO;

public interface DealingService {

	// 회원가입
	public int addMember(MemberVO member) throws DataAccessException;

//	회원가입 아이디 중복체크
	public int idcheck(String user_Id) throws DataAccessException;

//	로그인체크
	public MemberVO login(MemberVO memberVO) throws Exception;

//	카카오 로그인 
	public int kakaologin(Map<String, Object> user) throws Exception;

//	카카오 아이디 이름 반환
	public KakaoLoginVO kakaoresult(Map<String, Object> user) throws Exception;

//	지도검색
	public List<DealingVO> selectMap(Map<String, Object> dlSearch) throws DataAccessException;

	public List<DealingVO> selectMap3(Map<String, Object> dlSearch) throws DataAccessException;

	// 지도창에서 검색
	public List<DealingVO> selectMap2(Map<String, Object> dlMap) throws DataAccessException;

//	매물 전부검색
	public List<DealingVO> allListdealing() throws DataAccessException;

	// 매물등록
	public int addNewdealing(Map<String, Object> dealingMap) throws DataAccessException;

	// 인테리어게시판 등록
	public int addinteboard(BoardVO board) throws DataAccessException;

	// 인테리어게시판 글 목록
	public List<BoardVO> listArticles() throws Exception;

	// 인테리어 게시글 수정완료
	public void modArticle(Map dealingMap) throws Exception;

	// 인테리어 게시글 목록 가져오기
	public BoardVO getBoardContents(int inte_Num) throws Exception;

	// 인테리어 게시글 수정
	public void updateBoard(BoardVO boardVO) throws Exception;

	// 인테리어 게시글 삭제
	public void removeArticle(int inte_Num) throws Exception;

	// 공지사항 글 목록
	public List<NoticeVO> listNoticles() throws Exception;

	// 공지사항 글 등록
	public void insertnotice(NoticeVO searchVO) throws Exception;

	// 게시판 조회수 증가
	public void updateView(int viewCounts) throws Exception;

//	신고하기
	public int addReport(Map rpMap) throws DataAccessException;

	// 매물상세보기
	public DealingVO getDealingContents(int dl_Num) throws Exception;

	// 마이페이지 신고리스트
	public List<ReportVO> myReport(String user_Id) throws DataAccessException;

	// 마이페이지 매물리스트
	public List<DealingVO> myDealing(String user_Id) throws DataAccessException;

	// 현재위치
	public List<DealingVO> hereMe(Map<String, Object> hereMap) throws DataAccessException;

	// 로컬스토리지 보류
//		public List<DealingVO> dlMainMap(Map<String, Object> mainMap) throws DataAccessException;
}
