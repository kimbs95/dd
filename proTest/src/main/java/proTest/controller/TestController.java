package proTest.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import proTest.service.TestService;
import proTest.vo.TestVO;

@Controller("testController")
public class TestController {

	@Autowired
	private TestService testService;
	@Autowired
	private TestVO testVO ;
	
	@RequestMapping(value ="/testform.do" ,method=RequestMethod.GET)
	private ModelAndView main(HttpServletRequest request , HttpServletResponse response)
		throws Exception{
//		String viewName =(String)request.getAttribute("viewName");
		ModelAndView mav =new ModelAndView();
		mav.setViewName("member/testform");
		return mav;
	}
	
	@RequestMapping(value="/test9.do" ,method = RequestMethod.POST)
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		List membersList = testService.listMembers();
//		ModelAndView mav = new ModelAndView(viewName);
		ModelAndView mav = new ModelAndView("member/listtest");
		mav.addObject("membersList", membersList);
		return mav;
	}
	
	
	@RequestMapping(value = "/member/*Form.do", method =  RequestMethod.GET)
	private ModelAndView form(@RequestParam(value= "result", required=false) String result,
						       HttpServletRequest request, 
						       HttpServletResponse response) throws Exception {
		//String viewName = getViewName(request);
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName(viewName);
		return mav;
	}
}
