<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
  request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>로그인 / 회원가입 폼 템플릿</title>
    <!-- css -->
    <link rel="stylesheet" href="/css/proside.css">
</head>

<body>
    <div class="pro_side">
        <div class="pro_side_form">
            <div class="pro_side_botton">
                <div id="pro_side_btn"></div>
                <button type="button" class="pro_togglebtn" onclick="pro_dealing()">부동산</button>
                <button type="button" class="pro_togglebtn" onclick="pro_household()">가구</button>
            </div>
            <form id="pro_dealing" action="" class="input-group">
                <ul>
                    <li>
                        <img src="" alt="">
                        <p>title</p>
                        <p>가격</p>
                    </li>
                </ul>
            </form>
            <form id="pro_household" action="${contextPath}/order.do" class="input-group">
                <ul>
                    <li>
                        <img src="" alt="">
                        <p>title</p>
                        <p>가격</p>
                    </li>
                </ul>
                <button class="submit">구매하기</button>
            </form>
        </div>
    </div>
    <script>
        var x = document.getElementById("pro_dealing");
        var y = document.getElementById("pro_household");
        var z = document.getElementById("pro_side_btn");


        function pro_dealing() {
            x.style.left = "50px";
            y.style.left = "450px";
            z.style.left = "0";
        }

        function pro_household() {
            x.style.left = "-400px";
            y.style.left = "50px";
            z.style.left = "110px";
        }
    </script>
</body>

</html>