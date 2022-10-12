package com.dd.product.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.client.ResponseErrorHandler;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.dd.dealing.vo.MemberVO;
import com.dd.product.service.ProductService;
import com.dd.product.vo.CartVO;
import com.dd.product.vo.ProductVO;
import com.dd.product.vo.ReviewVO;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

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

	/* 상품 글 등록 */
	@RequestMapping(value = "/productpost.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity productpost(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> productMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
//			System.out.println(name);
			String value = multipartRequest.getParameter(name);
//			System.out.println(value);
			productMap.put(name, value);
		}

		String imageFileName = upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String user_Id = memberVO.getUser_Id();
		System.out.println("이미지 파일 이름 : " + imageFileName);
		productMap.put("user_Id", user_Id);
		productMap.put("product_Views", 1);
		productMap.put("product_Image", imageFileName);
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("content-Type", "text/html;charset=utf-8");

		try {
			int result = productService.addProduct(productMap);
//			if (imageFileName != null && imageFileName.length() != 0) {
//				File srcFile = new File(PRODUCT_IMAGE_REPO + "\\" + imageFileName);
//				File desDir = new File(PRODUCT_IMAGE_REPO);
//			중간에 폴더 없으면 만들어주는 함수 moveFileToDirectory
//				FileUtils.moveFileToDirectory(srcFile, desDir, true);
//			}
			message = "<script>";
			message += "alert('상품등록이 완료되었습니다.');";
			message += "location.href='" + multipartRequest.getContextPath() + "/productmain.do'";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(PRODUCT_IMAGE_REPO + "\\" + "imageFileName");
			srcFile.delete();

			message = "<script>";
			message += "alert('다시 시도 하세요');";
//			message += "location.href='" + multipartRequest.getContextPath() + "location.reload();'";
			message += "";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;

	}

//	이미지 업로드
	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		String imageFileName = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String user_Id = memberVO.getUser_Id();
		int count = 0;
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			imageFileName = mFile.getOriginalFilename();
			File file = new File(PRODUCT_IMAGE_REPO + "\\" + user_Id + "\\" + imageFileName);
			if (mFile.getSize() != 0) {
				if (!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(PRODUCT_IMAGE_REPO + "\\" + user_Id + "\\" + imageFileName));
				}
			}
		}
		return imageFileName;
	}

	/* 판매자 상품 상세 */

	@RequestMapping(value = { "/productview.do" }, method = RequestMethod.GET)
	private String productmod(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println("interceptor에서 온 viewName:" + viewName);
		String product_Num = (String) request.getParameter("product_Num");
		int product_Nums = Integer.parseInt(product_Num);
		System.out.println("product_Nums :" + product_Nums);
		productService.viewCount(product_Nums);// 조회수
		ProductVO result = productService.productinfo(product_Nums);
		model.addAttribute("product_Num", product_Num);
		model.addAttribute("result", result);

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
		body.put("cart_BuytCount", 1);
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
		List<CartVO> info = new ArrayList();
//		Map<String, Object> info = new HashMap<>();
		info = productService.cartlist(user_Id);
		System.out.println("info :" + info);
		ModelAndView mav = new ModelAndView("/cartweb");
		mav.addObject("info", info);
		return mav;
	}

//	장바구니 삭제
	@ResponseBody
	@RequestMapping(value = "/cartdelete.do", method = RequestMethod.POST)
	public Map<String, Object> cartdelete(@RequestBody int body, HttpServletRequest request) {

		int result = 0;
		result = productService.cartdelete(body);
		System.out.println("cartbody :" + body);
		Map<String, Object> map = new HashMap<>();
		map.put("result", result);
		return map;
	}

//	리뷰
	@RequestMapping(value = "/reviewform.do", method = { RequestMethod.GET, RequestMethod.POST })
	private String reviewform(HttpServletRequest req) {
//		String viewName = (String) req.getAttribute("viewName");
		return "/product/reviewform";
	}

//	리뷰등록
	@RequestMapping(value = "/reviewpost.do", method = { RequestMethod.POST })
	private Map<String, Object> review(@RequestBody Map<String, Object> body, ReviewVO review, HttpServletRequest req) {
		int result = 0;
		HttpSession session = req.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		String user_Id = (String) member.getUser_Id();
		body.put("user_Id", user_Id);
		body.put("product_Num", 6);
		result = productService.reviewpost(body);
		Map<String, Object> response = new HashMap<>();
		response.put("result", result);
		return response;
	}

//	토스페이

	private final RestTemplate restTemplate = new RestTemplate();

	private final ObjectMapper objectMapper = new ObjectMapper();

	@PostConstruct
	private void init() {
		restTemplate.setErrorHandler(new ResponseErrorHandler() {
			@Override
			public boolean hasError(ClientHttpResponse response) {
				return false;
			}

			@Override
			public void handleError(ClientHttpResponse response) {
			}
		});
	}

	private final String SECRET_KEY = "test_sk_ADpexMgkW36gQY4pQkdVGbR5ozO0";

	@RequestMapping(value = "/success.do", method = RequestMethod.GET)
	public String confirmPayment(@RequestParam String paymentKey, @RequestParam String orderId,
			@RequestParam Long amount, Model model) throws Exception {

		HttpHeaders headers = new HttpHeaders();
		// headers.setBasicAuth(SECRET_KEY, ""); // spring framework 5.2 이상 버전에서 지원
		headers.set("Authorization", "Basic "
				+ Base64.getEncoder().encodeToString(("test_sk_ADpexMgkW36gQY4pQkdVGbR5ozO0" + ":").getBytes()));
//		headers.set("Authorization", "Basic " + Base64.getEncoder().encodeToString((SECRET_KEY + ":").getBytes()));
		headers.setContentType(MediaType.APPLICATION_JSON);

		String product_Name = orderId;
		Map<String, String> payloadMap = new HashMap<>();
		payloadMap.put("orderId", orderId);
		payloadMap.put("amount", String.valueOf(amount));

		HttpEntity<String> request = new HttpEntity<>(objectMapper.writeValueAsString(payloadMap), headers);

		ResponseEntity<JsonNode> responseEntity = restTemplate
				.postForEntity("https://api.tosspayments.com/v1/payments/" + paymentKey, request, JsonNode.class);

		if (responseEntity.getStatusCode() == HttpStatus.OK) {
			JsonNode successNode = responseEntity.getBody();
			model.addAttribute("orderId", successNode.get("orderId").asText());
			String secret = successNode.get("secret").asText(); // 가상계좌의 경우 입금 callback 검증을 위해서 secret을 저장하기를 권장함
			return "success";
		} else {
			JsonNode failNode = responseEntity.getBody();
			model.addAttribute("message", failNode.get("message").asText());
			model.addAttribute("code", failNode.get("code").asText());
			return "fail";
		}
	}

	@RequestMapping(value = "/fail.do", method = RequestMethod.POST)
	public String failPayment(@RequestParam String message, @RequestParam String code, Model model) {
		model.addAttribute("message", message);
		model.addAttribute("code", code);
		return "fail";
	}

	@RequestMapping(value = "/virtual-account/callback.do", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void handleVirtualAccountCallback(@RequestBody CallbackPayload payload) {
		if (payload.getStatus().equals("DONE")) {
			// handle deposit result
		}
	}

	public static class CallbackPayload {
		public CallbackPayload() {
		}

		private String secret;
		private String status;
		private String orderId;

		public String getSecret() {
			return secret;
		}

		public void setSecret(String secret) {
			this.secret = secret;
		}

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

		public String getOrderId() {
			return orderId;
		}

		public void setOrderId(String orderId) {
			this.orderId = orderId;
		}
	}

}
