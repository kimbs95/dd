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
    <title>결제창</title>
    <!-- reset css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <!-- css -->
    <link rel="stylesheet" href="/css/order.css">
</head>

<body>
    <div class="order">
        <h3>주문결제</h3>
        <div class="ordercontent">
            <!-- 구매자 -->
            <div class="buyuser">
                <h6>구매자 정보</h6>
                <p>이름&nbsp;:<span>&nbsp;고구마</span></p>
                <p>이메일&nbsp;:<span>&nbsp;DaDream@test.com</span></p>
                <p>핸드폰&nbsp;:<span>&nbsp;010-1231-1231</span>&nbsp;<button>수정</button></p>
            </div>
            <!-- 받는사람 -->
            <div class="receive">
                <h6>받는 사람 정보&nbsp;<button>배송지 변경</button></h6>
                <p>이름&nbsp;:<span>&nbsp;고구마</span></p>
                <p>배송지&nbsp;:<span>&nbsp;대전</span></p>
                <p>연락처&nbsp;:<span>&nbsp;010-1231-1231</span></p>
                <p>배송시 요청사항&nbsp;:<span>&nbsp;강아지가 뭅니다.(개조심)</span></p>
            </div>
            <!-- 결제 정보 -->
            <div class="orderpay">
                <h6>결제 정보</h6>
                <p>총 가격&nbsp;:<span>&nbsp;13000원</span></p>
                <p>즉시할인&nbsp;:<span>&nbsp;0원</span></p>
                <p>할인쿠폰&nbsp;:<span>&nbsp;0원</span>&nbsp;<button>쿠폰선택</button></p>
                <p>배송비&nbsp;:<span>&nbsp;2500원</span></p>
                <p>총 결제금액&nbsp;:<span>&nbsp;15500원</span></p>
                <p class="whatpay">결제방법&nbsp;:
                    <span>
                        <label>
                            <input type="radio" name="pay" id="pay" value="" checked>계좌이체
                        </label>
                        <label>
                            <input type="radio" name="pay" value="">카카오페이
                        </label>
                        <label>
                            <!-- 신용 -->
                            <input type="radio" name="pay" id="credit" value="">신용/체크카드    
                        </label>
                        
                    </span>
                </p>
                <ul class="orderpayul hide">
                    <!-- 카드선택 -->
                    <li>
                        <label for="card">
                            카드선택
                            <select name="card" id="card">
                                <option value="samsung">삼성</option>
                                <option value="byungsung">병성</option>
                            </select>
                        </label>
                    </li>
                    <!-- 할부기간 -->
                    <li>
                        <label for="period">
                            할부기간
                            <select name="" id="period">
                                <option value="">1개월</option>
                                <option value="">2개월</option>
                                <option value="">3개월</option>
                                <option value="">4개월</option>
                                <option value="">5개월</option>
                                <option value="">6개월</option>
                            </select>
                        </label>
                    </li>
                </ul>
            </div>
        </div>
        <button class="orderconfirm">결제하기</button>
    </div>
    <script>
        let credit = document.querySelector("#credit");
        let orderpayul =document.querySelector('.orderpayul');
        let whatpay = document.querySelector(".whatpay");

        whatpay.addEventListener('click',function(){
            if(credit.checked===true){
                orderpayul.classList.remove('hide');
            }else{
                orderpayul.classList.add('hide');
            }
        });
        </script>
</body>

</html>