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
    <style>
        @supports (position: sticky) or (position: -webkit-sticky) {
            .sticky {
                position: sticky;
                top: 4px;
            }
        }

        .stickydiv {
            background-color: rgba(220, 220, 220, 0.322);
            position: sticky;
            top: 4px;
            transition: top 0.1s ease 0s;
            z-index: 100;
        }

        .stickydiv ul {
            list-style-type: none;
            display: flex;
            width: 1130px;
        }

        .tabli {
            width: 450px;
            height: 20px;
            text-align: center;
            margin: 15px 0
        }

        .sticky li a.active {
            color: #8A2908;
            border-bottom: 3px solid #8A2908;
            width: 450px;
        }

        .sticky li a {
            text-decoration: none;
            padding: 0 150px 11px 150px;
            color: black;
        }

        #review img {
            width: 200px;
        }

        .reviewinfo {
            display: flex;
            margin: 10px 0;
            border-bottom: 1px solid #000;
            width: 1100px;

        }

        .reviewinfo img {
            width: 200px;
            height: 200px;
        }

        .reviewinfo textarea {
            padding: 5px;
        }

        .reviewinfo #sub {
            padding: 10px;
            margin: auto;
            margin-left: 10px;
        }

        .reviewinfo p {
            padding: 5px;
            width: 800px;

        }


        .reviewText {
            height: auto;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        #reply {
            border: none;
            background: white;
            font-weight: bold;
            margin: 10px 0;
        }

        #ok {
            display: none;
        }

        .divtag {
            display: inline-flex;
        }

        #border {
            padding: 10px;
            border-top: 1px solid gray;
            margin-top: 5px;
        }

        #under,
        #sum {
            border-bottom: 1px solid #000;
        }

        #eye {
            border: none;
            background: white;
            font-weight: bold;
            margin: 10px;
        }

        .replying {
            display: none;
        }

        .formTagclass {
            display: none;
        }
        .nump,.sump{
            font-weight: bold;
            font-size: 18px;
            margin: 15px 0;
        }
        .totalprice{
            margin-top: 20px;
        }
    </style>
</head>

<body>
    <!--부트스트랩-->
    <!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <div class="first">
        <h1 style="margin:20px 0 0 10px;font-size: 35px; font: bold;"></h1>
        <br><br><br><br>
        <div class="middle">

            <!--이미지 div-->
            <div class="dlImg">

                <div class="dlMain">
                    <img src="/product/${result.user_Id}/${result.product_Image}" class="img-fluid" alt=""
                        width="650px">
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
                    <!-- <div>
                        <h3 style="text-align: left;">상품설명</h3>
                        <p>${result.product_Content}</p>
                    </div> -->
                </div>
                <div id="dlComments2">
                    <div>
                        <h3>상품가격</h3>
                        <p class="resultPrice">${result.product_Price}</p>
                    </div>
                    <div>
                        <h3>재고</h3>
                        <p>${result.product_TotalCount}</p>
                    </div>
                </div>
                <div id="dlComments3">
                    <div>
                        <h3>옵션</h3>
                        <select name="ot_1" class="select" id="ot_1">
                            <option>-</option>
                        </select>
                    </div>
                    <div>
                        <h3>추가옵션</h3>
                        <select name="ot_2" class="select" id="ot_2">
                            <option>-</option>
                            
                            
                        </select>
                    </div>
                </div>
                <div class="totalprice">
                    <p class="nump">수량 : <input type="number" class="num" min="1" value="1" step="1"></p>
                    <p class="sump">결제 금액 : <span class="sum"></span></p>
                </div>
                <script>
                    (function () {
                        let option1 = "${result.product_Option1}";
                        let ot_1 =document.querySelector("#ot_1");
                        option1 = option1.split(",");
                        for(let i = 0; i < option1.length ; i++){
                            let op1 = document.createElement("option");
                            op1.setAttribute("value",option1[i]);
                            op1.innerHTML=option1[i];
                            ot_1.appendChild(op1);
                        }

                        let option2 = "${result.product_Option2}";
                        let ot_2 =document.querySelector("#ot_2");
                        option2 = option2.split(",");
                        console.log(option2);
                        for(let i = 0; i < option2.length ; i++){
                            let op2 = document.createElement("option");
                            op2.setAttribute("value",option2[i]);
                            op2.innerHTML=option2[i];
                            ot_2.appendChild(op2);
                        }


                        // 수량 계산
                        let num = document.querySelector(".num");
                        let resultPrice = +document.querySelector(".resultPrice").textContent;
                        let sum = document.querySelector(".sum");

                        sum.textContent = (resultPrice * num.value);
                        document.querySelector(".num").addEventListener("change", (e) => {
                            sum.textContent = (resultPrice * num.value);
                        })
                    })();
                </script>
                <div id="dlComments4">
                    <div>
                        <!-- <form action="/cart.do?product_Num=${product_Num}" method="post"> -->
                        <button type="button" id="cart" class="btn btn-secondary btn-lg">장바구니</button>
                        <!-- </form> -->
                        <script>
                            let product_Nums = "${product_Num}"

                            document.addEventListener("DOMContentLoaded", () => {
                                document.querySelector("#cart").addEventListener("click", async e => {
                                    let cart = await fetch('/cart.do', {
                                        method: "POST",
                                        headers: {
                                            'content-type': 'application/json'
                                        },
                                        body: JSON.stringify({
                                            product_Num: product_Nums,
                                        })
                                    });
                                    if (cart.status === 200) {
                                        let jsondata = await cart.json();
                                        if (jsondata.result === 1) {
                                            alert("장바구니에 성공적으로 담겼습니다");
                                        }

                                    } else {
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
        <div class="stickydiv">
            <ul class="sticky">
                <li class="tabli"><a href="#content">상세설명</a></li>
                <li class="tabli"><a href="#review">리뷰</a></li>
                <li class="tabli"><a href="#change">교환/환불</a></li>
            </ul>
        </div>
        <!-- <div class="contents">
        </div> -->
        <div id="content">
            <p>${result.product_Content}</p>
        </div>

        <div id="review">
            <h1>후기</h1>
            <ul>
                <c:forEach var="i" items="${review}" varStatus="j">
                    <li class="reviewinfo">
                        <img src="/image/메인로고.png" alt="">
                        <div id="reviewInfo">
                            <p class="reviewTitle">제목 : ${i.review_Title}</p>
                            <p class="reviewText">내용 : ${i.review_Text}</p>
                            <div>
                                <p>작성자 : ${i.user_Id}</p>
                            </div>
                            <p>작성일 : ${i.review_Date}</p>
                            <form action="/reviewReply.do" method="post">
                                <div id="replyList">
                                    <div class="divtag">
                                        <textarea name="reply_Text" id="" cols="80" rows="3"></textarea>
                                        <input type="submit" id="sub" value="등록">
                                    </div>
                                    <input id="proNum" type="hidden" name="product_Num" value="${i.product_Num}">
                                    <input id="revNum" type="hidden" name="review_Num" value="${i.review_Num}">
                                </div>
                            </form>

                            <button id="eye">댓글보기</button>
                            <div id="replycopy"></div>

                            <div id="toggle" class="replying">
                                <c:forEach var="reply" items="${reply}">
                                    <c:if test="${i.review_Num == reply.review_Num}">
                                        <div id="border">
                                            <p>${reply.user_Id} : ${reply.reply_Text}</p>
                                            <p>${reply.reply_Date}</p>
                                            <p id="plus">댓글달기</p>
                                            <div id="hide" class="divtag replying">
                                                <form action="/daedatgle.do" method="post">
                                                    <div class="divtag">
                                                        <textarea name="reply_Text" id="" cols="80" rows="3"></textarea>
                                                        <input type="submit" id="sub" value="등록">
                                                    </div>
                                                    <input type="hidden" name="product_Num" value="${i.product_Num}">
                                                    <input type="hidden" name="parent_No" value="${reply.reply_Count}">
                                                    <input type="hidden" name="review_Num" value="${i.review_Num}">
                                                </form>
                                            </div>
                                            <c:forEach var="total" items="${totalReply}">
                                                <c:if test="${reply.reply_Count == total.parent_No}">
                                                    <p style="padding-left: 40px;">${total.user_Id} :
                                                        ${total.reply_Text}</p>
                                                    <p style="padding-left: 40px;">${total.reply_Date}</p>
                                                    <p style="padding-left: 40px;" id="plus">댓글달기</p>
                                                    <div style="padding-left: 40px;" id="hide" class="divtag replying">
                                                        <form action="/daedatgle.do" method="post">
                                                            <div class="divtag">
                                                                <textarea name="reply_Text" id="" cols="80"
                                                                    rows="3"></textarea>
                                                                <input type="submit" id="sub" value="등록">
                                                            </div>
                                                            <input type="hidden" name="product_Num"
                                                                value="${i.product_Num}">
                                                            <input type="hidden" name="parent_No"
                                                                value="${total.reply_Count}">
                                                            <input type="hidden" name="review_Num"
                                                                value="${i.review_Num}">
                                                        </form>
                                                    </div>
                                                    <c:forEach var="totaltwo" items="${totalReply}">
                                                        <c:if test="${total.reply_Count == totaltwo.parent_No}">
                                                            <p style="padding-left: 80px;">${totaltwo.user_Id} :
                                                                ${totaltwo.reply_Text}</p>
                                                            <p style="padding-left: 80px;">${totaltwo.reply_Date}</p>
                                                            <p id="plus" style="padding-left: 80px;">댓글달기</p>
                                                            <div style="padding-left: 80px;" id="hide"
                                                                class="divtag replying">
                                                                <form action="/daedatgle.do" method="post">
                                                                    <div class="divtag">
                                                                        <textarea name="reply_Text" id="" cols="80"
                                                                            rows="3"></textarea>
                                                                        <input type="submit" id="sub" value="등록">
                                                                    </div>
                                                                    <input type="hidden" name="product_Num"
                                                                        value="${i.product_Num}">
                                                                    <input type="hidden" name="parent_No"
                                                                        value="${totaltwo.reply_Count}">
                                                                    <input type="hidden" name="review_Num"
                                                                        value="${i.review_Num}">
                                                                </form>
                                                            </div>
                                                            <c:forEach var="totalthree" items="${totalReply}">
                                                                <c:if
                                                                    test="${totaltwo.reply_Count == totalthree.parent_No}">
                                                                    <p style="padding-left: 120px;">
                                                                        ${totalthree.user_Id} : ${totalthree.reply_Text}
                                                                    </p>
                                                                    <p style="padding-left: 120px;">
                                                                        ${totalthree.reply_Date}</p>
                                                                    <p id="plus" style="padding-left: 120px;">댓글달기</p>
                                                                    <div style="padding-left: 120px;" id="hide"
                                                                        class="divtag replying">
                                                                        <form action="/daedatgle.do" method="post">
                                                                            <div class="divtag">
                                                                                <textarea name="reply_Text" id=""
                                                                                    cols="80" rows="3"></textarea>
                                                                                <input type="submit" id="sub"
                                                                                    value="등록">
                                                                            </div>
                                                                            <input type="hidden" name="product_Num"
                                                                                value="${i.product_Num}">
                                                                            <input type="hidden" name="parent_No"
                                                                                value="${totalthree.reply_Count}">
                                                                            <input type="hidden" name="review_Num"
                                                                                value="${i.review_Num}">
                                                                        </form>
                                                                    </div>
                                                                </c:if>
                                                            </c:forEach>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                    </c:if>

                                </c:forEach>
                            </div>
                        </div>
                    </li>
                </c:forEach>
                <script>
                    // 댓글 달기
                    let reviewli = document.querySelectorAll(".reviewinfo");
                    console.log(reviewli);
                    let sub = [...document.querySelectorAll("#sub")];
                    console.log("sub" + sub.length);
                    for (let i = 0; i < reviewli.length; i++) {
                        reviewli[i].addEventListener("click", (e) => {
                            if (!e.target.matches("#sub")) {
                                return;
                            }
                            if ("${member.user_Id}" === '') {
                                alert("로그인 후 작성 가능합니다");
                                if (!confirm("로그인 하시겠습니까?")) {
                                    e.preventDefault();
                                } else {
                                    location.href = "/login.do";
                                    e.preventDefault();
                                }
                            } else {
                                if (!confirm("댓글을 다시겠습니까?")) {
                                    e.preventDefault();
                                    return;
                                }
                                alert("댓글이 달렸습니다.");
                            }
                        })
                    }

                    // 댓글보이게
                    let eye = document.querySelectorAll("#eye");
                    let toggle = document.querySelectorAll("#toggle");
                    // console.log(document.querySelectorAll("#toggle"));
                    // console.log(eye);
                    // console.log(eye.length);
                    for (let i = 0; i < eye.length; i++) {

                        eye[i].addEventListener("click", (e) => {
                            document.querySelectorAll("#toggle")[i].classList.toggle("replying");
                        })
                    }
                    //대 대댓글 작성
                    let plus = document.querySelectorAll("#plus");
                    console.log(plus);
                    for (let i = 0; i < plus.length; i++) {
                        plus[i].addEventListener("click", () => {
                            document.querySelectorAll("#hide")[i].classList.toggle("replying");
                        })
                    }
                </script>
            </ul>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <!-- 상품리뷰 -->
        <script>
            $(function () {
                $('.sticky a').click(function () {
                    $('.sticky a').removeClass('active');
                    $(this).addClass('active');
                }).filter(':eq(0)').click();
            });
        </script>
</body>

</html>