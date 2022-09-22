package com.dd.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dd.product.service.ProductService;
import com.dd.product.vo.ProductVO;

@Controller("productController")
public class ProductControllerImpl implements ProductController {
	@Autowired
	private ProductService productService;
	@Autowired
	private ProductVO productVO;

	/* 사용자 가구 메인 */
	@RequestMapping(value = { "/productmain.do" }, method = RequestMethod.GET)
	private ModelAndView productmain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		System.out.println("interceptor에서 온 viewName:" + viewName);
		return mav;
	}

	/* 판매자 가구 메인 */
	@RequestMapping(value = { "/productmainvip.do" }, method = RequestMethod.GET)
	private String productmainvip(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println("interceptor에서 온 viewName:" + viewName);
		return viewName;
	}

	/* 상품목록 */
	@RequestMapping(value = { "/product.do" }, method = RequestMethod.GET)
	private String product(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println("interceptor에서 온 viewName:" + viewName);
		return viewName;
	}

	/* 판매자 상품 목록 */

	@RequestMapping(value = { "/productvip.do" }, method = RequestMethod.GET)
	private String productvip(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println("interceptor에서 온 viewName:" + viewName);
		return viewName;
	}

	/* 판매자 상품 등록 */

	@RequestMapping(value = { "/productform.do" }, method = RequestMethod.GET)
	private String productform(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println("interceptor에서 온 viewName:" + viewName);
		return viewName;
	}

	/* 상품등록 체크 */
	@RequestMapping(value = "/productcheck.do", method = RequestMethod.POST)
	private ModelAndView productcheck(@ModelAttribute("product") ProductVO product, RedirectAttributes rAttr,
			MultipartHttpServletRequest multipartRequest, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String user_Id = (String) session.getAttribute("user_Id");
		product.setUser_Id(user_Id);
		int result = 0;
		result = productService.addProduct(product);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("dealingmain.do");
		return mav;
	}

	/* 판매자 상품 상세 */

	@RequestMapping(value = { "/productview.do" }, method = RequestMethod.GET)
	private String productmod(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println("interceptor에서 온 viewName:" + viewName);
		return viewName;
	}

	/* 결제 */
	@RequestMapping("/order.do")
	public String order(Model model) {
		return "/common/order";
	}

}
