<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원종류 선택창</title>
    <style>
        * {
            margin: 0 auto;
            padding: 0px;
        }

        body {
            margin-top: 20px;
            text-align: center;
        }

        .memberType {
            display: flex;
        }

        .memberType a {
            text-align: center;
            text-decoration: none;
        }

        #member1 {
            width: 300px;
            height: 300px;
            border: 1px solid black;
        }

      

    </style>
</head>
<body>
    <h1 style="font:bold">회원가입 하기</h1>
    <br><br><br>
    <h3>가입하실 회원의 종류를 선택해주세요.</h3>
    <br><br><br><br><br><br><br><br>
    <div class="memberType">
        <form id="member1" method="post" action="#">
            <input type="button" id="membtn1">
            <input type="hidden" name="member" value="1" />
        </a>
        </form>
        <form id="member2" method="post" action="#">
        <a href="#">
            <img src="../images/seller.png" />
            <p>판매자회원 가입</p>
            <input type="hidden" name="member" value="2" />
        </a>
        </form>
        <form id="member3" method="post" action="#">
        <a href="#">
            <img src="../images/broker.png" />
            <p>중개사회원 가입</p>
            <input type="hidden" name="member" value="3" />
        </a>
        </form>
    </div>
</body>
</html>