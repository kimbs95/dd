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
    <!--CSS-->
	<link rel="stylesheet" href="/css/Map.css">
    <!--JS-->
    <script src="/js/dealingJS/Map.js"></script>
 
</head>

<body>
    <div>
        <form id="dlReq2">
            <div id="category-menubar">
                <div id="selectbox">
                    <select id="dl_Form1" name="dl_Form">
                        <option value="">건물종류</option>
                        <option value="아파트">아파트</option>
                        <option value="원룸">원룸</option>
                        <option value="투룸">투룸+</option>
                        <option value="오피스텔">오피스텔</option>
                        <option value="주택">주택</option>
                    </select>

                    <select id="dl_Form2"name="dl_Form2">
                        <option value="">거래유형</option>
                        <option value="월세">월세</option>
                        <option value="전세">전세</option>
                        <option value="매매">매매</option>
                        <option value="단기임대">단기임대</option>
                    </select>

                    <select id="dl_Room"name="dl_Room">
                        <option value="">방 개수</option>
                        <option value=1>1개</option>
                        <option value=2>2개</option>
                        <option value=2>3개</option>
                        <option value=2>4개</option>
                        <option value=2>5개</option>
                    </select>

                    <select id="dl_Option" name="dl_Option">
                        <option value="">옵션선택</option>
                        <option value="풀옵션">풀옵션</option>
                        <option value="엘레베이터">엘레베이터</option>
                        <option value="주차가능">주차가능</option>
                        <option value="반려동물">반려동물</option>
                        <option value="신축">신축</option>
                    </select>
                    
                </div>
                <div id="PriceForm">
                    <input id="dl_Price_p" name="dl_Price" type="number" placeholder="최대가격을 적어주세요.">원
                    <input type="text" id="dealingsearch" size="30px" name="dl_Address" placeholder="지역을 입력해주세요">
                    <button id="dl_Search_Btn" type="button"value="매물검색" onclick="dlBtn()">매물검색</button>
                </div>
            </div>
            <div id="prs-position">
                
                <!--코드 생성 해야함-->
                
                    <script>
                            document.querySelector("#dealingsearch").addEventListener("keydown",(e)=>{
                                console.log(e);
                                if(e.code ==="Enter"){
                                    
                                    document.querySelector("#dlReq2").submit();
                                }
                            })
                    </script>
            </div>
        </form>
    <!----------------------------------------------지도------------------------------------------>
        <div id="MapForm">
            <div id="map"></div>
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
//////////////////////////////////////////////map ajax////////////////////////////////////////////
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
                                resultList += '<input type="hidden" name ="dl_Num" value="' + item.dl_Num + '">';
                                resultList += '<button id="result1"type="submit" >';
                                resultList += '<div id="result2"><img src="/dealing/'+item.user_Id+'/'+item.dl_Image+'" alt="매물사진" id="result3">' ;
                                resultList += '<p id="result4">'+ item.dl_Title +'</p><p id="result5">'+item.dl_Address +'</p><span id="result6">'+item.dl_Form 
                                   +'</span>'+ item.dl_Form2 +'<p id="result7">옵션 : '+item.dl_Option+'</p><p id="result8">￦ '+
                                    item.dl_Price +'</p></div></button>'+'</form>';

                        })
                        //console.log(resultList);
                        document.getElementById("resultList").innerHTML = resultList;
                    },
                    error: function () {
                        alert("오류발생");
                    }


                });
            });

///////////////////////////////////////////검색기능////////////////////////////////////////////////
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
                                resultList += '<button id="res1" type="submit">'
                                    
                                resultList += '<div id="res2">';
                                resultList += '<div>' +
                                    '<img src="../image/sample01.jpg" id="res3">'+'</div>';
                                resultList += '<div id="res4">'+'매물번호'+'<br>'+ item.dl_Num +'<br><br>'+'매물이름'+'<br>' + item.dl_Title + '<br><br>' + item.dl_Form +
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
            <div id="resultListForm">
                <div id="resultList">
                    <!------------매물 리스트 나오는 곳-------------->
                </div>
            </div>
        </div>
    </div>
  </body>
</html>