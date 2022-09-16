<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>부동산 메인</title>
    <!-- css -->
    <link rel="stylesheet" type="text/css" href="/css/main.css">
    
</head>
<body>
    <div id="main1">
        <!--아래 form 부분 중앙정렬 검토필요-->
        <form> 
            <ul class="search">
                <li><button type="submit" value="all">전체</button> </li>
                <li><button type="submit" value="apt">아파트</button> </li>
                <li><button type="submit" value="two-room">투룸+</button> </li>
                <li><button type="submit" value="room">원룸</button> </li>
                <li><button type="submit" value="op">오피스텔</button> </li>
                <li><button type="submit" value="villa">주택</button> </li>
            </ul>
        </form>
        <div id="search">
            <!-- <ul>
                <li><button type="submit"></button></li>
            </ul> -->
            <form   action="" style="display:inline-flex;  margin-top: 25px;">
                <input class="dealingsearch" type="search" name="검색" placeholder="검색어 입력" /><input type="submit" value="검색"></form>
            </form>
        </div>        
    </div>
    
    <div id="main2">
        <form>
            <!-- 위치기반 API OO동 추천매물 -->
        </form>
            <!-- 추천매물 리스트 -->
            <div id="main2_1" style="display: flex;">
                <form action="#">
                    <input type="submit" class="img-button" value="">
                     <!--매물 정보 텍스트창 구현 필요  -->
                </form>
                <form action="#">
                    <input type="submit" class="img-button" value="">  
                    <!--매물 정보 텍스트창 구현 필요  -->
                </form>
                <form action="#">
                    <input type="submit" class="img-button" value=""> 
                    <!--매물 정보 텍스트창 구현 필요  -->
                </form>
                <form action="#">
                    <input type="submit" class="img-button" value=""> 
                    <!--매물 정보 텍스트창 구현 필요  -->
                </form>
                <form action="#">
                    <input type="submit" class="img-button" value=""> 
                    <!--매물 정보 텍스트창 구현 필요  -->
                </form>
            </div>
    </div>
    
    <div id="main3">
        <div id="avg-dong-price">
            <!-- OO동 평균월세 API 연동필요 -->
        </div>
        <div id="avg-dong-price1">
            <!-- OO동의 주변동 평균월세 API 연동필요 -->
        </div>
    </div>
    
    <h1 style="font-size: larger; margin: revert; text-align: initial;">부동산 가이드</h1>
    <div id="main4">
        <div id="guide1" style="background: red;">
            <a href="https://post.naver.com/viewer/postView.nhn?volumeNo=27011368&memberNo=2120568" style="margin: auto;"><p>허위매물방지</p></a>
        </div>
        <div id="guide2" style="background: black;">
            <a href="#" style="margin: auto;"><p>나에게 꼭 맞는<br> 방 찾는 방법!!</p></a>
        </div>
        <div id="guide3" style="background: pink;">
            <a href="#" style="margin: auto;"><p>잘나가는 방<br> 올리는 방법!!</p></a>
        </div>
        <div id="guide4" style="background: yellowgreen;">
            <a href="#" style="margin: auto;"><p>알아두면 좋은<br> 부동산 용어!!</p></a>
        </div>
        <div id="guide5" style="background: blue;">
            <a href="#" style="margin: auto;"><p>임대차 계약서 <br>작성 시 <br>꼭 알아두세요!!</p></a>
        </div>
    </div>
</body>
</html>