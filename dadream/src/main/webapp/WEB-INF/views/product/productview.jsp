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
            height: 70px;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        #ok {
            display: none;
        }

        .divtag {
            display: inline-flex;
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
                        <p>${result.product_Price}</p>
                    </div>
                    <div>
                        <h3>수량</h3>
                        <p>${result.product_TotalCount}</p>
                    </div>
                </div>
                <div id="dlComments3">
                    <div>
                        <h3>옵션</h3>
                        <select name="ot_1" class="select" id="ot_1">
                            <option>-</option>
                            <option>크기2</option>
                            <option>크기3</option>
                        </select>
                    </div>
                    <div>
                        <h3>추가옵션</h3>
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
                            <p class="reviewTitle">${i.review_Title}</p>
                            <p class="reviewText">${i.review_Text}</p>
                            <div>
                                <p>${i.user_Id}</p>
                            </div>
                            <p>${i.review_Date}</p>
                            <button id="reply" value="${i.review_Num}" type="button">댓글</button>

                            <form action="/reviewReply.do" method="post">
                                <div id="replyList">
                                    <input id="proNum" type="hidden" name="product_Num" value="${i.product_Num}">
                                    <input id="revNum" type="hidden" name="review_Num" value="${i.review_Num}">
                                </div>
                            </form>
                            <div id="replycopy"></div>
                        </div>
                    </li>
                </c:forEach>
                <script>
                    document.addEventListener("DOMContentLoaded",()=>{

                    
                    document.querySelector(".reviewinfo").addEventListener("click", async (e) => {
                        
                        if (!e.target.matches("#reply")) {
                            return;
                        }
                        document.querySelector("#reply").id = "ok";
                        let reviewInfo = document.querySelector("#reviewInfo");
                        let replyList = document.querySelector("#replyList");
                        let text = document.createElement("textarea");
                        let sub = document.createElement("input");
                        let divtag = document.createElement("div");
                        divtag.classList.add("divtag");
                        sub.setAttribute("type", "submit");
                        sub.id = "sub";
                        sub.setAttribute("value", "댓글달기");
                        text.setAttribute("name", "reply_Text");
                        text.setAttribute("cols", "80");
                        text.setAttribute("rows", "3");
                        divtag.appendChild(text);
                        divtag.appendChild(sub);
                        replyList.appendChild(divtag);

                        
                                                // 댓글 달기
                                                document.querySelector(".reviewinfo").addEventListener("click", (e) => {
                                                    if (!e.target.matches("#sub")) {
                                                        return;
                                                    }
                                                    if (!confirm("댓글을 다시겠습니까?")) {
                                                        e.preventDefault();
                                                        return;
                                                    }
                                                    alert("댓글이 달렸습니다.");
                                                })
                        // 답글 불러오기
                        let proNum = document.querySelector("#proNum").value;
                        let revNum = document.querySelector("#revNum").value;
                        
                        let copy = await fetch("/revReply.do",{
                            method: "POST",
                            headers: {
                                "content-type": "application/json"
                            },
                            body:JSON.stringify(
                                revNum
                            )
                        })
                        if(copy.status === 200){
                            let copyresult = await copy.json();
                            console.log(copyresult.result.length);
                            console.log(...copyresult.result);
                            let replycopy = document.querySelector("#replycopy");
                            for(let k = 0 ; k < copyresult.result.length; k++ ){
                                let repUser =document.createElement("p");
                                let repText =document.createElement("p");
                                console.log(...copyresult.result[k].reply_Text);
                                //아이디
                                let ID= [...copyresult.result][k].user_Id;
                                repUser.textContent=ID;
                                // 내용
                                let Tex = [...copyresult.result][k].reply_Text;
                                repText.textContent=Tex;
                                replycopy.appendChild(repUser);
                                replycopy.appendChild(repText);
                            }
                            
                        }else{
                            alert("서버 오류");
                        }
                        
                        

                        




                    })
                })
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