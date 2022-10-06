<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
  request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="noticlesList" value="${noticeMap.noticlesList }" />
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
	}
	
   	
    .write-btn :hover{ color: burlywood;
    }
    .write-btn{
      margin-bottom: 2px;
	  width: fit-content;
    }
	
	
	
	
  </style>
</head>
<script>
	function fn_addnotice(isLogOn, addboard, login) {
		if(isLogOn != '' && isLogOn != 'false') {
			location.href=addboard;
			
		} else {
			alert("로그인 후 글쓰기가 가능합니다.")
			location.href=login + '?action=/login.do';
		}
	}
</script>
<body>
	<table align="center" border="0" width="960px">
		<tr height="20" align="center" bgcolor="pink" >
			<th style="border: 1px solid gray;">글번호</th>
			<th style="border: 1px solid gray;">작성자</th>
			<th style="border: 1px solid gray;">내용</th>
			<th style="border: 1px solid gray;">작성일</th>
			<th style="border: 1px solid gray;">조회수</th>
		</tr>
			
	
		<c:forEach var="notice" items="${noticlesList}">
			<tr>
				<td>${notice.Notice_Num}</td>
				<td>${notice.user_Id}</td>
				<td>${notice.Notice_Title}</td>
				<td><fmt:formatDate value="${notice.Notice_Date}" /></td>
				<td></td>
			</tr>
		</c:forEach>
	
	</table>
	
	
	
	<div class="cls2">
		<c:if test="${totArticles != null }" >
			<c:choose>
				<c:when test="${totArticles > 5 }"> <!-- 글 개수가 100 초과인경우 -->
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
				<c:when test="${totArticles == 100 }"> <!-- 등록된 글 개수가 100개인 경우 -->
					<c:forEach var="page" begin="1" end="10" step="1">
						<a class="no-uline" href="#">${page}</a>
					</c:forEach>
				</c:when>
				
				<c:when test="${totArticles < 20 }">  <!-- 등록된 글 개수가 100개 미만인 경우 -->
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
		
	</div>
	


	<br><br>
	<a class="write-btn" href="javascript:fn_addnotice('${isLogOn }','${contextPath }/noticeform.do', '${contextPath }/login.do')"><p class="cls2">글쓰기</p></a>
</body>
</html>