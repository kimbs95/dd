<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
  request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="noticlesList" value="${noticlesMap.noticlesList }" />
<c:set var="totArticles" value="${articlesMap.totArticles }" />
<c:set var="section" value="${articlesMap.section }" />
<c:set var="pageNum" value="${articlesMap.pageNum }" /> 
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>공지사항 리스트</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
  <style>
	*{
		margin: 0 auto;
		
	}
	th{
		font-weight: bolder;
		font-size: large;
		padding: 8px 0 9px;
     	border-bottom: solid 1px #d2d2d2;
     	text-align: center;
      	line-height: 18px;
		  font-family: 'Jua', sans-serif;
	}
    .write-btn :hover{ color: burlywood;
    }
    .write-btn{
      margin-bottom: 2px;
	  width: fit-content;
    }
  </style>
</head>
<script
    src="https://code.jquery.com/jquery-3.6.0.js"
    integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
    crossorigin="anonymous"></script>
<link
    rel="stylesheet"
    type="text/css"
    href="https://cdn.datatables.net/v/dt/dt-1.11.4/r-2.2.9/datatables.min.css"/>
<script
    type="text/javascript"
    src="https://cdn.datatables.net/v/dt/dt-1.11.4/r-2.2.9/datatables.min.js"></script>
<script type="text/javascript">
	function fn_addnotice(isLogOn, addnotice, login) {
		if(isLogOn != '' && isLogOn != 'false') {
			location.href=addnotice;
			
		} else {
			alert("로그인 후 글쓰기가 가능합니다.")
			location.href=login + '?action=/login.do';
		}
	}
	$(document).ready(function(){
		var msg = "${msg}";

		if(msg !=""){
			alert(msg);
		}
	});
	function fn_search(){
		$("#listForm2").submit();
		return false;
	}
	$(document).ready( function () {
    $('#table_id').DataTable({
        responsive : {deatail:{ type: 'column',
                                target : 1}},
        ordering: false,
        language: {
            url: '/js/user/dataTables.ko.json'
        },
        lengthChange: true,
		info : false,
		searching:true,
		displayLength:10,
		
		
		
    });
	var table = $('#table_id').DataTable();
	if(! table.data().count()){
		alert('글이 없습니다. 새로운 글을 작성해주세요.');
	}else{
		return false;
	}
} );
</script>
<body>
	<form action="${contextPath}/noticelist.do" method="get" id="listForm2">
	<table align="center" border="0" width="960px">
		<tr height="20" align="center" bgcolor="pink" >
			<th style="border: 1px solid gray;">카테고리</th>
			<th style="border: 1px solid gray;">글번호</th>
			<th style="border: 1px solid gray;">작성자</th>
			<th style="border: 1px solid gray;">내용</th>
			<th style="border: 1px solid gray;">작성일</th>
			<th style="border: 1px solid gray;">조회수</th>
		</tr>
			
		<tbody>
		<c:forEach var="notice" items="${noticlesList}" varStatus="">
			
			<tr>
				<td>${notice.Notice_Category}</td>
				<td>${notice.Notice_Num}</td>
				<td>${notice.user_Id}</td>
				<td>${notice.Notice_Text}</td>
				<td><fmt:formatDate value="${notice.Notice_Date}" /></td>
				<td></td>
			</tr>
		
		</c:forEach>
	</tbody>
	</table>
	
	
	
	<!-- <div class="cls2">
		<c:if test="${totArticles != null }" >
			<c:choose>
				<c:when test="${totArticles > 5 }">
					<c:forEach var="page" begin="1" end="10" step="1">
						<c:if test="${section > 1 && page == 1 }">
							<a class="no-uline" href="${contextPath }/selectInteboardlist.do?section=${section-1} & pageNum = ${(section-1) * 10 + 1}">&nbsp; pre </a>
						</c:if>
						<a class="no-uline" href="${contextPath }/selectInteboardlist.do?section=${section} & pageNum = ${page }" > ${(section-1) * 10 + page}"> </a>
						<c:if test="${page == 10 }">
							<a class="no-uline" href="${contextPath }/selectInteboardlist.do?section=${section+1} & pageNum = ${section * 10 + 1}">&nbsp; next </a>
						</c:if>
					</c:forEach>
				</c:when>
				<c:when test="${totArticles == 100 }">
					<c:forEach var="page" begin="1" end="10" step="1">
						<a class="no-uline" href="#">${page}</a>
					</c:forEach>
				</c:when>
				
				<c:when test="${totArticles < 20 }"> 
					<c:forEach var="page" begin="1" end="${totArticles/10 + 1 }" step="1">
						<c:choose>
							<c:when test="${page == pageNum }">
								<a class="sel-page" href="${contextPath }/selectInteboardlist.do?section=${section }&pageNum=${page }">${page }</a>
							</c:when>
							<c:otherwise>
								<a class="no-uline" href="${contextPath }/selectInteboardlist.do?section=${section }&pageNum=${page }">${page }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:when>
			</c:choose>
		</c:if>
		
	</div> -->
	


	<br><br>
	<a class="write-btn" href="javascript:fn_addnotice('${isLogOn }','${contextPath}/board/create', '${contextPath }/login.do')"><p class="cls2">등록</p></a>
</form>
</body>
</html>