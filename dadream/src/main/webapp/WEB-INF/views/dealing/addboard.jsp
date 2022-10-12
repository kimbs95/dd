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
	<script src="http://code.jquery.com/jquery-latest.js"></script>

	<!--구글폰트-->
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

    <!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	
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
	

// if($("#board_writer").val() == ""){
//   	alert("작성자를 입력해주세요");
// 	$("#board_writer").focus();
// 	return false;
//   }
function _onSubmit(){

if($("#inte_Title").val() == ""){
  	alert("제목을 입력해주세요");
	$("#inte_Title").focus();
	return false;
  }

if($("#inte_Text").val() == ""){
  	alert("내용을 입력해주세요");
	$("#inte_Text").focus();
	return false;
  }

if(!confirm("등록하시겠습니까?")){
return false;
}
}
 
	</script>
	<style>
		#addboardform > div {
			margin-bottom: 8px;
			font-weight:lighter;
			font-family: 'Jua', sans-serif;
			display:table-caption;
		}
	</style>
	
</head>
<body>
    <form action="${contextPath}/addinteboard.do" method="post" enctype="multipart/form-data"  onsubmit="return _onSubmit();">
		<div id="addboardform">
			<div style="display: inherit;">
				<td align="right">작성자:&nbsp;&nbsp; </td>
				<input type="text" size="20" maxlength="100" value="${member.user_Id }" name="user_Id" readonly disabled />
			</div>
				
			
			
			<div>
				<td align="right">제목:&nbsp;&nbsp; </td>
				<td colspan="2"><input type="text" size="63" maxlength="100" name="inte_Title" id="inte_Title" /></td>
			
			</div>
				
			
			<div>
				<td align="right" valign="top">내용:&nbsp;&nbsp; </td>
				<td colspan="2"><textarea rows="10" cols="65" maxlength="5000" name="inte_Text" id="inte_Text"></textarea>
				</td>
			</div>	
				
			
			<div style="display: inline-grid;">
				<td>
					<div class="inteImg">
						<div class="inteMain">
							<label for="inteboard_Image" style="margin-bottom: 5px;">
								<p style="font-weight: bold;">대표이미지를 선택해주세요.</p></label><br>
							<img id="preview" src="" width=250 height=250 />
							<input type="file" id="inteboard_Image" name="inte_Image" accept="image/*" multiple>
							<h1 class="imgh2"></h1>
						</div>
					</div>
				</td>
				
			
                
                    <td align="right"></td>
                    <td colspan="2">
                        <input type="submit" value="등록하기" />
						<input type="button" value="목록보기" onClick="backToList(this.form)"/>
                        </td>
                	</div>	
				</div>	
			
        </form>
		<script>
			// 썸네일 코드 
			document.addEventListener('DOMContentLoaded', () => {
				document.querySelector("#inteboard_Image").addEventListener("change", async e => {
					const preview = document.querySelector("#preview");
					document.querySelector(".imgh2").innerHTML = "!!";
					let reader = new FileReader();
					reader.onloadend = finished => {
						preview.setAttribute('src', finished.target.result);
						console.log(finished.target.result);
					}
					reader.readAsDataURL(e.target.files.item(0));
				})
	
				// // 등록 버튼 누를시 
				// document.querySelector("#productsubmit").addEventListener("click", async () => {
	
	
	
				// })
			});
		</script>
</body>
</html>