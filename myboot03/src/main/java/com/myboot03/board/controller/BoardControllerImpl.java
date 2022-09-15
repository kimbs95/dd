package com.myboot03.board.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myboot03.board.service.BoardService;
import com.myboot03.board.vo.ArticleVO;
import com.myboot03.member.vo.MemberVO;

@Controller("boardController")
public class BoardControllerImpl implements BoardController {
	private static final String ARTICLE_IMAGE_REPO ="C:\\board\\article_image";
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private ArticleVO articleVO;

	
	
	@Override
	@RequestMapping(value="/board/listArticles.do",method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listArticles(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName =(String)request.getAttribute("viewName");
		List articlesList =boardService.listArticles();
		ModelAndView mav =new ModelAndView(viewName);
		mav.addObject("articlesList",articlesList);
		System.out.println("artilcesList:"+articlesList);
		System.out.println("listArticle view :"+viewName);
		return mav;
	}

	
//	한 개 이미지 글쓰기
	
	@Override
	@RequestMapping(value="/board/addNewArticle.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String,Object> articleMap = new HashMap<String,Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}
		
		String imageFileName= upload(multipartRequest);
		HttpSession session =multipartRequest.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		System.out.println("session.getAttri :"+ memberVO);
		String id =memberVO.getId();
//		
//		int articleNO = boardService.selectNewArticleNO()
//		
		articleMap.put("parentNO", 0);
		articleMap.put("id", id);
		articleMap.put("imageFileName", imageFileName);
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders(); 
		responseHeaders.add("content-Type", "text/html;charset=utf-8");
		
		try {
			int articleNO = boardService.addNewArticle(articleMap);
			if(imageFileName !=null && imageFileName.length() != 0) {
				File srcFile = new 
				File(ARTICLE_IMAGE_REPO + "\\" + "temp" +"\\" + imageFileName);
				File desDir =new File(ARTICLE_IMAGE_REPO + "\\" +articleNO);
				FileUtils.moveFileToDirectory(srcFile,desDir,true);
			}
			message ="<script>";
			message += "alert('새글을 추가했습니다.');";
			message += "location.href='"+multipartRequest.getContextPath() +"/board/listArticles.do';";
			message +="</script>";
			resEnt =new ResponseEntity(message,responseHeaders,HttpStatus.CREATED);
		}catch(Exception e) {
			File srcFile= new File(ARTICLE_IMAGE_REPO + "\\" +"temp"+ "\\"+"imageFileName");
			srcFile.delete();
			
			message = "<script>";
			message += "alert('오류다 오류. 다시 시도해');";
			message +="location.href='"+multipartRequest.getContextPath() + "/board/articleForm.do';";
			message +="</script>";
			resEnt = new ResponseEntity(message,responseHeaders,HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
		
	}

//	한개 이미 업로드 하기 
	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception{
		String imageFileName= null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile =multipartRequest.getFile(fileName);
			imageFileName= mFile.getOriginalFilename();
			File file =new File(ARTICLE_IMAGE_REPO + "\\"+"temp"+"\\" +fileName);
			if(mFile.getSize() !=0) {
				if(!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\"+imageFileName));
				}
			}
		}
		return imageFileName;
	}
	
	
	
//	한개의 이미지 보여주기
	@Override
	@RequestMapping(value="/board/viewArticle.do",method= RequestMethod.GET)
	public ModelAndView viewArticle(@RequestParam("articleNO")int articleNO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName =(String)request.getAttribute("viewName");
		articleVO=boardService.viewArticle(articleNO);
		ModelAndView mav =new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("article",articleVO);
		return mav;
	}
	
	 
//	답글
	
//	@Override
//	@RequestMapping(value="/board/replyForm.do", method = {RequestMethod.GET, RequestMethod.POST})
//	public ModelAndView replyForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		String viewName = (String)request.getAttribute("viewName");
//		int parentNO = Integer.parseInt(request.getParameter("parentNO"));
//		HttpSession session = request.getSession();
//		MemberVO memberVO = (MemberVO)session.getAttribute("member");
//		session.setAttribute("parentNO", parentNO);
//		session.setAttribute("id", memberVO.getId());
//		ModelAndView mav = new ModelAndView(viewName);
//		return mav;
//	}
//	
	
	
	
	
	
//	한개의 이미지 수정가능
	@RequestMapping(value="/board/modArticle.do",method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity modArticle(MultipartHttpServletRequest multipartRequest,HttpServletResponse response)
		throws Exception{
		multipartRequest.setCharacterEncoding("UTF-8");
		Map<String,Object> articleMap =new HashMap<String,Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}
		String imageFileName=upload(multipartRequest);
//		
		HttpSession session =multipartRequest.getSession();
		MemberVO memberVO =(MemberVO) session.getAttribute("member");
		String id = memberVO.getId();
		System.out.println("id:" +id);
		articleMap.put("id", id);
		articleMap.put("imageFileName",imageFileName);
		String articleNO =(String)articleMap.get("articleNO");
		System.out.println("articleNO :"+articleNO);
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders =new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8");
//				
		try {
			boardService.modArticle(articleMap);
			if(imageFileName !=null && imageFileName.length() != 0) {
				File srcFile = new File(ARTICLE_IMAGE_REPO +"\\"+ "temp"+"\\"+imageFileName);
				File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + articleNO);
				FileUtils.moveFileToDirectory(srcFile,destDir,true);
				
				String originalFileName =(String)articleMap.get("originalFileName");
				File oldFile =new File(ARTICLE_IMAGE_REPO + "\\"+articleNO+"\\"+originalFileName);
				oldFile.delete();
			}
			message = "<script>";
			message +="alert('글 수정~');";
			message +="location.href='"+multipartRequest.getContextPath()+"/board/viewArticle.do?articleNO="+articleNO+"';";
			message +="</script>";
			resEnt = new ResponseEntity(message,responseHeaders,HttpStatus.CREATED);
		}catch(Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" +"temp" + "\\"+imageFileName);
			srcFile.delete();
			message ="<script>";
			message +="alert('오류 잖아  ㅡㅡ 다시 수정해');";
			message +="location.href='"+multipartRequest.getContextPath()+"/board/viewArticle.do?articleNO="+articleNO+"';";
			message +="</script>";
			resEnt =new ResponseEntity(message , responseHeaders,HttpStatus.CREATED);
		}
		return resEnt;
	}
	
	
//	글삭제
	@Override
	@RequestMapping(value="/board/removeArticle.do",method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity removeArticle(@RequestParam("articleNO") int articleNO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8");
		try {
			boardService.removeArticle(articleNO);
			File destDir = new File(ARTICLE_IMAGE_REPO +"\\" + articleNO);
			FileUtils.deleteDirectory(destDir);
			
			message="<script>";
			message += "alert('삭제 완료~');";
			message += "location.href='"+request.getContextPath() + "/board/listArticles.do';";
			message +="</script>";
			resEnt =new ResponseEntity(message , responseHeaders,HttpStatus.CREATED);
		}catch(Exception e) {
			message ="<script>";
			message +="alert('작업 하다 오류났네 .... 다시해보자');";
			message += "location.href='"+request.getContextPath()+"/board/listArticles.do';";
			message +="</script>";
			resEnt =new ResponseEntity(message , responseHeaders,HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	@RequestMapping(value="/board/*Form.do" , method= RequestMethod.GET)
	private ModelAndView form(HttpServletRequest request ,HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav =new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	
	
	
	//다중 이미지 답글
	
//	@Override
//	@RequestMapping(value = "/board/addReply.do", method = RequestMethod.POST)
//	@ResponseBody
//	public ResponseEntity addReply(MultipartHttpServletRequest multipartRequest,HttpServletRequest request, HttpServletResponse response) throws Exception {
//		multipartRequest.setCharacterEncoding("utf-8");
//		String imageFileName = null;
//
//		Map articleMap = new HashMap();
//		Enumeration enu = multipartRequest.getParameterNames();
//		while (enu.hasMoreElements()) {
//			String name = (String) enu.nextElement();
//			String value = multipartRequest.getParameter(name);
//			articleMap.put(name, value);
//		}
//
//		// 로그인 시 세션에 저장된 회원 정보에서 글쓴이 아이디를 얻어와서 Map에 저장합니다. HttpSession session =
//		 multipartRequest.getSession();
//		 HttpSession session = multipartRequest.getSession();
//		 MemberVO memberVO = (MemberVO)session.getAttribute("member");
//		 int parentNO = (Integer) session.getAttribute("parentNO");
//		 String id = memberVO.getId();
//		 articleMap.put("id", id);
//		 articleMap.put("parentNO", parentNO);
//
//
//		List<String> fileList = upload(multipartRequest);
//		List<ImageVO> imageFileList = new ArrayList<ImageVO>();
//		if (fileList != null && fileList.size() != 0) {
//			for (String fileName : fileList) {
//				ImageVO imageVO = new ImageVO();
//				imageVO.setImageFileName(fileName);
//				imageFileList.add(imageVO);
//			}
//			articleMap.put("imageFileList", imageFileList);
//		}
//		String message;
//		ResponseEntity resEnt = null;
//		HttpHeaders responseHeaders = new HttpHeaders();
//		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
//		try {
//			int articleNO = boardService.replyArticle(articleMap);
//			if (imageFileList != null && imageFileList.size() != 0) {
//				for (ImageVO imageVO : imageFileList) {
//					imageFileName = imageVO.getImageFileName();
//					File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
//					File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + articleNO);
//					// destDir.mkdirs();
//					FileUtils.moveFileToDirectory(srcFile, destDir, true);
//				}
//			}
//
//			message = "<script>";
//			message += " alert('답글을 추가했습니다.');";
//			message += " location.href='" + multipartRequest.getContextPath() + "/board/listArticles.do'; ";
//			message += " </script>";
//			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
//		} catch (Exception e) {
//			if (imageFileList != null && imageFileList.size() != 0) {
//				for (ImageVO imageVO : imageFileList) {
//					imageFileName = imageVO.getImageFileName();
//					File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
//					srcFile.delete();
//				}
//			}
//
//			message = "<script>";
//			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');";
//			message += " location.href='" + multipartRequest.getContextPath() + "/board/replyForm.do'; ";
//			message += " </script>";
//			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
//			e.printStackTrace();
//		}
//		return resEnt;
//	}
//	
	

}
