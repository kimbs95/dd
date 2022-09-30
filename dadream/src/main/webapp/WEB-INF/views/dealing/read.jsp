<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="article" value="${articleMap.article }" />
<c:set var="imageFileList" value="${articleMap.imageFileList }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기 페이지</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<style type="text/css">
	#readForm{
		font-weight:lighter;
		font-family: 'Jua', sans-serif;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
 <script type="text/javascript" >
	// 뒤로가기
	function backToList(obj) {
		obj.action="${contextPath}/inteboardlist.do";
		obj.submit();
	}
	$(document).ready(function(){
		var msg = "${msg}";
		if(msg != ""){
			alert(msg);
		}
	});
	
	function fn_remove_article(url,inte_Num){
	var form = document.createElement("form");
	form.setAttribute("method", "post");
	form.setAttribute("action", url);
 	var inte_NumInput = document.createElement("input");
 	inte_NumInput.setAttribute("type","hidden");
 	inte_NumInput.setAttribute("name","inte_Num");
 	inte_NumInput.setAttribute("value",inte_Num);
 	form.appendChild(inte_NumInput);
 	document.body.appendChild(form);
 	form.submit();
	alert("삭제하시겠습니까?");
}
	
	function readURL(input) {
		if(input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
</head>
<body>
	<section id="container">
	<form  name="readForm" method="post" action="${contextPath}/viewArticle.do" enctype="multipart/form-data">
		<input type="hidden" name="inte_Num" value="${boardContents.inte_Num }" />
		<table border=0 align="center" id="readForm">
			<tr>
				<td width=150 align="center" bgcolor="pink">글번호</td>
				<td> 
					<input type="text" value="${boardContents.inte_Num }" disabled />
					
				</td>
			</tr>
			<tr>
				<td width="150" align="center" bgcolor="pink">
				작성자
				</td>
				<td>
					<input type="text" value="${boardContents.user_Id }" name="user_Id" disabled />
				</td>
			</tr>
			<tr>
				<td width="150" align="center" bgcolor="pink">
					제목
				</td>
				<td>
					<input type="text" value="${boardContents.inte_Title }" name="inte_Title" disabled /></td>
			</tr>
			<tr>
				<td width="150" align="center" bgcolor="pink">
					내용
				</td>
				<td>
					<textarea rows="20" cols="60" value="${boardContents.inte_Text}" name="inte_Text" disabled>${boardContents.inte_Text } </textarea>
				</td>
			</tr>
			<tr>
				<td width="150" align="center" bgcolor="pink">
					조회수
				</td>
				<td>
					<input type="text" value="${boardContents.viewCounts }" name="viewCounts" disabled /></td>
			</tr>
			<!-- <c:if test="${not empty imageFileList && imageFileList != 'null' }">
				<c:forEach var="item" items="${imageFileList }" varStatus="status">
					<tr>
						<td width="150" align="center" bgcolor="pink" rowspan="2">
							이미지 ${status.count }
						</td>
						<td>
							<input type="hidden" name="originalFileName" value="${item.imageFileName }" />
							<img src="${contextPath }/download.do?articleNO=${article.articleNO}&imageFileName=${item.imageFileName}" id="preview" width=300 height=300 /> <br> 
						</td>
					</tr>
					<tr>
						<td>
							<input type="file" name="imageFileName" id="i_imageFileName" disabled onchange="readURL(this);" />
						</td>
					</tr>
				</c:forEach>
			</c:if>
			
			<c:choose>
				<c:when test="${not empty board.inte_Image && board.inte_Image != 'null' }">
					<tr>
						<td width="150" align="center" bgcolor="pink" rowspan="2">
							이미지
						</td>
						<td>
							<input type="hidden" name="inte_Image" value="${board.inte_Image }" />
							<img src="${contextPath }/download.do?inte_Num=${board.inte_Num}&inte_Image=${board.inte_Image}" id="preview" width=300 height=300 /> <br> 
						</td>
					</tr>
					<tr>
						<td>
							<input type="file" name="inte_Image" id="i_imageFileName" disabled onChange="readURL(this);" />
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr id="tr_file_upload">
						<td width="150" align="center" bgcolor="pink" rowspan="2">
							이미지
						</td>
						<td>
							<input type="hidden" name="inte_Image" value="${board.inte_Image }" />
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<img id="preview" /><br>
							<input type="file" name="inte_Image" id="i_imageFileName" disabled onchange="readURL(this);" />
						</td>
					</tr>
				</c:otherwise>
			</c:choose>  -->
			
			<tr>
				<td width="150" align="center" bgcolor="pink">
					등록일자
				</td>
				<td>
					<input type="text" value="<fmt:formatDate value='${boardContents.inte_Date}'/>" disabled />
				</td>
			</tr>
		</table>
			<div>
				<!-- <button type="submit" class="update_btn">수정</button> -->
				
				
				<a href="/board/update?inte_Num=${boardContents.inte_Num}" class="mod_btn" style="text-decoration: none;">수정</a>
				<!-- <button type="submit" class="delete_btn">삭제</button> -->
				<!-- <a href="javascript:void(0);" class="btn btn-danger" onclick="deleteConfirm();">삭제</a> -->
				<input type="button" value="삭제하기" onClick="fn_remove_article('${contextPath}/board/removeArticle.do','${boardContents.inte_Num}')">
				<!-- <button type="submit" class="list_btn">목록</button> -->
				
				<input type="button"  value="목록으로 이동"onClick="backToList(this.form)">
			</div>
		</section>
		
	</form>
	
</body>
</html>