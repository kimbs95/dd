<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	isELIgnored="false"%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 글쓰기</title>

	<!--CSS-->
	<link rel="stylesheet" href="/css/addnotice.css">
	
	<script src="/js/dealingJS/addnotice.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		function backToList(obj){
	 	 obj.action="${contextPath}/noticelist.do";
		 obj.submit();
	 }
	</script>
</head>
<body>
    <form action="${contextPath}/addnotice.do" method="post" enctype="multipart/form-data">
		<div id="notice_add_form">
			<select name="notice_Category" id="notice_Category">
				<option value="부동산">부동산</option>
				<option value="가구">가구</option>
			</select>
			<div id="writer_Title">
				<td align="right"> 작성자: </td>
				<td  colspan="2" align="left"><input type="text" id="Writer_Form" size="15" maxlength="100" value="${member.user_Name}" name="user_Id" readonly disabled/></td>
			
			<td align="right"> 제목: </td>
			<td colspan="2"><input type="text" size="30" maxlength="50" name="notice_Title" id="TitleForm" /></td>
			</div>
			<div id="notice_Context">
				<td align="right" valign="top">공지내용: </td>
				<td colspan="2"><textarea rows="10" cols="65" maxlength="4000" name="notice_Text"></textarea>
				</td>
			</div>
			<!-- <tr>
				<td align="right">파일첨부: </td>
				<td colspan="2"><input type="button" value="파일 추가" onClick="fn_addFile()"  name="inte_Image"/> </td>
				<td><div id="d_file"></div></td>
				<td><img id="preview" scr="#" width=200 height=200 aria-placeholder="미리보기"/></td>
			</tr> -->
			<tr>
                	<tr>
                   
                    	<td colspan="2">
                        <input type="submit" value="등록하기" id="addnotice_btn" />
						<input type="button" value="목록보기" onClick="backToList(this.form)" id="backlist_btn" />
                        </td>
                    </tr>
                </tr>
            </div>
        </form>
</body>
</html>