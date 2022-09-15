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

    <style>
        #range1::-webkit-slider-thumb{
            -webkit-appearance:none; 
            appearance: none;
        }
        
    </style>
</head>
<body>
    <div id="category-menubar">
        <div id="selectbox" style="display: flex; width: 940px; height: 30px;">
            <select id="asd" style="width: 100px; height: 25px; text-align: center;">
                <option>건물형태</option>
                <option>아파트</option>
                <option>원룸</option>
                <option>투룸+</option>
                <option>오피스텔</option>
                <option>주택</option>
            </select>

            <select  style="width: 100px; height: 25px; text-align: center;">
                <option>매물종류</option>
                <option>월세</option>
                <option>전세</option>
                <option>매매</option>
                <option>단기임대</option>
            </select>

            <select  style="width: 100px; height: 25px; text-align: center;">
                <option>방 개수</option>
                <option>원룸</option>
                <option>투룸+</option>
            </select>

            <select  style="width: 100px; height: 25px; text-align: center;">
                <option>층수</option>
                <option>1~5층</option>
                <option>6층이상</option>
                <option>옥탑</option>
                <option>지하</option>
                <option>반지하</option>
            </select>

            <select  style="width: 100px; height: 25px; text-align: center;">
                <option>추가 옵션</option>
                <option>풀옵션</option>
                <option>엘레베이터</option>
                <option>주차가능</option>
                <option>반려동물</option>
                <option>신축</option>
            </select>


            <label for="range1" style="display: flex; width:200px;height:25px;">보증금
                <input id="range1" type="range" min="0" max="10" step="1" value="5" />
                <div id="val_range1" style="width: 5px;height: 5px;">5</div>
            </label>
            &nbsp;&nbsp;
            <label for="range1" style="display: flex; width:200px;height:25px;">월세
                <input id="range1" type="range" min="0" max="10" step="1" value="5" />
                <div id="val_range1" style="width: 5px;height: 5px;">5</div>
            </label>
            <script>
                document.querySelector("#range1").addEventListener("input", function(e) {
                    document.querySelector("#val_range1").innerHTML = e.target.value;
                });
            </script>
            
        </div>
    </div>
    <div id="prs-position" style="display:flex; width: 700px;">
        <input type="button" value="현 위치" action="#"><!--코드 생성 해야함-->
        <address>&nbsp;대전광역시 서구 둔산동 오라클빌딩</address>
        <button type="submit" name="매물검색" action="#" style="margin-left:40px;"></button><input type="text" size="30px" name="검색창" placeholder="내용을 입력해주세요.">
    </div>

    <div id="map" style="border: 0.5px solid grey; width: 1920px; height: 960px; display: flex;">
        <div id="mapview" style="border:0.3px solid black; width: 1200px; height: 959px;">

        </div>

        <div id="dealing-list" style="border:0.3px solid black; width: 540px; height: 959px; margin-left: 180px; display: inline-block;">
            <div id="list" style="border:0.5px solid black; width: 540px; height: 300px; margin-bottom: 20px;">

            </div>

            <div id="list" style="border:0.5px solid black; width:  540px; height: 300px; margin-bottom: 20px;">

            </div>

            <div id="list" style="border:0.5px solid black; width:  540px; height: 300px; margin-bottom: 20px;">

            </div>
        </div>
    </div>

</body>
</html>