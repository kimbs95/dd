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

    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <!--팝업창-->
    <script>
        function showPopup() {
            window.open("${contextPath}/call.do", "중개사번호", "width=400, height=500, top=200 left=600");
        }

        function showPopup2() {
            window.open("${contextPath}/rpPopUp.do?dl_Num=${DealingContents.dl_Num}", "신고하기",
                "width=500, height=600, top=200 left=600");
        }
    </script>
    <!--부트스트랩-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- css -->
    <link rel="stylesheet" href="/css/dealingview.css">
</head>

<body>
    <!--부트스트랩-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <div class="first">
        <h1 class="title">매물정보</h1>

        <div class="middle">

            <!--이미지 div-->
            <div class="dlImg">
                <div class="dlMain">
                    <img src="/dealing/${DealingContents.user_Id}/${DealingContents.dl_Image}">
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

                <!-------------------------------건물명,주소------------------------------->
                <div class="dlComments1">
                    <p>매물명</p>
                    <input type="text" value="${DealingContents.dl_Title}" name="dl_Title" disabled
                        style="text-align: center;">
                    <p>상세 주소</p>
                    <input type="text" value="${DealingContents.dl_Address}" name="dl_Address" maxlength="50"
                        style="width: 300px; height: 50px; text-align: center;" disabled>
                </div>
                <br><br>
                <!-------------------------------방종류, 층수------------------------------->
                <div id="dlComments2">
                    <div class="">
                        <p>건물 유형</p>
                        <input type="text" value="${DealingContents.dl_Form}" name="dl_Form" size="10" disabled
                            style="text-align: center;">
                    </div>
                    <div class="">
                        <p>매물 유형</p>
                        <input type="text" value="${DealingContents.dl_Form2}" name="dl_Form2" disabled
                            style="text-align: center; width: 106px;"></td>
                    </div>
                </div>

                <!-------------------------------가격,매물종류------------------------------->
                <div id="dlComments3">
                    <div>
                        <p>옵션</p>
                        <input type="text" value="${DealingContents.dl_Option}" name="dl_Form2" disabled
                            style="text-align: center;">
                        <p>가격</p>
                        <input type="text" value="${DealingContents.dl_Price}" name="dl_Price" disabled
                            style="text-align: center;">
                        <div style="display: flex; justify-content:center">
                            <!-- 하트 찜  -->
                            <div class="heart"></div>
                            <button type="button" id="call" class="btn btn-secondary btn-lg"
                                onclick="showPopup();">전화하기</button>
                        </div>
                    </div>
                    <!-------------------------------판매자 전화번호------------------------------->

                </div>
            </div>
        </div>
        <div id="dlcontents">
            <textarea rows="20" cols="147" value="${DealingContents.dl_Content}" name="dl_Content"
                disabled>${DealingContents.dl_Content } </textarea>
        </div>
        <div id="reportbtn">
            <button type="button" class="btn btn-secondary btn-lg" onclick="showPopup2();">신고합니다</button>
        </div>
    </div>

    <!-- 찜하기 -->
    <script>
        //처음 들어갈때 찜 여부 체크
        var dl_Num = "${DealingContents.dl_Num}";
        var result2 = null;
        console.log("dl_Num" + dl_Num);
        $(document).ready(function () {
            $(".heart").css("backgroundImage", "url(../image/heart_default.png)");
            $(".heart").css("width", "24px");
            $(".heart").css("height", "24px");
            $(".heart").css("margin-top", "13%");
            $(".heart").css("margin-right", "50px");
            $.ajax({
                url: "jjimCheck.do",
                type: "post",
                data: {
                    dl_Num
                },
                success: function (result) {
                    console.log("result" + result);
                    result2 = result;
                    if (result == 0) {
                        $(".heart").css("backgroundImage", "url(../image/heart_default.png)");
                        $(".heart").css("width", "24px");
                        $(".heart").css("height", "24px");
                        $(".heart").css("margin-top", "13%");
                        $(".heart").css("margin-right", "50px");
                        return;
                    } else {
                        $(".heart").css("backgroundImage", "url(../image/heart_fill.png)");
                        $(".heart").css("width", "24px");
                        $(".heart").css("height", "24px");
                        $(".heart").css("margin-top", "13%");
                        $(".heart").css("margin-right", "50px");
                    }
                },
                error: function () {}
            });
        });

        //좋아요 찜 클릭
        var user_Id = "${user_Id}";
        console.log(user_Id);
        $(".heart").click(function () {
            console.log(result2);
            if (result2 == 0) {
                $.ajax({
                    url: "jjim.do",
                    type: "get",
                    data: {
                        dl_Num
                    },
                    success: function () {
                        alert("찜 하기를 등록하셨습니다.");
                        $(".heart").css("backgroundImage", "url(../image/heart_fill.png)");
                        $(".heart").css("width", "24px");
                        $(".heart").css("height", "24px");
                        $(".heart").css("margin-top", "13%");
                        $(".heart").css("margin-right", "50px");
                        result2 = 1;
                        return;
                    },
                    error: function () {
                        alert("찜 하기를 실패했습니다.");
                        return;
                    }
                });
            }
            if (result2 == 1) {
                $.ajax({
                    url: "jjimRemove.do",
                    type: "get",
                    data: {
                        dl_Num
                    },
                    success: function () {
                        alert("찜하기를 취소 했습니다.");
                        $(".heart").css("backgroundImage", "url(../image/heart_default.png)");
                        $(".heart").css("width", "24px");
                        $(".heart").css("height", "24px");
                        $(".heart").css("margin-top", "13%");
                        $(".heart").css("margin-right", "50px");
                        result2 = 0;
                        return;
                    },
                    error: function () {
                        alert("찜 취소 실패");
                        return;
                    }
                });
            }
        });
    </script>
</body>

</html>