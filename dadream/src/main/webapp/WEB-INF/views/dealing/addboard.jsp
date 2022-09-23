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
</head>
<body>
    <form action="${contextPath}/addinteboard.do" method="post" enctype="multipart/form-data">
		<table border="0" align="center">
			<tr>
				<td align="right"> 작성자 </td>
				<td colspan="2" align="left"><input type="text" size="20" maxlength="100" value="${member.user_Name }" name="user_Id" readonly /></td>
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
			<!-- <tr>
				<td align="right">이미지파일 첨부: </td>
				<td colspan="2"><input type="button" value="파일 추가" onClick="fn_addFile()" /> </td>
				<td><div id="d_file"></div></td>
				 <td><img id="preview" scr="#" width=200 height=200 /></td> -->
			</tr>
			<tr>
                <tr>
                    <td align="right"></td>
                    <td colspan="2">
                        <input type="submit" value="등록하기" />
                        </td>
                    </tr>
                </tr>
            </table>
        </form>
</body>
</html>