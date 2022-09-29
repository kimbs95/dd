package com.dd.dealing.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dd.dealing.service.DealingService;
import com.dd.dealing.vo.BoardVO;
import com.dd.dealing.vo.DealingVO;
import com.dd.dealing.vo.MemberVO;

@Controller("dealingController")
public class DealingControllerImpl {

	private static final String DEALING_IMAGE_REPO = "C:\\dealing\\dealing_image";

	@Autowired
	private DealingService dealingService;
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private DealingVO dealingVO;

	/* 회원가입 선택 */
	@RequestMapping(value = "/userjoin.do", method = RequestMethod.GET)
	private String userjoin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		return viewName;
	}

	/* 회원가입 창 */
	@RequestMapping(value = "/userform.do", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView userform(@RequestParam("memberjoin") String memberjoin, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.addObject("memberjoin", memberjoin);
		mav.setViewName(viewName);
		return mav;
	}

//	아이디 중복체크
	@ResponseBody
	@RequestMapping(value = "/idcheck.do", method = { RequestMethod.POST })
	private Map<String, Object> idcheck(@RequestBody Map<String, Object> body) throws Exception {
		int result = 0;
		result = dealingService.idcheck((String) body.get("user_Id"));
		System.out.println((String) body.get("user_Id"));
		Map<String, Object> map = new HashMap<>();
		System.out.println(result);
		map.put("resultCode", result);

		return map;
	}

//	회원가입 전송 
	@RequestMapping(value = "/addMember.do", method = RequestMethod.POST)
	private ModelAndView addMember(MemberVO member, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = dealingService.addMember(member);
		ModelAndView mav = new ModelAndView("redirect:/formcheck.do");
		return mav;
	}

//	회원가입 완료
	@RequestMapping(value = "/formcheck.do", method = RequestMethod.GET)
	private String uformcheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println("interceptor에서 온 viewName:" + viewName);
		return viewName;
	}

	/* 로그인 */
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	private String login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println("interceptor에서 온 viewName:" + viewName);
		return viewName;
	}

//	로그인 확인

	@RequestMapping(value = "/logincheck.do", method = RequestMethod.POST)
	public ModelAndView logincheck(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		memberVO = dealingService.login(member);
		if (memberVO != null) {
			HttpSession session = request.getSession();

			session.setAttribute("member", memberVO);
			session.setAttribute("isLogOn", true);
			mav.setViewName("redirect:/dealingmain.do");
		} else {
			rAttr.addAttribute("result", "loginFailed");
			mav.setViewName("redirect:/login.do");
		}
		return mav;
	}

//	로그아웃
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/dealingmain.do");
		return mav;
	}

	/* 마이페이지 */
	@RequestMapping(value = "/mypage.do", method = RequestMethod.POST)
	private String mypage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println("interceptor에서 온 viewName:" + viewName);
		return viewName;
	}

	/* 사용자 매물메인 */
	@RequestMapping(value = "/dealingmain.do", method = RequestMethod.GET)
	private String dealingmain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println("interceptor에서 온 viewName:" + viewName);
		return viewName;
	}

	/* 매물등록 */

	@RequestMapping(value = "/dealingform.do", method = RequestMethod.GET)
	private String dealingform(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println("interceptor에서 온 viewName:" + viewName);
		return viewName;
	}

	/* 매물등록 DB전송 */

	@RequestMapping(value = "/addNewdealing.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewdealing(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> dealingMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			dealingMap.put(name, value);
		}
		String dl_Image = upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		String user_Id = member.getUser_Id();
		dealingMap.put("dl_Num", 0);
		dealingMap.put("user_Id", user_Id);
		dealingMap.put("dl_Image", dl_Image);

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int dl_Num = dealingService.addNewdealing(dealingMap);
			if (dl_Image != null && dl_Image.length() != 0) {
				File srcFile = new File(DEALING_IMAGE_REPO + "\\" + "temp" + "\\" + dl_Image);
				File destDir = new File(DEALING_IMAGE_REPO + "\\" + dl_Num);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}

			message = "<script>";
			message += "alert('새글을 추가했습니다.');";
			message += "location.href='" + multipartRequest.getContextPath() + "/dealingmain.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
//			File srcFile = new File(DEALING_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
//			srcFile.delete();

			message = "<script>";
			message += "alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += "location.href='" + multipartRequest.getContextPath() + "/board/articleForm.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	// 한개 이미지 업로드 하기
	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		String dl_Image = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();

		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			dl_Image = mFile.getOriginalFilename();
			File file = new File(DEALING_IMAGE_REPO + "\\" + "temp" + "\\" + fileName);
			if (mFile.getSize() != 0) {
				if (!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(DEALING_IMAGE_REPO + "\\" + "temp" + "\\" + dl_Image));
				}
			}
		}
		return dl_Image;

	}

	/* 매물상세보기 */

	@RequestMapping(value = "/dealingview.do", method = RequestMethod.GET)
	private String dealingview(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println("interceptor에서 온 viewName:" + viewName);
		return viewName;
	}

	/* 중개사 팝업창 */
	@RequestMapping("/call.do")
	public String call(Model model) {
		return "/dealing/call";
	}

	/* 매물수정 */

	@RequestMapping(value = "/dealingmod.do", method = RequestMethod.GET)
	private String dealingmod(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println("interceptor에서 온 viewName:" + viewName);
		return viewName;
	}

	/* 매물 수정,삭제 */
	@RequestMapping("/modanddel.do")
	public String modanddel(Model model) {
		return "/dealing/modanddel";
	}

	/* 지도창 */
	@RequestMapping(value = "/map.do", method = RequestMethod.GET)
	private ModelAndView map(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		String search = (String) request.getParameter("search");
//		매물 전부 리스트 검색
		List<DealingVO> allListdealing = dealingService.allListdealing();
		ModelAndView mav = new ModelAndView();
		mav.addObject("search", search);
		mav.addObject("allListdealing", allListdealing);
		mav.setViewName(viewName);
		return mav;
	}

	/* 지도 첫 검색 */
	@RequestMapping(value = "/showMap.do", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity showMap(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String dl_Lat = request.getParameter("dl_Lat");
		String dl_Lng = request.getParameter("dl_Lng");
		String dl_Address = request.getParameter("dl_Address");
		System.out.println("dl_Lat : " + dl_Lat);
		System.out.println("dl_Lng : " + dl_Lng);
		System.out.println("dl_Address: " + dl_Address);
		List<DealingVO> dlMap = new ArrayList<DealingVO>();
		dlMap = dealingService.selectMap();

		return new ResponseEntity(dlMap, HttpStatus.OK);
	}

	/* 지도창에서 검색 */
	@RequestMapping(value = "/showMap2.do", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity showMap2(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Map<String, Object> dlMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = request.getParameter(name);
			dlMap.put(name, value);
		}
		List<DealingVO> dlReq = new ArrayList<DealingVO>();
		dlReq = dealingService.selectMap2(dlMap);

		System.out.println("dlReq : " + dlReq);
		return new ResponseEntity(dlReq, HttpStatus.OK);

	}

	// 인테리어 게시판 글쓰기
	@RequestMapping(value = "/inteboardform.do", method = { RequestMethod.GET })
	private String addboard(BoardVO board, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		return "/dealing/addboard";
	}

	// 인테리어 게시글 전송
	@RequestMapping(value = "/addinteboard.do", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView addinteboard(@ModelAttribute("board") BoardVO board, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = dealingService.addinteboard(board);
		ModelAndView mav = new ModelAndView("redirect:/inteboardlist.do");
		return mav;
	}

	// 인테리어 게시판리스트
	@RequestMapping(value = "/inteboardlist.do", method = RequestMethod.GET)
	private ModelAndView inteboardform(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/dealing/inteboardlist");
		List<BoardVO> inteboardlist = dealingService.listArticles();

		mav.addObject("inteboardlist", inteboardlist);
		System.out.println("interceptor에서 온 viewName:" + viewName);
		return mav;
	}

	/* 신고하기 */
	@ResponseBody
	@RequestMapping(value = "/report.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity report(@ModelAttribute("report") String report, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> rpMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = request.getParameter(name);
			rpMap.put(name, value);
		}

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String user_Id = memberVO.getUser_Id();
//		String rp_Title = member.getRp_Title();
//		String rp_Content = VO.getRp_Content();
//		int dl_Num = reportVO.getDl_Num();
		rpMap.put("user_Id", user_Id);
//		rpMap.put("dl_Num", dl_Num);
//		rpMap.put("rp_Title", rp_Title);
//		rpMap.put("rp_Content", rp_Content);
		System.out.println("user_Id : " + user_Id);
//		System.out.println("dl_Num" + dl_Num);
//		System.out.println("rp_Title" + rp_Title);
//		System.out.println("rp_Content" + rp_Content);
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int rpNO = dealingService.addReport(rpMap);
			System.out.println("rpNO : " + rpNO);
			message = "<script>";
			message += "alert('신고가 완료되었습니다.');";
			// message += "location.href='" + request.getContextPath() +
			// "/board/listArticles.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {

			message = "<script>";
			message += "alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			// message += "location.href='" + request.getContextPath() +
			// "/board/articleForm.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	/* 신고 팝업창 */
	@RequestMapping("/rpPopUp.do")
	public String reportPop(Model model) {
		return "/dealing/report";
	}
}
