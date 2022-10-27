package com.dd.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.dd.dealing.vo.ReportVO;

public interface AdminService {

	public List<ReportVO> reportsList() throws DataAccessException;

	public ReportVO reportView(int rp_Num) throws DataAccessException;

	public void reportState(Map<String, Object> map) throws DataAccessException;

	public void deleteReport(int dl_ReportNum) throws DataAccessException;
}
