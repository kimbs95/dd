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


            <script>
                // 1000단위로 . 찍기
                const number = num =>
                    num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");



                // 계산하는 함수 총 개수 총 금액
                const price = () => {

                    let tr = [...document.querySelectorAll("#carttable > tbody > tr")];
                    let total = tr.reduce((acc, curr) => {
                        let currcount = +curr.querySelector("#productCount").value;
                        let currprice = +curr.querySelector("#productprice").innerText;
                        acc.count += currcount;
                        acc.price += (currprice * currcount);
                        return acc;
                    }, {
                        count: 0,
                        price: 0
                    });
                    document.querySelector("#productnum").innerHTML = number(total.count);
                    document.querySelector("#totalprice").innerHTML = number(total.price);
                    document.querySelector("#totalpriceplus").innerHTML = number(total.price + 2500);

                }
                document.addEventListener("DOMContentLoaded", () => {
                    price();
                })
            </script>

            <script>
                document.addEventListener("DOMContentLoaded", () => {
                    // 삭제 버튼 
                    document.querySelector("#carttable").addEventListener("click", async e => {
                        if (e.target.tagName.toLowerCase() !== "button") {
                            // e.target instanceof HTMLButtonElement
                            return;
                        }
                        if (!confirm("정말로 삭제하시겠습니까?")) {
                            return;
                        }
                        let num = e.target.value;
                        // console.log(num);
                        console.log(e.target);
                        let cartdelete = await fetch("/cartdelete.do", {
                            method: "POST",
                            headers: {
                                "content-type": "application/json"
                            },
                            body: JSON.stringify(num)
                        })
                        if (cartdelete.status = 200) {
                            let data = await cartdelete.json();
                            console.log(data);
                            if (data.result === 0) {
                                alert("다시 시도해주세요");
                                location.reload();
                                return;
                            } else {
                                alert("삭제가 완료되었습니다");
                                location.reload();
                                return;
                            }

                        } else {
                            alert("서버 문제");
                        }
                    })
                })
            </script>
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