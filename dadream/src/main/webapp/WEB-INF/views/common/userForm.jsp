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
    <title>회원가입창</title>
    <style>
        * {
         margin: 0%; 
         padding:0%;   
        }
        .userForm {
            position: absolute;
            margin-left: 36%;
            margin-top: 5%;
        }
        .form1 {
            margin-bottom: 5%;
            margin-left: 2%;
        }
        fieldset {
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <form class="userForm" action="#" method="post">
    <fieldset style="width:500px">
        <h1 style="margin: 10px;">회원가입</h1>
        <br><br>
        <div class="form1">
            <h3>이름</h3>
            <input type="text" id="userName" name="이름" size="40" /><br><br>
            <h3>아이디</h3>
            <input type="text" id="userId" name="아이디" size="40" />  <button>중복확인</button><br><br>
            <h3>비밀번호</h3>
            <input type="password" id="userPwd" name="비밀번호" size="40" /><br><br>
            <h3>비밀번호 확인</h3>
            <input type="password" id="userPwd2" name="비밀번호확인" size="40" /><br><br>
            <h3>주소</h3>
            <input type="text" id="userAddress1" name="우편주소" size="40" />  <button>우편번호</button><br><br>
            <h3>상세주소</h3>
            <input type="text" id="userAddress2" name="주소" size="40" /><br><br>
            <h3>이메일</h3>
            <input type="email" id="userEmail" name="이메일" size="40" /><br><br>
            <h3>휴대폰 인증</h3>
            <input type="text" id="phoneNumber" name="휴대폰" size="40" />  <button>인증번호 받기</button><br><br>
            <h3>인증번호 입력</h3>
            <input type="text" id="phoneCheck" name="휴대폰인증" size="40" />  <button>인증번호 확인</button>
            <br><br><br>
            <input type="submit" value="회원가입" style="width:475px;">
        </div>
    </fieldset>
    </form>
</body>
</html>