<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%>
<c:set var ="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입창</title>
    <!-- css -->
    <link rel="stylesheet" href="/css/userform.css">
</head>

<body>
    <form class="userform" action="${contextPath}/addMember.do" method="post">
        <fieldset >
            <h1>회원가입</h1>
            <br><br>
            <div class="form1">


                <h3>이름</h3>
                <div class="userformbtn">
                    <input type="text" id="userName" name="user_Name" size="40" /><br><br>
                </div>
                <h3>아이디</h3>
                <div class="userformbtn">
                    <input type="text" id="userId" name="user_Id" size="40" /> <button>중복확인</button><br><br>
                </div>
                <h3>비밀번호</h3>
                <div class="userformbtn">
                    <input type="password" id="userPwd" name="user_Pwd" size="40" /><br><br>
                </div>
                <h3>비밀번호 확인</h3>
                <div class="userformbtn">
                    <input type="password" id="userPwd2" name="비밀번호확인" size="40" /><br><br>
                </div>
                <h3>주소</h3>
                <div class="userformbtn">
                    <input type="text" id="userAddress1" name="user_Address1" size="40" /> <button>우편번호</button><br><br>
                </div>
                <h3>상세주소</h3>
                <div class="userformbtn">
                    <input type="text" id="userAddress2" name="user_Address2" size="40" /><br><br>
                </div>
                <h3>이메일</h3>
                <div class="userformbtn">
                    <input type="email" id="userEmail" name="user_Email" size="40" /><br><br>
                </div>
                <h3>휴대폰 인증</h3>
                <div class="userformbtn">
                    <input type="text" id="phoneNumber" name="user_Phone" size="40" /> <button>인증번호 받기</button><br><br>
                </div>
                <h3>인증번호 입력</h3>
                <div class="userformbtn">
                    <input type="text" id="phoneCheck" name="휴대폰인증" size="40" /> <button>인증번호 확인</button>
                </div>
                 
                <!--판매자 ,중개사 전용 태그-->
                <c:if test="${member == '3' || member == '2'}">
                 <h3>사업자 번호</h3>
                 <div class="userformbtn">
                     <input type="text" id="businessNum" name="businessNum" size="40" />
                 </div>
             </c:if>
                <input type="submit" value="회원가입" style="margin-left: 135px; margin-top: 20px; width: 100px; height: 40px;">
            </div>
        </fieldset>
    </form>
</body>

</html>