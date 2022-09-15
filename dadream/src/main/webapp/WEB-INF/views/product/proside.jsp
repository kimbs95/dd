<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<%
  request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>로그인 / 회원가입 폼 템플릿</title>
    <style>
        .pro_side {
            background-image: url(../img/sea.jpg);
            border-radius: 2%;
            background-position: center;
            background-size: cover;
            position: absolute;
        }

        .pro_side_form {
            border-radius: 2%;
            width: 280px;
            height: 500px;
            position: relative;
            background: rgb(129, 127, 126);
            overflow: hidden;
        }

        .pro_side_botton {
            width: 220px;
            margin: 25px 30px;
            position: relative;
            box-shadow: 0 0 600px 9px #fcae8f;
            border-radius: 30px;
        }

        .pro_togglebtn {
            padding: 10px 30px;
            cursor: pointer;
            background: transparent;
            border: 0;
            outline: none;
            position: relative;
        }

        #pro_side_btn {
            text-align: center;
            top: 0;
            left: 0;
            position: absolute;
            width: 110px;
            height: 100%;
            background: linear-gradient(to right, #ff105f, #ffad06);
            border-radius: 30px;
            transition: .5s;
        }

        .social-icons {
            margin: 30px auto;
            text-align: center;
        }

        .social-icons img {
            width: 30px;
            cursor: pointer;
        }

        .input-group {
            position: absolute;
            width: 280px;
            transition: .5s;
        }

        .input-field {
            width: 100%;
            padding: 10px 0;
            margin: 5px 0;
            border: none;
            border-bottom: 1px solid #999;
            outline: none;
            background: transparent;
        }

        .submit {
            /* width: 50%; */
            padding: 10px 30px;
            cursor: pointer;
            display: block;
            margin: 10px 35px;
            background: linear-gradient(to right, #ff105f, #ffad06);
            border: 0;
            outline: none;
            border-radius: 30px;
        }

        .checkbox {
            margin: 30px 10px 30px 0;
        }

        span {
            color: #777;
            font-size: 12px;
            bottom: 68px;
            position: absolute;
        }

        #pro_dealing {
            left: 50px;
        }

        ul {
            padding: 0;
        }

        ul li {
            list-style-type: none;
        }

        #pro_household {
            left: 450px;
        }
    </style>
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
            <form id="pro_household" action="" class="input-group">
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