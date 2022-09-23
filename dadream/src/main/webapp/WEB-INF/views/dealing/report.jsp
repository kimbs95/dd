<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
    <title>신고하기</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        #rp_Title {
            display: flex;
            margin-top: 40px;
            margin-left: 10px;

        }

        #rp_Title input {
            width: 400px;
        }

        #rp_Content {
            display: flex;
            margin-top: 40px;
            margin-left: 10px;
        }

        #rp_Content textarea {
            width: 400px;
            height: 300px;
            display: inline;
        }

        #rpBtn{
            text-align: right;
            margin-top: 40px;
            margin-right: 20px;
        }
    </style>
</head>

<body>
<!--부트스트랩-->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <h1 style="margin: 20px 0 20px 10px;">신고하기</h1>
    <hr>
    <form method="post" name="reprot" action="${contextPath}/report.do">
        <div id="rp_Title">
            <h3>제목 :&nbsp;&nbsp;</h3>
            <input type="text" id="" name="rp_Title" />
        </div>
        <div id="rp_Content">
            <h3>내용 :&nbsp;&nbsp;</h3>
            <textarea rows="20" cols="50" name="rp_Content"></textarea>
        </div>
        <div id="rpBtn">
        <input type="submit" value="신고완료">
        </div>
    </form>
</body>

</html>