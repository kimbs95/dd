<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>공실센터</title>
        <!-- 제이쿼리 -->
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <!--CSS-->
        <link rel="stylesheet" href="/css/gongsilCenter.css">
        <!--JS-->
        <script src="/js/dealingJS/gongsilCenter.js"></script>
       
    </head>
    <body>
        <h1 id="mainName">공실센터</h1>
        <form id="dlSearch2">
            <div id="formChkmain">
                <div id="formChk">
                    <input type="checkbox" id="dl_Form" name="dl_Form" onclick="selectAll(this)">전체
                    <input type="checkbox" id="dl_Form" name="dl_Form" value="아파트">아파트
                    <input type="checkbox" id="dl_Form" name="dl_Form" value="원룸">원룸
                    <input type="checkbox" id="dl_Form" name="dl_Form" value="투룸">투룸+
                    <input type="checkbox" id="dl_Form" name="dl_Form" value="오피스텔">오피스텔
                    <input type="checkbox" id="dl_Form" name="dl_Form" value="주택">주택
                </div>
        </form>
        <form id="dlSearch3">
                <div id="locationChk">
                    <input type="text" id="dealingsearch" size="30px" name="dl_Address" placeholder="지역을 입력해주세요">
                    <button id="dl_search" type="button" value="매물검색" onclick="dlBtn2()">매물검색</button>
                </div>
            </div>
        </form>

        <h1>내 주변 추천 매물</h1>
        <div id="">
            <div id="mainList"></div>
        </div>
        <hr>
        <h1>검색 매물</h1>
        <div>               
            <div id="resultList"></div>
        </div>

        <script>
            /* 위치기반 매물목록 */
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
                                        '<a href="/dealingview.do?dl_Num=' + item.dl_Num + '" id="main1">' +
                                        '<div id="main2">';
                                    mainList += '<div id="main3">' + '<img src="/dealing/' + item.user_Id + '/' + item.dl_Image +
                                        '" alt="매물사진" id="main4">' +
                                        '</div>';
                                    mainList += '<div id="main5">' + '<span id="main6">' + item.dl_Title + '</span>' +
                                        '<h4>' + item.dl_Form + '<br>' + item
                                        .dl_Address + '<br>' +
                                        item.dl_Form2 + '<br>￦ ' + item.dl_Price +
                                        '<br>옵션 : ' + item.dl_Option +
                                        '</h4></div>' + '</div></a>';

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
        </script>
    </body>

    </html>