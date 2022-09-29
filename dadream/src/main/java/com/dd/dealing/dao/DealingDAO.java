package com.dd.dealing.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.dd.dealing.vo.BoardVO;
import com.dd.dealing.vo.DealingVO;
import com.dd.dealing.vo.MemberVO;

@Mapper
@Repository("dealingDAO")
public interface DealingDAO {

	public int insertMember(MemberVO memberVO) throws DataAccessException;

	public MemberVO loginById(MemberVO memberVO) throws DataAccessException;

	public int insertReport(Map rpMap) throws DataAccessException;

	public int addNewdealing(Map dealingMap) throws DataAccessException;

	public int insertboard(BoardVO boardVO) throws DataAccessException;

	public List selectAllArticlesList() throws DataAccessException;

	public int idcheck(String user_Id) throws DataAccessException;

	public List<DealingVO> selectMap() throws DataAccessException;

	public List<DealingVO> selectMap2(Map<String, Object> dlMap) throws DataAccessException;

	public List<DealingVO> allListdealing() throws DataAccessException;

}
