package com.dd.dealing.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dd.dealing.service.DealingService;
import com.dd.dealing.vo.BoardVO;
import com.dd.dealing.vo.DealingVO;
import com.dd.dealing.vo.MemberVO;

@Controller("dealingController")
public class DealingControllerImpl {
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
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
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
	public ModelAndView addNewdealing(DealingVO dealing, MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> dealingMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			dealingMap.put(name, value);
			// 형 변환..?
			String dl_Price = "12345";
			int dl_price = Integer.parseInt(dl_Price);
		}

		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String user_Id = memberVO.getUser_Id();
		dealingMap.put("dl_Num", 0);
		dealingMap.put("user_Id", user_Id);

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/dealingmain");
		return mav;
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
	private String map(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println("interceptor에서 온 viewName:" + viewName);
		return viewName;
	}

	// 인테리어 게시판리스트
	@RequestMapping(value = "/inteboard.do", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView listboard(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/dealing/board");
		return mav;
	}

	// 인테리어 게시판 글쓰기
	@RequestMapping(value = "/inteboardform.do", method = { RequestMethod.GET })
	private String addboard(BoardVO board, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		return "/dealing/addboard";
	}

	// 인테리어게시글 전송
	@RequestMapping(value = "/addinteboard.do", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView addinteboard(@ModelAttribute("board") BoardVO board, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = dealingService.addinteboard(board);
		ModelAndView mav = new ModelAndView("redirect:/inteboard.do");
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
