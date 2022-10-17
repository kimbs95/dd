package com.dd.dealing.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.dd.dealing.vo.BoardVO;
import com.dd.dealing.vo.DealingVO;
import com.dd.dealing.vo.JjimVO;
import com.dd.dealing.vo.KakaoLoginVO;
import com.dd.dealing.vo.MemberVO;
import com.dd.dealing.vo.NoticeVO;
import com.dd.dealing.vo.ReportVO;

@Mapper
@Repository("dealingDAO")
public interface DealingDAO {
//	마이페이지에서 필요회원에대한 정보
	public MemberVO members(String user_Id) throws Exception;

	// 회원가입
	public int insertMember(MemberVO memberVO) throws DataAccessException;

	// 로그인
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException;

	// 아이디 중복확인
	public int idcheck(String user_Id) throws DataAccessException;

	/* 회원탈퇴 */
	public void removeMem(String user_Id) throws Exception;

	// 회원탈퇴 시 비밀번호 확인
	public int pwdCheck(@Param("user_Pwd") String user_Pwd, @Param("user_Id") String user_Id) throws Exception;

	// 카카오 로그인
	public int kakaologin(Map<String, Object> user) throws Exception;

	// 카카오 아이디 이름 반환
	public KakaoLoginVO kakaoresult(Map<String, Object> user) throws Exception;

	//////////////////////// 부동산////////////////////////////
	// 매물 DB전송
	public int addNewdealing(Map<String, Object> dealingMap) throws DataAccessException;

	// 매물 상세보기
	public DealingVO getDealingContents(int dl_Num) throws Exception;

	// 매물 조회수
	public void viewCount(int dl_Num) throws DataAccessException;

	// 검색버튼
	public List<DealingVO> selectMap(Map<String, Object> dlSearch) throws DataAccessException;

	// 검색창
	public List<DealingVO> selectMap3(Map<String, Object> dlSearch) throws DataAccessException;

	public List<DealingVO> selectMap2(Map<String, Object> dlMap) throws DataAccessException;

	// 모든매물 리스트
	public List<DealingVO> allListdealing() throws DataAccessException;

	//////////////////////// 게시판////////////////////////////

	// 게시글 DB전송
	public int insertboard(Map<String, Object> boardMap) throws DataAccessException;

	// 게시판 글 목록
	public List selectAllArticlesList() throws DataAccessException;

	// 게시판 수정
	public void update(BoardVO boardVO) throws Exception;

	// 게시판 삭제
	public void deleteArticle(int inte_Num) throws DataAccessException;

	// 게시판 상세보기
	public BoardVO getBoardContents(int inte_Num) throws Exception;

	// 게시판 조회수
	public void updateView(int viewCounts) throws Exception;

	// 게시글 글 수정화면
	public void updateBoard(BoardVO boardVO) throws Exception;

	// 게시글 수정 동작
	public void updateArticle(Map dealingMap) throws DataAccessException;

	//////////////////////// 공지사항////////////////////////////

	// 공지사항 리스트
	public List<NoticeVO> selectAllNoticlesList() throws Exception;

	// 공지사항 DB전송
	public int insertnotice(Map<String, Object> noticeMap) throws DataAccessException;

	// 공지사항 글 상세보기
	public NoticeVO getNoticeContents(int notice_Num) throws DataAccessException;

	// 공지사항 조회수
	public void updateViewCnt(int viewCnt) throws Exception;

	//////////////////////// 마이페이지 ////////////////////////////

	// 마이페이지 비밀번호 확인
	public int infoCheck(MemberVO member) throws Exception;

//	마이페이지 정보 변경
	public int memberMod(MemberVO member) throws Exception;

//	비밀번호 변경했는지 확인
	public int modPwd(MemberVO member) throws Exception;

//	비밀번호는 변경안했을때
	public int memMod(MemberVO member) throws Exception;

	// 마이페이지 신고리스트
	public List<ReportVO> myReport(String user_Id) throws DataAccessException;

	// 신고하기 DB전송
	public int insertReport(Map rpMap) throws DataAccessException;

	// 마이페이지 찜 목록
	public List<JjimVO> myJjim(String user_Id) throws DataAccessException;

	public int jjimCheck(Map jjimMap) throws Exception;

	public void jjim(Map jjimMap) throws Exception;

	public void jjimRemove(Map jjimMap) throws Exception;

	// 마이페이지 매물리스트
	public List<DealingVO> myDealing(String user_Id) throws DataAccessException;

	// 현재위치
	public List<DealingVO> hereMe(Map<String, Object> hereMap) throws DataAccessException;

}
