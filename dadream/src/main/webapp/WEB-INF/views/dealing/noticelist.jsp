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
  <!-- <link  rel="stylesheet" type="text/css"  href="https://cdn.datatables.net/v/dt/dt-1.11.4/r-2.2.9/datatables.min.css"/> -->

  <!-- css -->
  <link rel="stylesheet" href="/css/noticelist.css">

  <script src="/js/dealingJS/noticelist.js"></script>
</head>
<script  src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script  type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.11.4/r-2.2.9/datatables.min.js">


	
</script>
<body>
	<form action="${contextPath}/noticeform.do" method="get" id="noticeForm">
	<table id="noticeTable">
		<tr>
			<th  id="Category">카테고리</th>
			<th  id="notice_Num">글번호</th>
			<th  id="writer">작성자</th>
			<th  id="notice_Title">제목</th>
			<!-- <th style="border: 1px solid gray;">내용</th> -->
			<th  id="RegDate">작성일</th>
			<th  id="view">조회수</th>
		</tr>
			
		<tbody>
			<c:forEach var="i" items="${notic}">
				<tr id="foreach_tr">
					<!-- <td>${noticeTemp}</td> -->
					<td id="Cate_td">${i.notice_Category}</td>
					<td><c:out value="${i.notice_Num}"/></a></td>
					<td>${i.user_Id}</td>
					<td id="Title_td"><a href="/notice/read?notice_Num=${i.notice_Num}" id="a_none"><c:out value="${i.notice_Title}"/></a></td>
					<!-- <td>${i.notice_Text}</td> -->
					<td><fmt:formatDate value="${i.notice_Date}" pattern="yyyy-MM-dd"/></td>
					<td>${i.viewCnt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<!-- <button type="submit" ><a class="write-btn" href="javascript:fn_addnotice('${isLogOn }','${contextPath}/noticeform.do', '${contextPath }/login.do')" style="text-decoration: none;"><p class="cls2">등록</p></a></button> -->
			<button type="submit" id="notice_add_btn">등록하기</button>
	
</form>
</body>
</html>