<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


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
<style>
    * {
            box-sizing: border-box;
            user-select: none;
            margin: 0 auto;
            justify-content: space-between;
            
        }
/* 카테고리 css */
.pro_category{
    width: 1130px;
    height: auto;
    display: flex;
    justify-content: space-around;
    padding: 20px 0;
    background: pink;
}
.pro_category_image img{
    width: 50px;
    height: 50px;
    /* border: 1px solid rgb(0, 0, 0); */
    border-radius: 4%;
}
/* 메인 슬라이더 이미지 */
.bx-wrapper{
    /* position: absolute; */
    width: 1130px;
}
    .pro_slider{
        width: 1130px ;
        height: auto;

    }
    .pro_slider_image{
        margin:0 auto;
        width: 11300px;
        height: 300px;
    }
/* 베스트상품 css */
    .pro_best_item{
        width: 1130px ;
        display: flex;
        flex-wrap: wrap;
    }
    .pro_best_item ul{
        margin-left: 35px;
    }
    .pro_best_item ul li{
        width: 200px;
        height: 300px;
        margin: 10px 20px;
    }
    .pro_best_item ul li img{
        width: 200px;
        height: 300px;
    }

    /* 인테리어 목록css */
    .pro_myhouse_introduce{
        width: 1130px;
        height: auto;
        display: flex;
        justify-content: space-around;
        margin: 10px 20px;
        flex-wrap: wrap;
    }

    .pro_introduce img{
        width: 280px;
        height: 200px;

    }
   
</style>
</head>
<body>

    <!-- 메인 카테고리 -->
    <div class="pro_category">
        <ul>
            <div class="pro_category_image">
                <a href=""><li>
                    <img src="../메인 카테고리 사진/책상.png">
                </li></a>
            </div>
        </ul>
        <ul>
            <div class="pro_category_image">
                <a href=""><li>
                    <img src="../메인 카테고리 사진/침대.png">
                </li></a>
            </div>
        </ul>
        <ul>
            <div class="pro_category_image">
                <a href=""><li>
                    <img src="../메인 카테고리 사진/의자.png">
                </li></a>
            </div>
        </ul>
        <ul>
            <div class="pro_category_image">
                <a href=""><li>
                    <img src="../메인 카테고리 사진/스텐드.png">
                </li></a>
            </div>
        </ul>
        <ul>
            <div class="pro_category_image">
                <a href=""><li>
                    <img src="../메인 카테고리 사진/거울.png">
                </li></a>
            </div>
        </ul>
        <ul>
            <div class="pro_category_image">
                <a href=""><li>
                    <img src="../메인 카테고리 사진/서랍장.png">
                </li></a>
            </div>
        </ul>
        <ul>
            <div class="pro_category_image">
                <a href=""><li>
                    <img src="../메인 카테고리 사진/소파.png">
                </li></a>
            </div>
        </ul>
        <ul>
            <div class="pro_category_image">
                <a href=""><li>
                    <img src="../메인 카테고리 사진/식탁.png">
                </li></a>
            </div>
        </ul>
        <ul>
            <div class="pro_category_image">
                <a href=""><li>
                    <img src="../메인 카테고리 사진/옷장.png">
                </li></a>
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
                    $(document).ready(function() {
                        $('.pro_slider').bxSlider({
                            slideWidth : 1130, 
                            auto: true,
                            speed : 500,
                            pause: 3000,
                            mode : 'fade',
                            autoHover : true,
                            pager: true,
                            controls: false
                        });
                    });
        </script>

        <!-- 메인 베스트상품 -->
        <div class="pro_best_item">
            <ul>
                <li>
                    <img class="image" src="../image/메인로고.png">
                    <span>제목 / 가격</span>
                </li>
            </ul>
            <ul>
                <li>
                    <img class="image" src="../image/메인로고.png">
                    <span>제목 / 가격</span>
                </li>
            </ul>
            <ul>
                <li>
                    <img class="image" src="../image/메인로고.png">
                    <span>제목 / 가격</span>
                </li>
            </ul>
            <ul>
                <li>
                    <img class="image" src="../image/메인로고.png">
                    <span>제목 / 가격</span>
                </li>
            </ul>
        </div>

        <!-- 인테리어 소개 -->
        <div class="pro_myhouse_introduce">
            <ul>
            <div class="pro_introduce">
                <li>
                <img class="image" src="../image/메인로고.png">
                <p>내용</p>
                <p>KBS</p>
                </li>
            </div>
            </ul>
            <ul>
                <div class="pro_introduce">
                    <li>
                    <img class="image" src="../image/메인로고.png">
                    <p>내용</p>
                    <p>KBS</p>
                    </li>
                </div>
                </ul>
                <ul>
                    <div class="pro_introduce">
                        <li>
                        <img class="image" src="../image/메인로고.png">
                        <p>내용</p>
                        <p>KBS</p>
                        </li>
                    </div>
                    </ul>
        </div>





</body>
</html>