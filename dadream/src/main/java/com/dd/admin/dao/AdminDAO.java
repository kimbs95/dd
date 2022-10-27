package com.dd.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.dd.dealing.vo.ReportVO;

@Mapper
@Repository("adminDAO")
public interface AdminDAO {
	/* 신고목록 */
	public List<ReportVO> reportsList() throws DataAccessException;

	/* 신고내역 상세보기 */
	public ReportVO reportView(int rp_Num) throws DataAccessException;

	/* 신고상태 변경 */
	public void reportState(Map<String, Object> map) throws DataAccessException;

	public void deleteReport(int dl_ReportNum) throws DataAccessException;
}
