package com.dd.dealing.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.dd.dealing.vo.BoardVO;
import com.dd.dealing.vo.DealingVO;
import com.dd.dealing.vo.KakaoLoginVO;
import com.dd.dealing.vo.MemberVO;
import com.dd.dealing.vo.NoticeVO;
import com.dd.dealing.vo.ReportVO;

@Mapper
@Repository("dealingDAO")
public interface DealingDAO {
	// 회원가입
	public int insertMember(MemberVO memberVO) throws DataAccessException;

	public MemberVO loginById(MemberVO memberVO) throws DataAccessException;

	public int insertReport(Map rpMap) throws DataAccessException;

//	카카오 로그인 
	public int kakaologin(Map<String, Object> user) throws Exception;

//	카카오 아이디 이름 반환
	public KakaoLoginVO kakaoresult(Map<String, Object> user) throws Exception;

	// 매물 DB전송
	public int addNewdealing(Map<String, Object> dealingMap) throws DataAccessException;

	// 게시글 DB전송
	public int insertboard(BoardVO boardVO) throws DataAccessException;

	// 게시판 글 목록
	public List selectAllArticlesList() throws DataAccessException;

	public int idcheck(String user_Id) throws DataAccessException;

	// 검색버튼
	public List<DealingVO> selectMap(Map<String, Object> dlSearch) throws DataAccessException;

	// 검색창
	public List<DealingVO> selectMap3(Map<String, Object> dlSearch) throws DataAccessException;

	public List<DealingVO> selectMap2(Map<String, Object> dlMap) throws DataAccessException;

	public List<DealingVO> allListdealing() throws DataAccessException;

	// 게시판 수정
	public void update(BoardVO boardVO) throws Exception;

	// 게시판 삭제
	public void deleteArticle(int inte_Num) throws DataAccessException;

	// 게시판 상세보기
	public BoardVO read(int inte_Num) throws Exception;

	// 상세보기
	public BoardVO getBoardContents(int inte_Num) throws Exception;

	public void updateBoard(BoardVO boardVO) throws Exception;

	public void updateArticle(Map dealingMap) throws DataAccessException;

	// 공지사항 리스트
	public List<NoticeVO> selectAllNoticlesList() throws Exception;

	// 공지사항 DB전송
	public void insertnotice(Object object) throws Exception;

	// 게시판 조회수
	public void updateView(int viewCounts) throws Exception;

	// 매물 상세보기
	public DealingVO getDealingContents(int dl_Num) throws Exception;

	// 마이페이지 신고리스트
	public List<ReportVO> myReport(String user_Id) throws DataAccessException;

	// 마이페이지 매물리스트
	public List<DealingVO> myDealing(String user_Id) throws DataAccessException;

	// 현재위치
	public List<DealingVO> hereMe(Map<String, Object> hereMap) throws DataAccessException;

}
