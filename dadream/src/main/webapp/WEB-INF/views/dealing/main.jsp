<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
  request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>부동산 메인</title>
    <!-- 제이쿼리 -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <!-- css -->
    <link rel="stylesheet" type="text/css" href="/css/main.css">

    <style>
        #main1 {
            background-image: url("../image/livingRoom.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            margin-bottom: 50px;
        }

        #main2 {
            justify-content: center;
            justify-items: center;
        }
    </style>
</head>

<body>
    <!-- <div style="display:none;"><%= application.getRealPath("/image") %></div> -->
    <div id="main1">
        <!--아래 form 부분 중앙정렬 검토필요-->
        <ul class="search">
            <li>
                <form method="get" action="${contextPath}/map.do"><button type="submit" name="dl_Form"
                        value="all">전체</button></form>
            </li>
            <li>
                <form method="get" action="${contextPath}/map.do"><button type="submit" name="dl_Form"
                        value="아파트">아파트</button></form>
            </li>
            <li>
                <form method="get" action="${contextPath}/map.do"><button type="submit" name="dl_Form"
                        value="투룸">투룸+</button></form>
            </li>
            <li>
                <form method="get" action="${contextPath}/map.do"><button type="submit" name="dl_Form"
                        value="원룸">원룸</button></form>
            </li>
            <li>
                <form method="get" action="${contextPath}/map.do"><button type="submit" name="dl_Form"
                        value="오피스텔">오피스텔</button></form>
            </li>
            <li>
                <form method="get" action="${contextPath}/map.do"><button type="submit" name="dl_Form"
                        value="주택">주택</button></form>
            </li>
        </ul>
        <div id="search">
            <form method="get" action="${contextPath}/map.do" id="mapForm">
                <input class="dealingsearch" type="search" style="outline: none;" name="dl_Address"
                    placeholder="검색어를 입력하세요." />
                <input type="submit" value="검색" style="font-weight:bold;"></form>
            </form>
        </div>
    </div>

    <div id="main2">
        <form>
            <!-- 위치기반 API 추천매물 -->
            <h1 style="font-weight:bold; font-size:x-large; margin-bottom: 40px;">현위치 추천 매물</h1>
            <div id="mainList"></div>
        </form>
        <!-- 추천매물 리스트
        <div id="main2_1" style="display: flex;">
            <a class="img-button" href="${contextPath}/dealingview.do">
            </a>
            <a class="img-button" href="${contextPath}/dealingview.do">
            </a>
            <a class="img-button" style="background-color: green;" href="${contextPath}/dealingview.do">
            </a>
            <a class="img-button" href="${contextPath}/dealingview.do">
            </a>
            <a class="img-button" href="${contextPath}/dealingview.do">
            </a>
        </div> -->
    </div>

    <!-- <div id="main3">
        <div id="avg-dong-price"> -->
    <!-- OO동 평균월세 API 연동필요 -->
    <!-- </div>
        <div id="avg-dong-price1"> -->
    <!-- OO동의 주변동 평균월세 API 연동필요 -->
    <!-- </div>
    </div> -->

    <h1 style="font-size: 30px; font-weight: bolder;margin: 30px 0 40px 45%; ">부동산 가이드</h1>
    <div id="main4">
        <ul>
            <li class="a1">
                <a href="https://post.naver.com/viewer/postView.nhn?volumeNo=27011368&memberNo=2120568">
                    <p>허위매물방지 5계명</p>
                </a>
            </li>
            <li class="a2">
                <a href="https://post.naver.com/viewer/postView.nhn?volumeNo=25802095&memberNo=2120568">
                    <p>나에게 꼭 맞는 방 찾는 방법!!</p>
                </a>
            </li>
            <li class="a3">
                <a href="https://post.naver.com/viewer/postView.nhn?volumeNo=26067452&memberNo=2120568">
                    <p>알아두면 좋은 부동산 용어!!</p>
                </a>
            </li>
            <li class="a4">
                <a href="https://post.naver.com/viewer/postView.nhn?volumeNo=26596142&memberNo=2120568">
                    <p>임대차 계약서 작성 시!!</p>
                </a>
            </li>
            
            <!-- ' <form action="/dealingView.do?dl_Num='+item.dl_Num+'method="get" >' -->
        </ul>
    </div>
    <script>
        $(document).ready(function () {
            /* 위치기반 api */
            // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
            if (navigator.geolocation) {
                // GeoLocation을 이용해서 접속 위치를 얻어옵니다
                navigator.geolocation.getCurrentPosition(function (position) {

                    var lat = position.coords.latitude; // 위도
                    var lng = position.coords.longitude; // 경도

                    console.log(lat);
                    console.log(lng);

                    $.ajax({
                        url: "/hereMe.do",
                        type: "get",
                        cache: false,
                        data: {
                            lat,
                            lng
                        },
                        success: function (hereList) {

                            $("#mainList").empty();
                            var mainList = "";

                            $.each(hereList, function (index, item) {
                                mainList +=
                                '<a href="/dealingview.do?dl_Num='+item.dl_Num+'" style="color:black">'+
                                    '<div style="display: inline-block; border: 1px solid #ccc; margin-bottom: 20px; margin-left: 30px; width:350px; height:485px;">';
                                mainList += '<div style="text-align:center;">' +
                                    '<img src="/dealing/' + item.user_Id + '/' +
                                    item.dl_Image +
                                    '" alt="매물사진" width="300px" height="250px" style="margin: 20px 0 20px 0;border:0.5px solid #ccc">' +
                                    '</div>';
                                mainList += '<div style="margin-left:15px;">' +
                                    '<span style="font-size:20px;font-weight:bold;margin-left:10px;">'+item.dl_Title+'</span>'+
                                    '<h1>'+ item.dl_Form + '<br>'+item.dl_Address+'<br>'+
                                      item.dl_Form2  +'<br>￦ '+ item.dl_Price + '<br>옵션 : '+item.dl_Option+'</h1></div>' + '</div></a>';

                            });





                            document.getElementById("mainList").innerHTML = mainList;
                        },
                        error: function () {
                            alert("오류발생");
                        }

                    });

                });

            } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

                // var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
                //     message = 'geolocation을 사용할수 없어요..'
                alert("현재위치를 불러올 수 없습니다.")
            }
        });



        /* 로컬스토리지 보류 */
        // $(document).ready(function () {
        //     var dlLocalStorage = null;
        //     var dlLocalStorage = window.localStorage.getItem("dlLocalStorage");
        //     console.log(dlLocalStorage);
        //     //메인페이지에 검색리스트 띄우기
        //     $.ajax({
        //         url: "/dlLocalStorage.do",
        //         type: "get",
        //         data: {
        //             dlLocalStorage
        //         },
        //         success: function (dlMain) {
        //             console.log(dlMain);
        // var mainList = "";
        // $.each(dlMain, function (index, item) {
        //     mainList +=
        //         '<div style="display: flex; border-bottom: 1px solid #ccc; margin-bottom: 20px; margin-left: 30px;">';
        //     mainList += '<div>' +
        //         '<img src="../메인 카테고리 사진/스텐드.png" alt="" width="200px" height="170px">' +
        //         '</div>';
        //     mainList += '<div>' + item.dl_Title + '<br>' + item.dl_Form +
        //         '<br>' + item.dl_Form2 + '<br>' +
        //         item.dl_Price + '</div>' + '</div>';
        // });

        // document.getElementById("mainList").innerHTML = mainList;
        //         },
        //         error: function () {
        //             alert("오류 발생");
        //         }
        //     });
        // });
    </script>

    <p style="font-size:large"></p>
</body>

</html>