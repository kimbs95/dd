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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Map</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <style>
        #range1::-webkit-slider-thumb {
            -webkit-appearance: none;
            appearance: none;
        }
        .dealingcontent > *{
            margin-bottom: 5px;
        }
    </style>

</head>

<div>
    <form id="dlReq2">
        <div id="category-menubar">
            <div id="selectbox" style="display: flex; width: 940px; height: 30px;margin-top: 30px;">
                <select id="asd" name="dl_Form1" style="width: 100px; height: 25px; text-align: center;">
                    <option value="">건물종류</option>
                    <option value="아파트">아파트</option>
                    <option value="원룸">원룸</option>
                    <option value="투룸">투룸+</option>
                    <option value="오피스텔">오피스텔</option>
                    <option value="주택">주택</option>
                </select>

                <select name="dl_Form2" style="width: 100px; height: 25px; text-align: center;">
                    <option value="">매매종류</option>
                    <option value="월세">월세</option>
                    <option value="전세">전세</option>
                    <option value="매매">매매</option>
                    <option value="단기임대">단기임대</option>
                </select>

                <select name="dl_Room" style="width: 100px; height: 25px; text-align: center;">
                    <option value="">방 개수</option>
                    <option value=1>원룸</option>
                    <option value=2>투룸+</option>
                </select>

                <!-- db에 층수에 관한 컬럼이 없음 -->
                <!-- <select style="width: 100px; height: 25px; text-align: center;">
                <optgroup label="층수">
                    <option>1~5층</option>
                    <option>6층이상</option>
                    <option>옥탑</option>
                    <option>지하</option>
                    <option>반지하</option>
                </optgroup>
            </select> -->

                <select name="dl_Option" style="width: 100px; height: 25px; text-align: center;">
                    <option value="">옵션선택</option>
                    <option value="풀옵션">풀옵션</option>
                    <option value="엘레베이터">엘레베이터</option>
                    <option value="주차가능">주차가능</option>
                    <option value="반려동물">반려동물</option>
                    <option value="신축">신축</option>
                </select>
                <div>
                    <input name="dl_Price" type="text" placeholder="최대가격을 적어주세요." style="text-align: center;">원
                </div>

            </div>
        </div>
        <div id="prs-position" style="display:flex; width: 700px;">
            <input type="button" value="현 위치" action="#">
            <!--코드 생성 해야함-->
            <address>&nbsp;대전광역시 서구 둔산동 오라클빌딩</address>
            <input type="text" size="30px" name="dl_Address" placeholder="지역을 적어주세요."><button type="button" value="매물검색"
                onclick="dlBtn()" style="margin-left:40px;">매물검색</button>
        </div>
    </form>
    <!--지도-->
    <div style="display: flex;">
    <div id="map" style="width:1100px; height:1000px;right: 10px; top:20px"></div>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d1a9a1b185a416c4c43f9c88915f8650&libraries=services"></script>
    <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(36.3492687452282, 127.3776153193601), // 지도의 중심좌표
                level: 3, // 지도의 확대 레벨
                mapTypeId: kakao.maps.MapTypeId.ROADMAP // 지도종류
            };

        // 지도를 생성한다 
        var map = new kakao.maps.Map(mapContainer, mapOption);

        // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
        function makeOverListener(map, marker, infowindow) {
            return function () {
                infowindow.open(map, marker);
            };
        }

        // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
        function makeOutListener(infowindow) {
            return function () {
                infowindow.close();
            };
        }

        


        //map ajax
        $.ajax({
            url: "/showMap.do",
            type: "get",
            async: false,
            data: {
                "dl_Lat": "36.3492687452282",
                "dl_Lng": "127.3776153193601",
                
            },
            success: function (dlMap) {
                // console.log(dlMap[0].dl_Lat);
                // console.log(dlMap[0].dl_Lng);
                //반복문으로 마커 생성
                markers = [];

                for (var i = 0; i < dlMap.length; i++) {

                    //위도+경도
                    var latlng = new kakao.maps.LatLng(dlMap[i].dl_Lat, dlMap[i].dl_Lng);
                    // 마커를 생성합니다
                    var marker = new kakao.maps.Marker({
                        map: map, // 마커를 표시할 지도
                        position: latlng // 마커를 표시할 위치
                        //title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                    });

                    // 마커에 표시할 인포윈도우를 생성합니다 
                    var infowindow = new kakao.maps.InfoWindow({
                        content: dlMap[i].dl_Title // 인포윈도우에 표시할 내용
                    });

                    markers[i] = marker;

                    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
                    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
                    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
                    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map,
                        marker, infowindow));
                    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(
                        infowindow));
                }

                dlMap2 = dlMap;
            },
            error: function () {
                alert("오류발생");
            }


        });

        function dlBtn() {
            var dlSearch = $('#dlReq2').serialize();

            $.ajax({
                url: "showMap2.do",
                type: "get",
                data: dlSearch,
                success: function (dlReq) {
                    if (dlReq.length == 0) {
                        alert("검색조건이 없습니다.");
                        window.location.reload();
                    }
                    console.log(dlReq);
                    console.log(dlMap2);

                    var bounds = new kakao.maps.LatLngBounds()

                    //반복문으로 마커 삭제
                    for (var i = 0; i < dlMap2.length; i++) {
                        markers[i].setMap(null);
                    }

                    for (var i = 0; i < dlReq.length; i++) {
                        markers[i].setMap(null);
                    }

                    //반복문으로 마커 생성
                    for (var i = 0; i < dlReq.length; i++) {

                        //위도+경도
                        var latlng = new kakao.maps.LatLng(dlReq[i].dl_Lat, dlReq[i].dl_Lng);
                        // 마커를 생성합니다
                        var marker = new kakao.maps.Marker({
                            map: map, // 마커를 표시할 지도
                            position: latlng // 마커를 표시할 위치
                            //title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                        });

                        // 마커에 표시할 인포윈도우를 생성합니다 
                        var infowindow = new kakao.maps.InfoWindow({
                            content: dlReq[i].dl_Title // 인포윈도우에 표시할 내용
                        });

                        markers[i] = marker;
                        bounds.extend(latlng);

                        // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
                        // 이벤트 리스너로는 클로저를 만들어 등록합니다 
                        // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
                        kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map,
                            marker, infowindow));
                        kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(
                            infowindow));
                    }

                    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                    map.setBounds(bounds);

                },
                error: function () {
                    alert("검색조건을 다 기입해주세요.");
                }
            });


        }

      
    </script>
    <div id="mapside"
        style="background:rgb(116, 111, 111);margin-left: 30px; width:700px; margin-top:18px;height: 1000px; overflow-y: scroll;">
        <c:forEach var="allListdealing" items="${allListdealing}">
            <div class="dealing_list" style="display: flex; margin-top: 10px;" >

                <div class="dealingimg">
                    <a href="">
                        <img src="../메인 카테고리 사진/스텐드.png" alt="" width="200px" height="170px">
                    </a>
                </div>
                <div class="dealingcontent" >
                    <h1 style="font-weight: bold; font-size: 19px;">${allListdealing.dl_Title}</h1>
                    <h3><span style="font-weight: bold;">가격 : </span>${allListdealing.dl_Price}</h3>
                    <p>${allListdealing.dl_Content}</p>
                </div>
            </div>
        </c:forEach>
    </div>
    </div>
</div>
</body>

</html>