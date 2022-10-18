<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- <c:set var="member" value="${member.user_Id}"/> -->
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
<!-- css -->
<link rel="stylesheet" href="/css/boardview.css">
<!--JS-->
<script src="/js/dealingJS/boardview.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script>
	$(document).ready(function(){
		var msg = "${msg}";
		if(msg != ""){
			alert(msg);
		}
	});
	function backToList(obj) {
		obj.action="${contextPath}/inteboardlist.do";
		obj.submit();
	}
</script>
</head>
<body>
	<section id="container">
	<form  id="readForm" method="post" action="${contextPath}/board/update" enctype="multipart/form-data">
		<input type="hidden" name="inte_Num" value="${boardContents.inte_Num }" />
			<div id="viewboardform">

				<!-- <div id="Number">
				<td align="right" bgcolor="pink">글번호&nbsp;&nbsp;</td>
					<input type="text" id="inputNumber" value="${boardContents.inte_Num }" disabled />	
				
				</div> -->

			<div id="writerName">
				<td align="center" bgcolor="pink">작성자</td>
				<td>
					<input type="text" value="${boardContents.user_Id }" name="user_Id" disabled />
				</td>
			</div>

			<div >
				<td align="right" bgcolor="pink">제목&nbsp;&nbsp; </td>
				<td colspan="2">
					<input type="text" size="63" maxlength="100" value="${boardContents.inte_Title }" name="inte_Title" disabled /></td>
			</div>

			<div >
					<div>
						<td align="rigth" valign="top">내용&nbsp;&nbsp; </td>
					<td><textarea rows="20" cols="65" value="${boardContents.inte_Text}" name="inte_Text" disabled>${boardContents.inte_Text } </textarea>
					</td>
					</div>
			</div>
			
			<div>
				<!-- <td>조회수</td> -->
				<td>
					<input id="viewCount" type="hidden" value="${boardContents.viewCounts }" name="viewCounts" disabled />
				</td>
			</div>
			<div class="inteImg">
			<div class="inteMain">
                    <img src="/board/${boardContents.user_Id}/${boardContents.inte_Image}" width="250" height="250">
			</div>
		</div>
			<!---------------------------------------------------------------------------------------------------------------->
			
			<div id="regDate">
				<td width="150" align="center" bgcolor="pink">
					등록일자
				</td>
			</div>
				<td>
					<input type="text" value="<fmt:formatDate value='${boardContents.inte_Date}'/>" disabled />
				</td>

			<div id="readbtn">	
					<c:if test="${user_Id == boardContents.user_Id}">
				<button id="updatebtn"><a href="/board/update?inte_Num=${boardContents.inte_Num}" class="mod_btn">수정</a></button>
			
				<!-- <button type="submit" class="delete_btn">삭제</button> -->
				<!-- <a href="javascript:void(0);" class="btn btn-danger" onclick="deleteConfirm();">삭제</a> -->
				<input id="delete"type="button" value="삭제하기" onClick="fn_remove_article('${contextPath}/board/removeArticle.do','${boardContents.inte_Num}')">
				<!-- <button type="submit" class="list_btn">목록</button> -->
			</c:if>
				<input id="backList" type="button"  value="목록으로 이동"onClick="backToList(this.form)">
			</div>
		</section>
	</div>
	</form>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script>
$(function(){
    
 
    //댓글쓰기 버튼 (버튼을 눌러서 id값이 넘어와서 실행되는 자바스크립트 구문)
    listReply();
 
        
    $("#btnReply").click(function(){
        
    var reply_context = $("#reply_context").val();    //댓글의 내용
    var user_Id =  "${user_Id}";
    var params = {"reply_context" : reply_context, "user_Id" : user_Id};
    
    
    $.ajax({
        type: "post", //데이터를 보낼 방식
        url: "reply_insert.do", //데이터를 보낼 url
        data: params, //보낼 데이터
    
        
        success: function(data){//데이터를 보내는 것이 성공했을 시 출력되는 메시지
            alert("댓글이 등록되었습니다.");
            listReply2();
                }
            });
        });
    
    
 
    
//댓글 목록을 출력하는 함수
function listReply(){
    $.ajax({
        type: "get",    //get방식으로 자료를 전달
        url: "reply_list.do?user_Id=${user_Id}&curPage=${curPage}&search_option=${search_option}&keyword=${keyword}",    //컨트롤러에 있는 list.do로 맵핑되고 게시글 번호도 같이 보낸다.
        success: function(result){    //자료를 보내는것이 성공했을때 출력되는 메시지
            
            //댓글목록을 실행한 결과를 가져온다.
        $("#listReply").html(result);
            }
        });
}
 
 
 
 
function listReply2(){
    $.ajax({
        type: "get",
        contentType: "application/json",
        url: "reply_list_json.do?user_Id=${user_Id}",
        success: function(result){
            console.log(result);
            var output="<table>";
            for(var i in result){
                var repl=result[i].reply_context;
                repl = repl.replace(/  /gi,"&nbsp;&nbsp;");//공백처리
                repl = repl.replace(/</gi,"&lt;"); //태그문자 처리
                repl = repl.replace(/>/gi,"&gt;");
                repl = repl.replace(/\n/gi,"<br>"); //줄바꿈 처리
                
                output += "<tr><td>"+result[i].name;
                date = changeDate(result[i].regDate);
                output += "("+date+")";
                output += "<br>"+repl+"</td></tr>";
            }
                output+="</table>";
                $("#listReply").html(output);
        }
    });
}
    
    
});
 
 
</script>
	  
		<textarea rows="5" cols="80" id="reply_context" name="reply_context"></textarea>
		<br>
		
		<button type="submit" id="btnReply">댓글쓰기</button>
	

	<div id="listReply">
		<c:if test="${not empty map.list}">
			<table border="1" width="300" align="left">
				<c:forEach var="row" items="${map.list}">
					<tr>
						<td><br><br>
						닉네임: ${row.user_Id} 작성일: ${row.regDate} 댓글번호: ${row.reply_Num}<br><br>
						댓글내용:${row.reply_context}
						<form action="${contextPath}/board/reply_insert.do" id="form1" method="post">
							<input type="hidden" id="reply_Num" name="reply_Num" value="${row.reply_Num}">
							<input type="hidden" id="user_Id" name="user_Id" value="${row.user_Id}">
							
							<div>
								<textarea id="reply_context" name="reply_context" rows="3" cols="80"></textarea>
							</div>
							
							<div>
								<!-- <c:if test="${member.user_Id == row.user_Id}"> -->
									<button type="button" id="btn_reply_Update">댓글수정</button>
									<button type="button" id="btn_reply_Delete">댓글 삭제</button>
									<!-- </c:if> -->
								</div>
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>
</body>
</html>