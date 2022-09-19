<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->

    <head>
        <title>로그인 / 회원가입 폼 템플릿</title>
        <!-- css -->
        <link rel="stylesheet" href="/css/login.css">

        <!-- 카카오 sdk -->
        <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
        <!-- 코코넛 key -->

        <script>
            // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
            Kakao.init('24a6c15e2202626d02ee581aa3846810');
            

            // SDK 초기화 여부를 판단합니다.
            // console.log(Kakao.isInitialized());
            // Kakao.Auth.authorize({
            //     redirectUri: '${REDIRECT_URI}'
                
                
            // });
            // Kakao.Auth.setAccessToken(ACCESS_TOKEN);
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
    <div class="wrap" name="frmLogin" method="post" action="${contextPath}/user/login.do">
        <div class="form-wrap">
            <div class="button-wrap">
                <div id="btn"></div>
                <button type="button" class="togglebtn" onclick="login()">LOG IN</button>

            </div>
            <div class="social-icons">
                <img src="../image/face.png" alt="대체">
                <img src="../image/ins.png" alt="대체">
            </div>
            <form id="login" action="" class="input-group">
                <input type="text" class="input-field" placeholder="User name or Email" required>
                <input type="password" class="input-field" placeholder="Enter Password" required>
                <input type="checkbox" class="checkbox"><span>Remember Password</span>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="#" style="display: flex; justify-content: center;text-decoration: none;">회원가입</a>
                <div>
                    <button class="submit" action="#">Login</button>

                </div>
            </form>


        </div>
    </div>
    <a id="custom-login-btn" href="javascript:loginWithKakao()">
        <img src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222" alt="카카오 로그인 버튼" />
    </a>
    <script type="text/javascript">
        function loginWithKakao() {
            Kakao.Auth.login({
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