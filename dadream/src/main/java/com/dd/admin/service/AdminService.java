package com.dd.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.dd.dealing.vo.ReportVO;
import com.dd.product.vo.ProductVO;

public interface AdminService {

	public List<ReportVO> reportsList() throws DataAccessException;

	public ReportVO reportView(int rp_Num) throws DataAccessException;

	public void reportState(Map<String, Object> map) throws DataAccessException;

	public void deleteReport(int dl_ReportNum) throws DataAccessException;

//	상품조회
	public List<ProductVO> adminpro() throws DataAccessException;
}
