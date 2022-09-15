package com.dd.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("productController")
public class ProductControllerImpl implements ProductController {

	
	@RequestMapping(value ={"/", "/main.do"} ,method=RequestMethod.GET)
	private ModelAndView main(HttpServletRequest request , HttpServletResponse response)
		throws Exception{
		String viewName =(String)request.getAttribute("viewName");
		ModelAndView mav =new ModelAndView();
		mav.setViewName(viewName);
		System.out.println("interceptor에서 온 viewName:"+viewName);
		return mav;
	}

}
