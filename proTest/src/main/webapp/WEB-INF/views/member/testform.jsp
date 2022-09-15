<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<style>
	.no-underline{
		text-decoration:none;
	}
</style>
<head>
<meta charset="UTF-8">
<title>KBS회원정보조회</title>
<script scr="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" >
	function fn_find(url) {
		var form = document.createElement("form");
		form.setAttribute("method", "post");
		form.setAttribute("action", url);
	 	document.body.appendChild(form);
		form.submit();
	}
</script>
</head>
<body>
	<input type=button value="KBS회원정보조회" onclick="fn_find('${contextPath}/test9.do')"  />

</body>
</html>