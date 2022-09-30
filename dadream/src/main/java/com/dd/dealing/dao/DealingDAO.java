package com.dd.dealing.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.dd.dealing.vo.BoardVO;
import com.dd.dealing.vo.DealingVO;
import com.dd.dealing.vo.MemberVO;
import com.dd.dealing.vo.NoticeVO;

@Mapper
@Repository("dealingDAO")
public interface DealingDAO {
	// 회원가입
	public int insertMember(MemberVO memberVO) throws DataAccessException;

	public MemberVO loginById(MemberVO memberVO) throws DataAccessException;

	public int insertReport(Map rpMap) throws DataAccessException;

	// 매물 DB전송
	public int addNewdealing(Map dealingMap) throws DataAccessException;

	// 게시글 DB전송
	public int insertboard(BoardVO boardVO) throws DataAccessException;

	// 게시판 글 목록
	public List selectAllArticlesList() throws DataAccessException;

	public int idcheck(String user_Id) throws DataAccessException;

	public List<DealingVO> selectMap() throws DataAccessException;

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

}
