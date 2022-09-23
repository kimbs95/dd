<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>부동산 매물보기</title>
    <!--팝업창-->
    <script>
        function showPopup() {
            window.open("${contextPath}/call.do", "중개사번호", "width=400, height=500, top=200 left=600");
        }

        function showPopup2() {
            window.open("${contextPath}/rpPopUp.do", "신고하기", "width=500, height=600, top=200 left=600");
        }
    </script>
    <!--부트스트랩-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- css -->
    <link rel="stylesheet" href="/css/dealingview.css">
</head>

<body>
    <!--부트스트랩-->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <div class="first">
        <h1>매물이름</h1>
        <br><br><br><br>
        <div class="middle">

            <!--이미지 div-->
            <div class="dlImg">
                <div class="dlMain">
                    <img src="/image/sample01.jpg" class="img-fluid" alt="" width="650px">
                </div>

                <div class="dlThumbnail1">
                    <div class="dlThumbnail2">
                        <img src="/image/sample02.jpg" class="img-thumbnail" alt="">
                    </div>
                    <div class="dlThumbnail2">
                        <img src="/image/sample02.jpg" class="img-thumbnail" alt="">
                    </div>
                    <div class="dlThumbnail2">
                        <img src="/image/sample02.jpg" class="img-thumbnail" alt="">
                    </div>
                    <div class="dlThumbnail2">
                        <img src="/image/sample02.jpg" class="img-thumbnail" alt="">
                    </div>
                </div>
            </div>

            <!--상품 설명-->
            <div class="dlComments">
                <div class="dlComments1">
                    <div>
                        <h3>건물명</h3>
                        <p>육주영 건물</p>
                    </div>
                    <br><br>
                    <div>
                        <h3>주소</h3>
                        <p>대전 서구 둔산동</p>
                    </div>
                </div>
                <br><br>
                <div id="dlComments2">
                    <div>
                        <h3>방형태</h3>
                        <p>투룸</p>
                    </div>
                    <div>
                        <h3>층수</h3>
                        <p>3층</p>
                    </div>
                </div>
                <div id="dlComments3">
                    <div>
                        <h3>가격</h3>
                        <p>15만원</p>
                    </div>
                    <div>
                        <h3>방/욕실</h3>
                        <p>투룸</p>
                    </div>
                    <div id="dlComments4">
                        <div>
                            <button type="button" class="btn btn-secondary btn-lg" onclick="showPopup();">전화하기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="dlcontents">
            <h3>매물정보</h3>
            <br><br>
            <p>이 집은 2022년 신축이지만 주택의뢰자가 갑작스러운 일정으로 인해 해외로 이민을 가게되어서
                급하게 싸게 내놓은 매물입니다.
            </p>
        </div>
        <div id="reportbtn">
            <!-- <a href="#" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true">신고하기</a> -->
            <button type="button" class="btn btn-secondary btn-lg" onclick="showPopup2();">신고하기</button>
        </div>

</body>

</html>