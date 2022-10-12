<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
  request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="articlesList" value="${articlesMap.articlesList }" />
<c:set var="totArticles" value="${articlesMap.totArticles }" />
<c:set var="section" value="${articlesMap.section }" />
<c:set var="pageNum" value="${articlesMap.pageNum }" />
<c:url var="inteboardlistURL" value="/dealing/inteboardlist"></c:url>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <!--구글폰트-->
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
  <style>
	*{
		
		margin: 0 auto;
		font-weight:lighter;
		font-family: 'Jua', sans-serif;

	}
	
	th{
		font-weight: bolder;
		font-size: large;
		padding: 8px 0 9px;
     	border-bottom: solid 1px #d2d2d2;
     	text-align: center;
      	line-height: 18px;
		

	}
	td {
		text-align: center;
		border-bottom: 1px solid rgb(187, 187, 171);
		
	}
	
   	.write_btn{
		background-color: wheat;

	}
	.write-btn:hover{
		color: rgb(248, 14, 14);
	}
    
	#table_id tbody tr:hover{
		background-color: gainsboro;

	}
	#listForm{
		width: 960px;
		height: auto;
	}
	#table_id_wrapper{
		font-family: 'Jua', sans-serif;
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

<script>
	function fn_addboard(isLogOn, addboard, login) {
		if(isLogOn != '' && isLogOn != 'false') {
			location.href=addboard;
			
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
		$("#listForm").submit();
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
	// let table = $('#table_id').DataTable();
	// if(! table.data().count()){
	// 	alert('글이 없습니다. 새로운 글을 작성해주세요.');
	// }else{
	// 	return false;
	// }
} );
 

</script>

<body>
	
	<form action="${contextPath}/inteboardlist.do" method="get" id="listForm">
		
	<table id="table_id" style="text-align: center;" border="0" width="960px" cellspacing="0">
		<thead>
		<tr height="20" bgcolor="pink" style="text-align:center;" >
			<th style="border: 1px solid gray;">글번호</th>
			<th style="border: 1px solid gray;">작성자</th>
			<th style="border: 1px solid gray;">제목</th>
			<th style="border: 1px solid gray;">작성일</th>
			<th style="border: 1px solid gray;">조회수</th>
		</tr>
		</thead>
	<tbody>
		<c:forEach var="board" items="${inteboardlist}" varStatus="boardNum">
			<tr>
				<td>${board.inte_Num}</td>
				<!--<td>${boardNum.count}</td>은 게시글1번을 삭제하면 2번이 1번으로-->
				<td>${board.user_Id}</td>
				<td><a href="/board/read?inte_Num=${board.inte_Num}">
					<c:out value="${board.inte_Title}" /></a></td>
				<td><fmt:formatDate value="${board.inte_Date}" /></td>
				<td>${board.viewCounts}</td>
				
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
	
	<button type="button" class="write_btn"><a class="write-btn" href="javascript:fn_addboard('${isLogOn }','${contextPath }/inteboardform.do', '${contextPath }/login.do')"  style="text-decoration: none;">글 작성</a></button>
	
	<!-- <div class="card-header py-3">
		<input type="text" id="searchKeyword" name="searchKeyword" value="${boardVO.searchKeyword}" style="width: 250px; height: 30px;" placeholder="검색어를 입력하세요."/>
		<a href="#" onclick="fn_search();" class="btn btn-primary">검색</a>
	</div> -->
		
	
    
</form>
</body>
</html>