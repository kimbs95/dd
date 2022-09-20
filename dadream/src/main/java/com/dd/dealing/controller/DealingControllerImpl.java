package com.dd.dealing.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dd.dealing.service.DealingService;
import com.dd.dealing.vo.MemberVO;

@Controller("dealingController")
public class DealingControllerImpl {
	@Autowired
	private DealingService dealingService;
	@Autowired
	private MemberVO memberVO;

	/* 회원가입 선택 */
	@RequestMapping(value = "/userjoin.do", method = RequestMethod.GET)
	private ModelAndView userjoin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;

	}

	/* 회원가입 */
	@RequestMapping(value = "/userform.do", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView userform(@RequestParam("member") String member, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println("member 받은값 : " + member);
		ModelAndView mav = new ModelAndView();
		mav.addObject("member", member);
		mav.setViewName(viewName);
		System.out.println("interceptor에서 온 viewName:" + viewName);
		return mav;
	}

//	회원가입 전송 
	@RequestMapping(value = "/addMember.do", method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member") MemberVO member, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = dealingService.addMember(member);
		ModelAndView mav = new ModelAndView("redirect:/dealingmain.do");
		return mav;
	}

	/* 로그인 */
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	private ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		System.out.println("interceptor에서 온 viewName:" + viewName);
		return mav;
	}

	/* 마이페이지 */
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	private ModelAndView mypage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		System.out.println("interceptor에서 온 viewName:" + viewName);
		return mav;
	}

	/* 사용자 매물메인 */
	@RequestMapping(value = "/dealingmain.do", method = RequestMethod.GET)
	private ModelAndView dealingmain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		System.out.println("interceptor에서 온 viewName:" + viewName);
		return mav;
	}

	/* 중개사 메인 */
	@RequestMapping(value = "/dealingmainvip.do", method = RequestMethod.GET)
	private ModelAndView dealingmainvip(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		System.out.println("interceptor에서 온 viewName:" + viewName);
		return mav;
	}

	/* 매물등록 */

	@RequestMapping(value = "/dealingform.do", method = RequestMethod.GET)
	private ModelAndView dealingform(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		System.out.println("interceptor에서 온 viewName:" + viewName);
		return mav;
	}

	/* 매물상세보기 */

	@RequestMapping(value = "/dealingview.do", method = RequestMethod.GET)
	private ModelAndView dealingview(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		System.out.println("interceptor에서 온 viewName:" + viewName);
		return mav;
	}

	/* 중개사 팝업창 */
	@RequestMapping("/call.do")
	public String call(Model model) {
		return "/dealing/call";
	}

	/* 매물수정 */

	@RequestMapping(value = "/dealingmod.do", method = RequestMethod.GET)
	private ModelAndView dealingmod(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		System.out.println("interceptor에서 온 viewName:" + viewName);
		return mav;
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
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		System.out.println("interceptor에서 온 viewName:" + viewName);
		return mav;
	}

}
