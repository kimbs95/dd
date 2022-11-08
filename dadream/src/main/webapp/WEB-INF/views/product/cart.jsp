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
    <!-- css -->
    <link rel="stylesheet" href="/css/cart.css">
    <!-- js -->
    <script src="/js/product/cart.js"></script>
</head>

<body>
    <div class="cart">

        <h3>장바구니</h3>
        <table id=carttable>
            <thead>
                <tr>
                    <th>No</th>
                    <th>상품명</th>
                    <th>수량</th>
                    <th>가격</th>
                    <th>삭제</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="cart" items="${info}" varStatus="status">
                    <c:forEach var="pro" items="${cart.product}">
                        <tr align="center">
                            <td>${status.count}</td>
                            <td>${pro.product_Name}</td>
                            <td><input id="productCount" type="number" min="0" onchange="price()"
                                    value=${cart.cart_BuytCount} style="width: 50px ;">
                            </td>
                            <td id="productprice">${pro.product_Price}</td>
                            <td><button class="cartdelete" id="num" value="${cart.cart_Num}">삭제</button></td>
                        </tr>
                    </c:forEach>
                </c:forEach>
            </tbody>

        </table>
        <hr>
        <div class="cartfoot">
            <h5>
                <span id="productnum"></span>개 상품 : <span id="totalprice"></span>원 + 배송비 : 2.500원 총 금액 :
                <span id="totalpriceplus"></span>원
            </h5>
        </div>
        <div class="cartbuy">
            <button type="button">구매하기</button>
        </div>
    </div>




</body>

</html>