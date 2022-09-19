package com.dd.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("productController")
public class ProductControllerImpl implements ProductController {
	
	
	
	/* 사용자 가구 메인 */
	@RequestMapping(value ={"/productmain.do"} ,method=RequestMethod.GET)
	private ModelAndView productmain(HttpServletRequest request , HttpServletResponse response)
		throws Exception{
		String viewName =(String)request.getAttribute("viewName");
		ModelAndView mav =new ModelAndView();
		mav.setViewName(viewName);
		System.out.println("interceptor에서 온 viewName:"+viewName);
		return mav;
	}
	
	/* 판매자 가구 메인 */
	@RequestMapping(value ={"/productmainvip.do"} ,method=RequestMethod.GET)
	private ModelAndView productmainvip(HttpServletRequest request , HttpServletResponse response)
		throws Exception{
		String viewName =(String)request.getAttribute("viewName");
		ModelAndView mav =new ModelAndView();
		mav.setViewName(viewName);
		System.out.println("interceptor에서 온 viewName:"+viewName);
		return mav;
	}
	
	/* 상품목록 */
	@RequestMapping(value ={"/product.do"} ,method=RequestMethod.GET)
	private ModelAndView product(HttpServletRequest request , HttpServletResponse response)
		throws Exception{
		String viewName =(String)request.getAttribute("viewName");
		ModelAndView mav =new ModelAndView();
		mav.setViewName(viewName);
		System.out.println("interceptor에서 온 viewName:"+viewName);
		return mav;
	}
	
	/* 판매자 상품 목록 */
	
	@RequestMapping(value ={"/productvip.do"} ,method=RequestMethod.GET)
	private ModelAndView productvip(HttpServletRequest request , HttpServletResponse response)
		throws Exception{
		String viewName =(String)request.getAttribute("viewName");
		ModelAndView mav =new ModelAndView();
		mav.setViewName(viewName);
		System.out.println("interceptor에서 온 viewName:"+viewName);
		return mav;
	}

/* 판매자 상품 등록 */
	
	@RequestMapping(value ={"/productform.do"} ,method=RequestMethod.GET)
	private ModelAndView productform(HttpServletRequest request , HttpServletResponse response)
		throws Exception{
		String viewName =(String)request.getAttribute("viewName");
		ModelAndView mav =new ModelAndView();
		mav.setViewName(viewName);
		System.out.println("interceptor에서 온 viewName:"+viewName);
		return mav;
	}
	
	
/* 판매자 상품 상세 */
	
	@RequestMapping(value ={"/productview.do"} ,method=RequestMethod.GET)
	private ModelAndView productmod(HttpServletRequest request , HttpServletResponse response)
		throws Exception{
		String viewName =(String)request.getAttribute("viewName");
		ModelAndView mav =new ModelAndView();
		mav.setViewName(viewName);
		System.out.println("interceptor에서 온 viewName:"+viewName);
		return mav;
	}
	
	

}
