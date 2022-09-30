package com.dd.product.controller;

import java.io.File;
import java.security.MessageDigest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.dd.dealing.vo.MemberVO;
import com.dd.product.service.ProductService;
import com.dd.product.vo.CartVO;
import com.dd.product.vo.ProductVO;

@Controller("productController")
public class ProductControllerImpl implements ProductController {
	private static final String PRODUCT_IMAGE_REPO = "C:\\spring\\KBS\\dadream\\src\\main\\resources\\static\\product";

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

	/* 상품목록 */
	@RequestMapping(value = { "/product.do" }, method = RequestMethod.GET)
	private ModelAndView product(@ModelAttribute ProductVO product, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		String product_Name = (String) product.getProduct_Name();
		System.out.println("product_Name :" + product_Name);

		List<ProductVO> productsList = productService.listProducts(product_Name);
		ModelAndView mav = new ModelAndView(viewName);
//		mav.setViewName(viewName);
		mav.addObject("productsList", productsList);
		return mav;
	}

	/* 판매자 상품 등록 창 */

	@RequestMapping(value = { "/productform.do" }, method = { RequestMethod.POST })
	private String productform(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println("interceptor에서 온 viewName:" + viewName);
		return viewName;
	}

	/* 상품등록 */
	@RequestMapping(value = "/productpost.do", method = RequestMethod.POST)
	@ResponseBody
	private Map<String, Object> productpost(ProductVO product, MultipartHttpServletRequest request,
			HttpServletResponse response) {
		List<MultipartFile> fileList = request.getFiles("file");
		Map<String, Object> productMap = new HashMap<String, Object>();

		StringBuffer saveName = new StringBuffer();
		String fileName = null;
		int length = 0;

		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			int count = 0;

			for (MultipartFile file : fileList) {
				length += file.getSize();
				md.update((Long.toString(System.currentTimeMillis()) + Double.toString(Math.random())).getBytes());
				for (byte a : md.digest()) {
					saveName.append(Integer.toString((a & 0xff) + 0x100, 16).substring(1));
				}
				fileName = saveName.toString().substring(16) + "."
						+ FilenameUtils.getExtension(file.getOriginalFilename());
				File saveFile = new File(PRODUCT_IMAGE_REPO, fileName);
				file.transferTo(saveFile);
				saveName.delete(0, saveName.length());
			}

			product.setProduct_Image(fileName);
			HttpSession session = request.getSession();
			MemberVO member = (MemberVO) session.getAttribute("member");
			String user_Id = member.getUser_Id();
			product.setUser_Id(user_Id);
			System.out.println(product);
			productService.addProduct(product);
		} catch (Exception e) {
			e.printStackTrace();
		}
		;
		response.setHeader("state", "success");
		response.setContentLength(length);
		response.setContentType("application/json");
		return productMap;
	}

	/* 판매자 상품 상세 */

	@RequestMapping(value = { "/productview.do" }, method = RequestMethod.GET)
	private String productmod(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println("interceptor에서 온 viewName:" + viewName);
		String product_Num = (String) request.getParameter("product_Num");
		System.out.println("product_Num :" + product_Num);
		model.addAttribute("product_Num", product_Num);

		return viewName;
	}

	/* 결제 */
	@RequestMapping("/order.do")
	public String order(Model model) {
		return "/common/order";
	}

	/* 장바구니 등록 */
	@ResponseBody
	@RequestMapping(value = "/cart.do", method = RequestMethod.POST)
	public Map<String, Object> cartpost(@RequestBody Map<String, Object> body, CartVO cartVO,
			HttpServletRequest request) {

		System.out.println("cart들어왔다");

		int result = 0;

		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		String user_Id = member.getUser_Id();

		body.put("user_Id", user_Id);
		System.out.println(body);
		result = productService.cart(body);
		Map<String, Object> cart = new HashMap<String, Object>();
		cart.put("result", result);

		return cart;
	}

	/* 장바구니 창 */
	@RequestMapping("/cartweb.do")
	public ModelAndView cart(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		String user_Id = member.getUser_Id();
		List<CartVO> info = productService.cartlist(user_Id);
//		info = productService.cartlist(user_Id);

		System.out.println("info :" + info);
		ModelAndView mav = new ModelAndView("/product/cart");
		mav.addObject("info", info);
		return mav;
	}

}
