<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>

<head>
  <meta charset="UTF-8" />
  <title>Vanilla js slide with pagination</title>
  <!-- css -->
  <link rel="stylesheet" href="/css/product.css">
  <!--bxslider-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
  <script>
    $(document).ready(function () {
      $('.slider').bxSlider({
        slideWidth: 600, //슬라이드 넓이
        mode: 'horizontal', //슬라이드 모드 ex)'horizontal', 'vertical', 'fade'
        speed: 0, // ms
        pager: false, // 현재위치 페이징 표시 여부 밑에... 표시
        pause: 3000, //멈춰있는 시간
        moveSlider: 1, //슬라이더 이동기 개수
        slideMargin: 0, // 슬라이드간의 간격
        auto: false, // 자동 실행 여부
        autoHover: true, // 마우스 호버시 정지 여부
        controls: true, // 이전 다음 버튼 노출 여부
      });
    });
  </script>
  <!-- css -->
  <link rel="stylesheet" href="/css/product.css">


</head>

<body>

  <div class=" slider">
    <div class="slide_item"><img src="../image/han.jpg"></div>
    <div class="slide_item"><img src="../image/han.jpg"></div>
    <div class="slide_item"><img src="../image/메인로고.png"></div>
  </div>

</body>

</html>