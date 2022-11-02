package com.dd.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dd.admin.dao.AdminDAO;
import com.dd.dealing.vo.DealingVO;
import com.dd.dealing.vo.MemberVO;
import com.dd.dealing.vo.ReportVO;
import com.dd.product.vo.ProductVO;

@Service("adminSerivce")
@Transactional(propagation = Propagation.REQUIRED)
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO adminDAO;

	/* 신고목록 */
	@Override
	public List<ReportVO> reportsList() throws DataAccessException {
		return adminDAO.reportsList();
	}

	/* 신고내용 상세보기 */
	@Override
	public ReportVO reportView(int rp_Num) throws DataAccessException {
		return adminDAO.reportView(rp_Num);
	}

	/* 신고상태 변경 */
	@Override
	public void reportState(Map<String, Object> map) throws DataAccessException {
		adminDAO.reportState(map);
	}

	/* 신고삭제(관리자) */
	@Override
	public void deleteReport(int dl_ReportNum) throws DataAccessException {
		adminDAO.deleteReport(dl_ReportNum);
	}

	/* 신고삭제(여러개) */
	@Override
	public void deleteReport2(Map<String, Object> rpsMap) throws DataAccessException {
		adminDAO.deleteReport2(rpsMap);
	}

	/* 매물목록 */
	@Override
	public List<DealingVO> dealingsList() throws DataAccessException {
		return adminDAO.dealingsList();
	}

	/* 매물상세(관리자) */
	@Override
	public DealingVO adminDlView(int dl_Num) throws DataAccessException {
		return adminDAO.adminDlView(dl_Num);
	}

	/* 매물삭제(관리자) */
	@Override
	public void deleteDealing(Map<String, Object> dlsMap) throws DataAccessException {
		adminDAO.deleteDealing(dlsMap);
	}

	/* 유저 정보 */
	public List<MemberVO> adminMember() throws DataAccessException {
		return adminDAO.adminMember();
	}

	/* 상품조회 */
	@Override
	public List<ProductVO> adminpro() throws DataAccessException {
		return adminDAO.adminpro();
	}

//	허위 매물 막기 변경
	@Override
	public int levelPost(Map<String, Object> mem) throws Exception {
		return adminDAO.levelPost(mem);
	}

}
