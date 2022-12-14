package com.myboot02;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DemoController {

	@ResponseBody
	@RequestMapping("/")
	public String home() {
		System.out.println("Hello Boot!!");
		return "Hello Boot@@";
	}
	
	@RequestMapping("/hello.do")
	public String hello(Model model) {
		System.out.println("???????????????");
		model.addAttribute("message","hello.html ?????????~");
		return "hello";
	}
	
	@RequestMapping("/kbs.do")
	public String kbs(Model model) {
		System.out.println("kbs spring");
		model.addAttribute("message","kbs.html?????????");
		return "kbs";
	}
}
