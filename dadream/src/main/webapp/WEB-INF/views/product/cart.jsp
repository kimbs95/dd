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
    <title>장바구니</title>
    <!-- reset css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <style>
        * {
            box-sizing: border-box;
            user-select: none;
        }

        .cart {
            margin-top: 40px;
        }

        .cartcontent {
            display: flex;
            margin-left: 200px;
            width: 1500px;
        }

        .cartcontent h3 {
            font-weight: bold;
            font-size: 30px;
            margin-right: 705px;
        }

        .cartcontent p {
            margin-top: 30px;
            margin-right: 160px;
        }

        .cart .cartmiddle {
            width: 1130px;
            margin-left: 150px;
        }

        .cart .cartmiddle .cartradio {
            width: 1300px;
            display: flex;
            justify-content: space-between;
            margin: 20px 20px;
        }

        .cart .cartmiddle .cartradio .cartcount span {
            margin-left: 100px;
        }

        .cartfoot {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 40px;
        }

        .inputnum {
            width: 50px;
        }

        .cartbuy {
            width: 200px;
            height: 40px;
        }
    </style>
</head>

<body>
    <div class="cart">
        <div class="cartcontent">
            <h3>장바구니</h3>
            <p>수량</p>
            <p>가격</p>
        </div>
        <div class="cartmiddle">
            <ul>
                <li>
                    <c:forEach var="cart" items="${info}">
                    <div class="cartradio">
                            <input name="cartcheck" type="checkbox">
                            <h6>${cart.cart_Num}
                                <p>청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의</p>
                            </h6>
                            <div class="cartcount">
                                <input type="button" value="-">
                                <input class="inputnum" type="number" value="1" min="1" step="1">
                                <input type="button" value="+">
                                <span>13000원</span>
                            </div>
                            <button>삭제</button>
                        </div>
                    </c:forEach>
                </li>
            </ul>
        </div>
        <hr>
        <div class="cartfoot">
            <span> 0개 선택&nbsp;&nbsp; 상품가 + 배송비&nbsp;&nbsp; = &nbsp;&nbsp;총금액</span> <br><br>
            <button class="cartbuy">구매하기</button>
        </div>
    </div>
</body>

</html>