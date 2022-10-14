<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">

    <title>다드림 메인</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <!-- css -->
    <link rel="stylesheet" href="/css/mainpro.css">

</head>

<body>
    <!-- 메인 카테고리 -->
    <div class="pro_category">
        <ul>
            <div class="pro_category_image">

                <form action="/product.do" class="submit">
                    <li onclick="">
                        <button style="background: none; border: none;" type="submit" name="product_Name" value="책상">
                            <img src="../메인 카테고리 사진/책상.png">
                        </button>
                    </li>
                </form>
            </div>
        </ul>
        <ul>
            <div class="pro_category_image">
                <form action="/product.do" class="submit">
                    <li>
                        <button style="background: none; border: none;" type="submit" name="product_Name" value="침대">
                            <img src="../메인 카테고리 사진/침대.png">
                        </button>
                    </li>
                </form>
            </div>
        </ul>
        <ul>
            <div class="pro_category_image">
                <form action="/product.do" class="submit">
                    <li>
                        <button style="background: none; border: none;" type="submit" name="product_Name" value="의자">
                            <img src="../메인 카테고리 사진/의자.png">
                        </button>
                    </li>
                </form>
            </div>
        </ul>
        <ul>
            <div class="pro_category_image">
                <form action="/product.do" class="submit">
                    <li>
                        <button style="background: none; border: none;" type="submit" name="product_Name" value="스탠드">
                            <img src="../메인 카테고리 사진/스텐드.png">
                        </button>
                    </li>
                </form>
            </div>
        </ul>
        <ul>
            <div class="pro_category_image">
                <form action="/product.do" class="submit">
                    <li>
                        <button style="background: none; border: none;" type="submit" name="product_Name" value="거울">
                            <img src="../메인 카테고리 사진/거울.png">
                        </button>
                    </li>
                </form>
            </div>
        </ul>
        <ul>
            <div class="pro_category_image">
                <form action="/product.do" class="submit">
                    <li>
                        <button style="background: none; border: none;" type="submit" name="product_Name" value="서랍장">
                            <img src="../메인 카테고리 사진/서랍장.png">
                        </button>
                    </li>
                </form>
            </div>
        </ul>
        <ul>
            <div class="pro_category_image">
                <form action="/product.do" class="submit">
                    <li>
                        <button style="background: none; border: none;" type="submit" name="product_Name" value="소파">
                            <img src="../메인 카테고리 사진/소파.png">
                        </button>
                    </li>
                </form>
            </div>
        </ul>
        <ul>
            <div class="pro_category_image">
                <form action="/product.do" class="submit">
                    <li>
                        <button style="background: none; border: none;" type="submit" name="product_Name" value="식탁">
                            <img src="../메인 카테고리 사진/식탁.png">
                        </button>
                    </li>
                </form>
            </div>
        </ul>
        <ul>
            <div class="pro_category_image">
                <form action="/product.do" class="submit">
                    <li>
                        <button style="background: none; border: none;" type="submit" name="product_Name" value="옷장">
                            <img src="../메인 카테고리 사진/옷장.png">
                        </button>
                    </li>
                </form>
            </div>
        </ul>
    </div>
    <!-- 메인이미지슬라이더 -->
    <div class="pro_slider">
        <img class="pro_slider_image" src="../image/메인로고.png">
        <img class="pro_slider_image" src="../image/han.jpg">
    </div>

    <!-- 이미지 슬라이드 스크립트-->
    <script>
        $(document).ready(function () {
            $('.pro_slider').bxSlider({
                slideWidth: 1130,
                auto: true,
                speed: 500,
                pause: 3000,
                mode: 'fade',
                autoHover: true,
                pager: true,
                controls: false
            });
        });
    </script>

    <!-- 메인 베스트상품 -->
    <div class="pro_best_item">
        <h1>인기상품</h1>
        <ul>
            <c:forEach var="i" items="${product}">
                <li>
                    <a href="/productview.do?product_Num=${i.product_Num}">
                        <img class="image" src="/product/${i.user_Id}/${i.product_Image}">
                    </a>
                    <div>
                        <h1>${i.product_Name}</h1>
                        <p>￦ ${i.product_Price}</p>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>

    <!-- 인테리어 소개 -->
    <div class="pro_myhouse_introduce">
        <h1>인테리어</h1>
        <ul>
            <c:forEach var="i" items="${board}" >
                    <li>
                        <a href="/board/read?inte_Num=${i.inte_Num}">
                            <img class="image" src="/board/${i.user_Id}/${i.inte_Image}">
                        </a>
                        <h1>${i.inte_Title}</h1>
                        <p>${i.inte_Text}</p>
                        <span>작성자 ${i.user_Id}</span>
                    </li>
            </c:forEach>
        </ul>
    </div>





</body>

</html>