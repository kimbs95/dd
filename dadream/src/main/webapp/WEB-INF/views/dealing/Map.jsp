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

        .dealingcontent>* {
            margin-bottom: 5px;
        }

        #dlli {
            border-bottom: 1px solid #ccc;
            margin-bottom: 10px;
        }
       
    </style>

</head>

<body>
    <div>
        <form id="dlReq2">
            <div id="category-menubar">
                <div id="selectbox" style="display: flex; width: 940px; height: 30px;margin-top: 30px;">
                    <select id="asd" name="dl_Form" style="width: 100px; height: 25px; text-align: center;">
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
                <input type="text" size="30px" name="dl_Address" placeholder="지역을 적어주세요."><button type="button"
                    value="매물검색" onclick="dlBtn()" style="margin-left:40px;">매물검색</button>
            </div>
        </form>
        <!--지도-->
        <div style="display: flex;">
            <div id="map" style="width:1100px; height:1000px; right: 10px; top:20px;"></div>
            <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d1a9a1b185a416c4c43f9c88915f8650&libraries=services">
            </script>
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

                var dl_Form = "${dl_Form}";
                var dl_Address = "${dl_Address}";
                console.log(dl_Form);
                console.log(dl_Address);

            $( document ).ready(function() {
                //map ajax
                $.ajax({
                    url: "/showMap.do",
                    type: "get",
                    async: false,
                    dataType: "json",
                    data: {
                        "dl_Lat": "36.3492687452282",
                        "dl_Lng": "127.3776153193601",
                        dl_Form,
                        dl_Address
                    },
                    success: function (dlMap) {
                        if (dlMap.length == 0) {
                            alert('검색한 매물이 없습니다.');
                            //window.location.replace();
                            window.history.back();
                        }

                        //console.log(dlMap[0].dl_Lat);
                        //console.log(dlMap[0].dl_Lng);
                        //반복문으로 마커 생성
                        markers = [];

                        var bounds = new kakao.maps.LatLngBounds()

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

                            bounds.extend(latlng);

                            // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
                            // 이벤트 리스너로는 클로저를 만들어 등록합니다 
                            // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
                            kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map,
                                marker, infowindow));
                            kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(
                                infowindow));
                        }

                        map.setBounds(bounds);

                        dlMap2 = dlMap;

                        var resultList = "";
                        $.each(dlMap, function (index, item) {

                            resultList += '<form action="${contextPath}/dealingview.do" method="get">'
                                resultList += '<input type="hidden" value="${item.dl_Num}" >'
                                resultList += '<button type="submit" style="width:450px; height:300px; background-color:white; border:outset;">'
                                    
                                resultList += '<div style="display: flex; border-bottom: 1px solid #ccc; margin-bottom: 20px; margin-left: 30px;">';
                                resultList += '<div>' +
                                    '<img src="../image/sample01.jpg" alt="" width="200px" height="190px">' +
                                    '</div>';
                                resultList += '<div style="flex-grow:1; margin:auto; line-height:14px; font-weight:bold; color:darkorange">'+'매물번호'+'<br>'+ item.dl_Num +'<br><br>'+'매물이름'+'<br>' + item.dl_Title + '<br><br>' + item.dl_Form +
                                    '<br><br>'+'거래유형'+'<br>' + item.dl_Form2 + '<br><br>' +'가격'+'<br>'+
                                    item.dl_Price + '</div>' + '</div>'+'</button>'+'</form>';

                        })
                        //console.log(resultList);
                        document.getElementById("resultList").innerHTML = resultList;
                    },
                    error: function () {
                        alert("오류발생");
                    }


                });
            });

                //검색기능
                function dlBtn() {
                    var dlSearch = $('#dlReq2').serialize();
                    console.log(dl_Form);
                    console.log(dl_Address);
                    var dl_Form = null;
                    var dl_Address = null;
                    window.localStorage.clear();
                    window.localStorage.setItem("dlLocalStorage", dlSearch);
                    $.ajax({
                        url: "showMap2.do",
                        type: "get",
                        async: false,
                        data: dlSearch,
                        dataType: "json",
                        success: function (dlReq) {
                            if (dlReq.length == 0) {
                                alert("검색조건이 없습니다.");
                                // window.location.reload();
                                return;
                            }
                            console.log(dlReq);
                            console.log(dlMap2);

                            var bounds = new kakao.maps.LatLngBounds()

                            //반복문으로 마커 삭제
                            // FIXME: markers undefined 체크
                            if (markers) {
                                for (var i = 0; i < markers.length; i++) {
                                    markers[i].setMap(null);
                                }
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

                            //console.log(dlReq);

                            var resultList = "";
                            $.each(dlReq, function (index, item) {
                                resultList += '<form action="${contextPath}/dealingview.do" method="get">'
                                resultList += '<input type="hidden" value="${item.dl_Num}" >'
                                resultList += '<button type="submit" style="width:450px; height:300px; background-color:white; border:outset;">'
                                    
                                resultList += '<div style="display: flex; border-bottom: 1px solid #ccc; margin-bottom: 20px; margin-left: 30px;">';
                                resultList += '<div>' +
                                    '<img src="../image/sample01.jpg" alt="" width="200px" height="190px">' +
                                    '</div>';
                                resultList += '<div style="flex-grow:1; margin:auto; line-height:14px; font-weight:bold; color:darkorange">'+'매물번호'+'<br>'+ item.dl_Num +'<br><br>'+'매물이름'+'<br>' + item.dl_Title + '<br><br>' + item.dl_Form +
                                    '<br><br>'+'거래유형'+'<br>' + item.dl_Form2 + '<br><br>' +'가격'+'<br>'+
                                    item.dl_Price + '</div>' + '</div>'+'</button>'+'</form>';

                            })
                            //console.log(resultList);
                            document.getElementById("resultList").innerHTML = resultList;
                        },
                        error: function () {
                            alert("오류발생");
                        }
                    });
                    
                }
                

            </script>

            <div style="width: 500px; height:1000px; overflow-y: auto;">
                
                <div id="resultList"></div>
                
        
            </div>
            <!-- <div id="resultList"></div>
            <div id="mapside"
                style="background:rgb(116, 111, 111);margin-left: 30px; width:700px; margin-top:18px;height: 1000px; overflow-y: scroll;">
                <c:forEach var="allListdealing" items="${allListdealing}">
                    <div class="dealing_list" style="display: flex; margin-top: 10px;">

                        <div class="dealingimg">
                            <a href="${contextPath}/dealingview.do">
                                <img src="../메인 카테고리 사진/스텐드.png" alt="" width="200px" height="170px">
                            </a>
                        </div>
                        <div class="dealingcontent">
                            <h1 style="font-weight: bold; font-size: 19px;">${allListdealing.dl_Title}</h1>
                            <h3><span style="font-weight: bold;">가격 : </span>${allListdealing.dl_Price}</h3>
                            <p>${allListdealing.dl_Content}</p>
                        </div>
                    </div>
                </c:forEach>
            </div> -->
        </div>
    </div>
</body>

</html>