package com.dd.admin.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dd.admin.service.AdminService;
import com.dd.dealing.vo.DealingVO;
import com.dd.dealing.vo.MemberVO;
import com.dd.dealing.vo.ReportVO;
import com.dd.product.vo.ProductVO;

@Controller("adminController")
public class AdminController {

	@Autowired
	private AdminService adminService;

	/* 관리자페이지 */
	@RequestMapping(value = "/admin/admin.do", method = { RequestMethod.GET, RequestMethod.POST })
	private String adminMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		return viewName;
	}

	/* 메뉴 화이트버전 */
	@RequestMapping(value = "/admin/layout-sidenav-light.do", method = { RequestMethod.GET, RequestMethod.POST })
	private String adminMainLight(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		return viewName;
	}

	/* 메뉴 고정버전 */
	@RequestMapping(value = "/admin/layout-static.do", method = { RequestMethod.GET, RequestMethod.POST })
	private String adminMainStatic(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		return viewName;
	}

	/* 로그인 창 */
	@RequestMapping(value = "/admin/login.do", method = { RequestMethod.GET, RequestMethod.POST })
	private String adminLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		return viewName;
	}

	/* 관리자 가입창 */
	@RequestMapping(value = "/admin/register.do", method = { RequestMethod.GET, RequestMethod.POST })
	private String adminJoin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		return viewName;
	}

	/* 신고목록 */
	@RequestMapping(value = "/admin/reportList.do", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView reportList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		List<ReportVO> reportsList = new ArrayList();
		reportsList = adminService.reportsList();
		mav.setViewName(viewName);
		mav.addObject("reportsList", reportsList);
		return mav;
	}

	/* 신고상세 */
	@RequestMapping(value = "/admin/reportView.do", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView reportView(@RequestParam("rp_Num") int rp_Num, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(rp_Num);
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		// List<ReportVO> rpContents = new ArrayList<ReportVO>();
		ReportVO rpContents = adminService.reportView(rp_Num);
		mav.addObject("rpContents", rpContents);
		mav.setViewName(viewName);
		System.out.println(rpContents);
		return mav;
	}

	/* 신고상태 변경 */
	@RequestMapping(value = "/admin/reportState.do", method = RequestMethod.POST)
	private String reportState(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String rp_State = request.getParameter("rp_State");
		String dl_ReportNum = request.getParameter("dl_ReportNum");
		Map<String, Object> map = new HashMap<>();
		map.put("dl_ReportNum", dl_ReportNum);
		map.put("rp_State", rp_State);
		System.out.println(rp_State);
		adminService.reportState(map);
		return "redirect:/admin/reportList.do";
	}

	/* 신고삭제(상세페이지) */
	@RequestMapping(value = "/admin/deleteReport.do", method = RequestMethod.POST)
	private String deleteReport(@RequestParam("dl_ReportNum") int dl_ReportNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("신고삭제");
		adminService.deleteReport(dl_ReportNum);
		return "redirect:/admin/reportList.do";
	}

	/* 신고삭제(여러개) */
	@RequestMapping(value = "/admin/deleteReport2.do", method = RequestMethod.POST)
	private void deleteReport2(@RequestParam("checkAll") List<Integer> rpsList, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(rpsList);
		Map<String, Object> rpsMap = new HashMap<String, Object>();
		rpsMap.put("rpsList", rpsList);
		adminService.deleteReport2(rpsMap);
		ModelAndView mav = new ModelAndView();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('삭제가 완료되었습니다.'); location.href='/admin/reportList.do'</script>");
		out.flush();
	}

	/* 매물목록 */
	@RequestMapping(value = "/admin/dealingsList.do", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView dealingsList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("매물목록 들어옴");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		List<DealingVO> dealingsList = new ArrayList<DealingVO>();
		dealingsList = adminService.dealingsList();
		mav.setViewName(viewName);
		mav.addObject("dealingsList", dealingsList);
		System.out.println(dealingsList);
		return mav;
	}

	/* 매물상세보기(관리자) */
	@RequestMapping(value = "/admin/adminDlView.do", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView adminDlView(@RequestParam("dl_Num") int dl_Num, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(dl_Num);
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		DealingVO dlContents = adminService.adminDlView(dl_Num);
		mav.addObject("dlContents", dlContents);
		mav.setViewName(viewName);
		System.out.println(dlContents);
		return mav;
	}

	/* 매물삭제(관리자) */
	@RequestMapping(value = "/admin/deleteDealing.do", method = RequestMethod.POST)
	private void deleteDealing(@RequestParam("checkAll") List<Integer> dlsList, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(dlsList);
		Map<String, Object> dlsMap = new HashMap<String, Object>();
		dlsMap.put("dlsList", dlsList);
		adminService.deleteDealing(dlsMap);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('삭제가 완료되었습니다.'); location.href='/admin/dealingsList.do'</script>");
		out.flush();
	}

//	유저정보
	@RequestMapping(value = "/admin/member.do", method = RequestMethod.POST)
	private String adminmember(HttpServletRequest req, Model mo) throws Exception {
		List<MemberVO> adminMember = adminService.adminMember();
		mo.addAttribute("adminMember", adminMember);
		return "/admin/adminMember";
	}

//	상품조회
	@RequestMapping(value = "/admin/pro.do", method = RequestMethod.POST)
	private String adminpro(HttpServletRequest req, Model mo) throws Exception {
		List<ProductVO> proselect = adminService.adminpro();
		mo.addAttribute("proselect", proselect);
		return "/admin/productList";
	}

}
