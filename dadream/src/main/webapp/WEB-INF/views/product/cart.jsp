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
        .cart {
            /* margin-left: 100px; */
        }

        .cart>* {
            margin-top: 30px;
        }

        .cart>h3 {
            font-weight: bold;
            font-size: 40px;
        }

        #carttable {
            width: 1100px;
        }

        #carttable td {
            width: 250px;
            height: 80px;
            padding: 20px;

        }

        #carttable tr>th {
            font-weight: bold;
            font-size: 20px;
            width: 30px;
            /* height: 50px; */
            padding: 20px;
        }

        #carttable tr {
            margin-left: 20px;

        }

        .cartfoot,
        .cartbuy {
            display: flex;
            justify-content: center;
        }

        .cartbuy button {
            width: 150px;
            height: 40px;
        }
    </style>
</head>

<body>
    <div class="cart">

        <h3>장바구니</h3>
        <table id=carttable>
            <tr style="background: gray;">
                <th>No</th>
                <th>상품명</th>
                <th>수량</th>
                <th>가격</th>
                <th>삭제</th>
            </tr>
            <c:forEach var="cart" items="${info}" varStatus="status">
                <c:forEach var="pro" items="${cart.product}">
                    <tr align="center">
                        <!-- <div class="cartradio"> -->
                        <td>
                            <h6>${status.count}</h6>
                        </td>

                        <td>
                            <p>${pro.product_Name}</p>
                        </td>
                        <!-- <div class="cartcount"> -->
                        <td>
                            <input class="inputnum" type="number" value="1" min="1" step="1" style="width: 30px ;">
                        </td>
                        <td>
                            <span>${pro.product_Price}</span>
                        </td>
                        <!-- </div> -->
                        <td>
                            <button class="cartdelete" id="num" value="${cart.cart_Num}">삭제</button>
                        </td>
                        <!-- </div> -->
                    </tr>
                </c:forEach>
            </c:forEach>
            <script>
                document.addEventListener("DOMContentLoaded", () => {
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
            <span> 0개 선택&nbsp;&nbsp; 상품가 + 배송비&nbsp;&nbsp; = &nbsp;&nbsp;총금액</span>
        </div>
        <div class="cartbuy">
            <button type="button">구매하기</button>
        </div>
    </div>

</body>

</html>