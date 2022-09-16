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
</head>

<body>

  <!-- 슬라이드 body  절대 절대 건드리지 마시오 이거 없으면 화면 뒤틀림 -->
  <div id="stupit" style="display:none; "  >
    <div class="slide_item">1</div>
    <div class="slide_item">2</div>
    <div class="slide_item">3</div>
    <div class="slide_item">4</div>
    <div class="slide_item">5</div>
    <div class="slide_prev_button slide_button">◀</div>
    <div class="slide_next_button slide_button">▶</div>
    <ul class="slide_pagination"></ul>
  </div>
  <!-- 카테고리상품들 -->
  <!-- 함부로 inlinecss 건드리면 안돼요 깨져용 -->
  <div class="pro_category_padding" style="width: 850px; margin-left: 200px;">
    <div class="pro_category_menu">
      <img src="../메인 카테고리 사진/스텐드.png" alt="" width="200px" height="200px">
      <div class="pro_category_content">
        <p>title</p>
        <p>pay</p>
        <p>content</p>
      </div>
    </div>
    <div class="pro_category_menu">
      <img src="../메인 카테고리 사진/스텐드.png" alt="" width="200px" height="200px">
      <div class="pro_category_content">
        <p>title</p>
        <p>pay</p>
        <p>content</p>
      </div>
    </div>
    <div class="pro_category_menu">
      <img src="../메인 카테고리 사진/스텐드.png" alt="" width="200px" height="200px">
      <div class="pro_category_content">
        <p>title</p>
        <p>pay</p>
        <p>content</p>
      </div>
    </div>
    <div class="pro_category_menu">
      <img src="../메인 카테고리 사진/스텐드.png" alt="" width="200px" height="200px">
      <div class="pro_category_content">
        <p>title</p>
        <p>pay</p>
        <p>content</p>
      </div>
    </div>
    <div class="pro_category_menu">
      <img src="../메인 카테고리 사진/스텐드.png" alt="" width="200px" height="200px">
      <div class="pro_category_content">
        <p>title</p>
        <p>pay</p>
        <p>content</p>
      </div>
    </div>
  </div>

</body>

</html>