<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>가구 물건수정</title>
    <!--팝업창-->
    <script>
        function showPopup() {
            window.open("call.html", "중개사번호", "width=400, height=500, top=200 left=600");
        }
    </script>
    <!-- 슬라이드-->
    <link type="text/css" rel="stylesheet" href="css/lightslider.css" />
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/lightslider.js"></script>

    <!--부트스트랩-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- css -->
    <link rel="stylesheet" href="/css/productview.css">
</head>

<body>
    <!--부트스트랩-->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <div class="first">
        <h1 style="margin:20px 0 0 10px;font-size: 35px; font: bold;"></h1>
        <br><br><br><br>
        <div class="middle">

            <!--이미지 div-->
            <div class="dlImg">

                <div class="dlMain">
                    <img src="/product/${result.user_Id}/${result.product_Image}" class="img-fluid" alt="" width="650px">
                </div>

                <div class="dlThumbnail1">
                    <div class="dlThumbnail2">
                        <img src="../image/메인로고.png" class="img-thumbnail" alt="">
                    </div>
                    <div class="dlThumbnail2">
                        <img src="../image/메인로고.png" class="img-thumbnail" alt="">
                    </div>
                    <div class="dlThumbnail2">
                        <img src="../image/메인로고.png" class="img-thumbnail" alt="">
                    </div>
                    <div class="dlThumbnail2">
                        <img src="../image/메인로고.png" class="img-thumbnail" alt="">
                    </div>
                </div>
            </div>

            <!--상품 설명-->
            <div class="dlComments">
                <div class="dlComments1">
                    <div>
                        <h3 style="text-align: left;">상품제목</h3>
                        <!-- <h5 style="text-align: left;">상품평</h5> -->
                        <p>${result.product_Name}</p>
                    </div>
                    <div>
                        <h3 style="text-align: left;">상품설명</h3>
                        <p>${result.product_Content}</p>
                    </div>
                </div>
                <div id="dlComments2">
                    <div>
                        <h3>상품가격</h3>
                        <p>${result.product_Price}</p>
                    </div>
                    <div>
                        <h3 >수량</h3>
                        <p>${result.product_TotalCount}</p>
                    </div>
                </div>
                <div id="dlComments3">
                    <div>
                        <h3 >옵션</h3>
                        <select name="ot_1" class="select" id="ot_1">
                            <option>-</option>
                            <option>크기2</option>
                            <option>크기3</option>
                        </select>
                    </div>
                    <div>
                        <h3 >추가옵션</h3>
                        <select name="ot_2" class="select" id="ot_2">
                            <option>-</option>
                            <option>크기2</option>
                            <option>크기3</option>
                        </select>
                    </div>
                </div>
                <div id="dlComments4">
                    <div>
                        <!-- <form action="/cart.do?product_Num=${product_Num}" method="post"> -->
                        <button type="button" id="cart" class="btn btn-secondary btn-lg">장바구니</button>
                        <!-- </form> -->
                        <script>
                            let product_Nums ="${product_Num}"
                            
                            document.addEventListener("DOMContentLoaded", () => {
                                document.querySelector("#cart").addEventListener("click", async e => {
                                    let cart = await fetch('/cart.do', {
                                        method: "POST",
                                        headers: {
                                            'content-type': 'application/json'
                                        },
                                        body: JSON.stringify({
                                            product_Num : product_Nums,
                                        }) 
                                    });
                                    if(cart.status===200){
                                        let jsondata = await cart.json();
                                        if(jsondata.result === 1){
                                            alert("장바구니에 성공적으로 담겼습니다");
                                        }
                                            
                                    }else{
                                        alert("예상치 못한 오류입니다.");
                                    }
                                });
                            })
                        </script>
                        <button type="button" class="btn btn-secondary btn-lg" onclick="showPopup();">
                            구매하기</button>
                            
                    </div>
                </div>

            </div>
        </div>
        <h3>상세정보</h3>
        <div id="Detailtab1" class="dinfo_1">
            <ul class="detail_tab tab4">
                <li class="on"><a href="#Detailtab1"><img alt="상품상세정보 보기"
                            src="http://image.lotteimall.com/imall_ec/site/images/detail/tab_01_on.gif"></a></li>
                <li><a href="#Detailtab2"><img alt="고객상품평 목록"
                            src="http://image.lotteimall.com/imall_ec/site/images/detail/tab_02_off.gif"><span
                            id="gdasTotalCnt_1">(1)</span></a></li>
                <li><a href="#Detailtab3"><img alt="상품 Q&amp;A 목록"
                            src="http://image.lotteimall.com/imall_ec/site/images/detail/tab_03_off.gif">
                        <span>(3)</span></a></li>
                <li><a href="#Detailtab4"><img alt="배송/반품/교환 안내 보기"
                            src="http://image.lotteimall.com/imall_ec/site/images/detail/tab_04_off.gif"></a></li>
            </ul>
            <div id="dlcontents">
                <p>이미지</p>
            </div>
        </div>
        <h3>상품평</h3>
        <div id="Detailtab2" class="dinfo_2">
            <ul class="detail_tab tab4">
                <li><a href="#Detailtab1"><img alt="상품상세정보 보기"
                            src="http://image.lotteimall.com/imall_ec/site/images/detail/tab_01_off.gif"></a></li>
                <li class="on"><a href="#Detailtab2"><img alt="고객상품평 목록"
                            src="http://image.lotteimall.com/imall_ec/site/images/detail/tab_02_on.gif"><span
                            id="gdasTotalCnt_2">(1)</span></a></li>
                <li><a href="#Detailtab3"><img alt="상품 Q&amp;A 목록"
                            src="http://image.lotteimall.com/imall_ec/site/images/detail/tab_03_off.gif">
                        <span>(3)</span></a></li>
                <li><a href="#Detailtab4"><img alt="배송/반품/교환 안내 보기"
                            src="http://image.lotteimall.com/imall_ec/site/images/detail/tab_04_off.gif"></a></li>
            </ul>
            tab2
        </div>
        <h3>상품Q&A</h3>
        <div id="Detailtab3" class="dinfo_3">
            <ul class="detail_tab tab4">
                <li><a href="#Detailtab1"><img alt="상품상세정보 보기"
                            src="http://image.lotteimall.com/imall_ec/site/images/detail/tab_01_off.gif"></a></li>
                <li><a href="#Detailtab2"><img alt="고객상품평 목록"
                            src="http://image.lotteimall.com/imall_ec/site/images/detail/tab_02_off.gif"><span
                            id="gdasTotalCnt_2">(1)</span></a></li>
                <li class="on"><a href="#Detailtab3"><img alt="상품 Q&amp;A 목록"
                            src="http://image.lotteimall.com/imall_ec/site/images/detail/tab_03_on.gif">
                        <span>(3)</span></a></li>
                <li><a href="#Detailtab4"><img alt="배송/반품/교환 안내 보기"
                            src="http://image.lotteimall.com/imall_ec/site/images/detail/tab_04_off.gif"></a></li>
            </ul>
            tab3
        </div>
        <h3>배송/반품/교환</h3>
        <div id="Detailtab4" class="dinfo_4">
            <ul class="detail_tab tab4">
                <li><a href="#Detailtab1"><img alt="상품상세정보 보기"
                            src="http://image.lotteimall.com/imall_ec/site/images/detail/tab_01_off.gif"></a></li>
                <li><a href="#Detailtab2"><img alt="고객상품평 목록"
                            src="http://image.lotteimall.com/imall_ec/site/images/detail/tab_02_off.gif"><span
                            id="gdasTotalCnt_2">(1)</span></a></li>
                <li><a href="#Detailtab3"><img alt="상품 Q&amp;A 목록"
                            src="http://image.lotteimall.com/imall_ec/site/images/detail/tab_03_off.gif">
                        <span>(3)</span></a></li>
                <li class="on"><a href="#Detailtab4"><img alt="배송/반품/교환 안내 보기"
                            src="http://image.lotteimall.com/imall_ec/site/images/detail/tab_04_on.gif"></a></li>
            </ul>
            tab4
        </div>
</body>

</html>