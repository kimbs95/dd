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
    <title>게시판 글쓰기</title>
	<link rel="stylesheet" href="/css/addboard.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
 	 function readURL(input) {
	 	if (input.files && input.files[0]) {
	 	var reader = new FileReader();
	 	reader.onload = function (e) {
		 $('#preview').attr('src', e.target.result);
		 }
		 reader.readAsDataURL(input.files[0]);
		 }
	 } 
	 function backToList(obj){
	 	 obj.action="${contextPath}/inteboardlist.do";
		 obj.submit();
	 }
	 var cnt = 1;
	function fn_addFile(){
		$("#d_file").append("<br>" + "<input type='file' name='file" + cnt +"' />");
		cnt++;
	} 
	</script>
	
</head>
<body>
    <form action="${contextPath}/addinteboard.do" method="post" enctype="multipart/form-data">
		<table border="0" align="center">
			<tr>
				<td align="right"> 작성자: </td>
				<td colspan="2" align="left"><input type="text" size="20" maxlength="100" value="${member.user_Name }" name="user_Id" readonly  /></td>
			</tr>
			<tr>
				<td align="right">글제목: </td>
				<td colspan="2"><input type="text" size="67" maxlength="500" name="inte_Title" /></td>
			</tr>
			<tr>
				<td align="right" valign="top"><br>글내용: </td>
				<td colspan="2"><textarea rows="10" cols="65" maxlength="4000" name="inte_Text"></textarea>
				</td>
			</tr>
			<tr>
				<td align="right">파일첨부: </td>
				<td colspan="2"><input type="button" value="파일 추가" onClick="fn_addFile()"  name="inte_Image"/> </td>
				<td><div id="d_file"></div></td>
				<td><img id="preview" scr="#" width=200 height=200 aria-placeholder="미리보기"/></td>
			</tr>
			<tr>
                <tr>
                    <td align="right"></td>
                    <td colspan="2">
                        <input type="submit" value="등록하기" />
						<input type="button" value="목록보기" onClick="backToList(this.form)" />
                        </td>
                    </tr>
                </tr>
            </table>
        </form>
</body>
</html>