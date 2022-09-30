package com.dd.dealing.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.dd.dealing.vo.BoardVO;
import com.dd.dealing.vo.DealingVO;
import com.dd.dealing.vo.MemberVO;
import com.dd.dealing.vo.NoticeVO;

public interface DealingService {

	// 회원가입
	public int addMember(MemberVO member) throws DataAccessException;

//	회원가입 아이디 중복체크
	public int idcheck(String user_Id) throws DataAccessException;

//	로그인체크
	public MemberVO login(MemberVO memberVO) throws Exception;

//	지도검색
	public List<DealingVO> selectMap() throws DataAccessException;

	// 지도창에서 검색
	public List<DealingVO> selectMap2(Map<String, Object> dlMap) throws DataAccessException;

//	매물 전부검색
	public List<DealingVO> allListdealing() throws DataAccessException;

	// 매물등록
	public int addNewdealing(Map dealingMap) throws DataAccessException;

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

}
