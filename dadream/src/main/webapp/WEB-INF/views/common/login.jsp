<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="result" value="${param.result }" />
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">

    <head>
        <title>로그인 / 회원가입 폼 템플릿</title>
        <!-- css -->
        <link rel="stylesheet" href="/css/login.css">

        <!-- 카카오 -->
        <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>


        <script>
            Kakao.init('24a6c15e2202626d02ee581aa3846810');
            // SDK 초기화 여부를 판단합니다.
            console.log(Kakao.isInitialized());
        </script>





        <c:choose>
            <c:when test="${result=='loginFailed' }">
                <script>
                    window.onload = function () {
                        alert("아이디나 비밀번호가 틀립니다. 다시 로그인 하세요😢");
                    }
                </script>
            </c:when>

        </c:choose>
    </head>

<body>
    <div class="wrap" name="frmLogin">
        <div class="form-wrap">
            <div class="button-wrap">
                <div id="btn"></div>
                <!-- <button type="button" class="togglebtn" onclick="login()">LOG IN</button> -->

            </div>
            <div class="social-icons">
                <!-- <img src="../image/face.png" alt="대체">
                <img src="../image/ins.png" alt="대체"> -->
            </div>
            <form id="login" method="post" action="${contextPath}/logincheck.do" class="input-group">
                <input type="text" class="input-field" name="user_Id" placeholder="ID" required>
                <input type="password" class="input-field" name="user_Pwd" placeholder="PASSWORD" required>
                <input type="checkbox" class="checkbox"><span>Remember Password</span>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <div>
                    <button class="submit">Login</button>
                </div>
            </form>


            <a id="custom-login-btn" href="javascript:loginWithKakao()"
                style="position: absolute;bottom: 80px;left: 78px;">
                <img src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222"
                    alt="카카오 로그인 버튼" />
            </a>
        </div>
    </div>
    <!-- 카카오 로그인 -->
    <script type="text/javascript">
        function loginWithKakao() {

            Kakao.Auth.authorize({
                redirectUri: 'http://localhost:8080/dealingmain.do',
                prompts: 'login',

            });

            Kakao.Auth.createLoginButton({
                success: function (authObj) {
                    alert(JSON.stringify(authObj))
                },
                fail: function (err) {
                    alert(JSON.stringify(err))
                },
            })
        }
    </script>








</body>

</html>