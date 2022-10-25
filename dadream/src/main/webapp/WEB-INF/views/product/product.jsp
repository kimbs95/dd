<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- <c:set var="/images" value=" application.getRealPath()" /> -->
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
  <div id="stupit" style="display:none; ">
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
  <div class=scroll style="margin-left: 270px;">
    <c:forEach var="product" items="${productsList}">
      <div class="pro_category_padding" style="width: 850px; padding: 5px 5px; border-bottom: 1px solid;">
        <div class="pro_category_content">
          <div class="productimg">
            <a href="${contextPath}/productview.do?product_Num=${product.product_Num}">
              <!-- <img src="../${contextPath}/product/${product.user_Id}/${product.product_Image}" alt="상품사진" width="200px" height="170px" style="margin-right: 10px;"> -->
              <img src="/product/${product.user_Id}/${product.product_Image}" alt="상품사진" width="200px" height="170px"
                style="border:1px solid #ccc;">
            </a>
          </div>
          <div class="productcontent" style="padding: 5px 0 0 5px;">
            <h1>상품명 : ${product.product_Name}</h1>
            <h3><span>가격 : </span>${product.product_Price}</h3>
            <p>상품 설명 : ${product.product_Content}</p>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>

</body>

</html>