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
            window.open("call.html", "중개사번호", "width=400, height=500, top=200 left=600");
        }
    </script>
    <!--부트스트랩-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
        * {
            margin: 0px;
            padding: 0px;
        }

        .first {
            position: absolute;
            width: 1130px;
            height: auto;
            left: 20%;
        }

        .dlImg {
            display: flex;
            margin: 0 0 0 20px;
            flex-wrap: wrap;
        }

        .dlMain {
            margin-bottom: 0px;
        }

        .middle {
            display: flex;
            justify-content: space-between;
            width: 1130px;
        }

        .dlThumbnail1 {
            display: flex;
            position: relative;
            margin: 10px 0 0 5px;
        }

        .dlThumbnail2 {
            width: 100px;
            height: 100px;
            margin-right: 10px;
        }

        .dlComments {
            border: 2px solid black;
            /* display: flex; */
            text-align: center;
        }

        .dlComments1 {
            width: 400px;
            margin-top: 20px;
            height: auto;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .dlComments1 p {
            border: 1px solid black;
            width: 350px;
        }

        #dlComments2 {
            display: flex;
            justify-content: space-around;
        }

        #dlComments2 p {
            border: 1px solid black;
            width: 170px;
        }

        #dlComments3 {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }

        #dlComments3 p {
            border: 1px solid black;
            width: 170px;
        }

        #dlComments4 {
            display: flex;
            margin-top: 40px;
        }

        #dlcontents{
            margin-top: 100px;
            width: 650px;
        }

        #reportbtn {
            margin-top: 400px;
        }
    </style>
</head>

<body>
    <!--부트스트랩-->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <div class="first">
        <h1 style="margin:20px 0 0 10px; font: bold;">매물이름</h1>
        <br><br><br><br>
        <div class="middle">

            <!--이미지 div-->
            <div class="dlImg">
                <div class="dlMain">
                    <img src="../images/sample01.jpg" class="img-fluid" alt="" width="650px">
                </div>

                <div class="dlThumbnail1">
                    <div class="dlThumbnail2">
                        <img src="../images/sample02.jpg" class="img-thumbnail" alt="">
                    </div>
                    <div class="dlThumbnail2">
                        <img src="../images/sample02.jpg" class="img-thumbnail" alt="">
                    </div>
                    <div class="dlThumbnail2">
                        <img src="../images/sample02.jpg" class="img-thumbnail" alt="">
                    </div>
                    <div class="dlThumbnail2">
                        <img src="../images/sample02.jpg" class="img-thumbnail" alt="">
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
                        <h3>관리비</h3>
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
            <a href="#" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true" target="_blank">신고하기</a>
        </div>
        <div style="background-color: white; height: 200px;"></div>
</body>
</html>