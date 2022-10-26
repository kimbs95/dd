<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
  request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>로그인 / 회원가입 폼 템플릿</title>
    <!-- css -->
    <link rel="stylesheet" href="/css/proside.css">
    <style>
        #pro_household li {
            margin: 10px;
        }

        #pro_household li>* {
            margin: 5px 0 ;
        }
        #totalP{
            display: inline;
        }
        
    </style>
</head>

<body>
    <div class="pro_side">
        <div class="pro_side_form">
            <div class="pro_side_botton">
                <div id="pro_side_btn"></div>
                <button type="button" class="pro_togglebtn" onclick="pro_dealing()">부동산</button>
                <button type="button" class="pro_togglebtn" onclick="pro_household()">가구</button>
            </div>
            <form id="pro_dealing" action="" class="input-group">
                <ul>
                    <li>
                        <div id="proDljjim"></div>
                    </li>
                </ul>
            </form>
            <div id="pro_household" class="input-group" >
                <ul>
                    <c:forEach var="cart" items="${info}" varStatus="status">
                        <c:forEach var="pro" items="${cart.product}">
                            <li id="ulLi">
                                <div style="display: flex;">
                                    <p>${status.count}. ${pro.product_Name}</p>
                                </div>
                                수량<input id="productCount" type="number" min="1" onchange="chan(event)" value="1"
                                    style="width: 50px ; border: none; text-align: center;">

                                <p id="productprice">${pro.product_Price}</p>
                                <p id="totalP"></p>
                                
                                <button class="cartdelete" id="num" value="${cart.cart_Num}">X</button>
                            </li>
                        </c:forEach>
                    </c:forEach>


                    <p id="totalpriceplus"></p>
                    <!-- <script>
                        // 1000단위로 . 찍기
                        const number = num =>
                            num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
                        let ulLi = document.querySelectorAll("#ulLi");
                        for (let i = 0; i < ulLi; i++) {
                            console.log(ulLi);
                        }
                    </script> -->
                </ul>
                <form action="${contextPath}/order.do">
                    <button class="submit">구매하기</button>
                </form>
            </div>
        </div>
    </div>
    <script>
        var x = document.getElementById("pro_dealing");
        var y = document.getElementById("pro_household");
        var z = document.getElementById("pro_side_btn");

        var user_Id = "${member.user_Id}"

        //document.getElementById("slide_image").src = "../image/메인로고.png"; r

        // $(document).ready(function () {

        //     $(".slide_").attr("src", "../image/han.jpg");

        // });

        function pro_dealing() {
            x.style.left = "50px";
            y.style.left = "450px";
            z.style.left = "0";

            $.ajax({
                url: "proDealing.do",
                type: "post",
                data: {
                    user_Id
                },
                success: function (proDlList) {
                    console.log(proDlList);

                    var proDljjim = "";

                    $.each(proDlList, function (index, item) {
                        proDljjim += '<div id="dlRadio" style="display:flex;">';
                        proDljjim +=
                            '<div style="margin-right:20px; margin-top:25px;"><button type="button" onclick="show_slide(proDl_Num=' +
                            item.dl_Num + ', proUser_Id=' + "'" + item.user_Id + "', proDl_img='" +
                            item.dealing[0].dl_Image + "'" + ')" style="width:45px; height:35px;">';
                        proDljjim += '<img src="../image/slideicon.png"></button></div>';
                        proDljjim += '<div><p>매물번호 : ' + item.dl_Num + '</p><br>';
                        proDljjim += '<p>제목 : ' + item.dealing[0].dl_Title + '</p><br>';
                        proDljjim += '<p>가격 : ' + item.dealing[0].dl_Price + '</p>';
                        proDljjim += '</div></div>';

                    });

                    document.getElementById("proDljjim").innerHTML = proDljjim;
                },
                error: function () {
                    alert("에러 발생");
                }
            });
        }

        function pro_household() {
            x.style.left = "-400px";
            y.style.left = "50px";
            z.style.left = "110px";
        }



        function show_slide() {
            console.log(proDl_Num);
            console.log(proUser_Id);
            console.log(proDl_img);

            /*
            bxslider 생성할때 이미지태그로 추가적인 작업을 하는게 잇음
            동적변경을 위해서는 reloadSlider() 필요
            -> bxslider 변수 선언 (bxSlider1)

            그래서 태그 동적으로 생성해서 
            slider 부모 태그에 넣은뒤 
            reloadSlider() 한거임
            */

            // 이미지 삭제
            var $slider = $(".slider");
            $slider.children(".slide_item").remove();

            // 이미지 추가 
            // for문 추가
            var $sliderItem = $("<div>", {
                class: "slide_item"
            });
            var $sliderImg = $("<img>", {
                src: "../dealing/" + proUser_Id + "/" + proDl_img
            });
            $sliderItem.append($sliderImg);
            $slider.append($sliderItem);
            // for문 종료

            // slider reload
            bxSlider1.reloadSlider();
        }
    </script>

    <script>
        // 수량 바뀌면 계산해주는 함수
        let chan = (event) => {
            
            let totalpriceplus= document.querySelector("#totalpriceplus");
            let result = event.target.value;
            let prc = event.target.nextElementSibling;
            let totalP = prc.nextElementSibling;
            let totalSpan =totalP.nextElementSibling;
            totalP.innerHTML = result + " 개 금액 : "+ result * +prc.textContent;
    
            
        }
        
    
        
        (function () {
         
            // 시작하자마 값 띄어주는 곳 
                let ulLi = document.querySelectorAll("#ulLi");
                let productprice = document.querySelectorAll("#productprice");
                let productCount =document.querySelectorAll("#productCount");
                let totalP =document.querySelectorAll("#totalP");
                for(let i = 0 ; i<ulLi.length; i++){
                    console.log(+productCount[i].value);    
                    console.log(+productprice[i].textContent);
                    totalP[i].innerHTML=(+productCount[i].value) +"개 금액 : "+((+productCount[i].value) *(+productprice[i].textContent))
                    
                    
                }
            

            


        
        })();

        document.addEventListener("DOMContentLoaded", () => {



            // 1000단위로 . 찍기
            const number = num =>
                num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
            // 계산하기



            let num = document.querySelectorAll("#num");
            // 삭제 버튼 
            for(let i = 0 ; i<num.length; i++){

            
            num[i].addEventListener("click", async e => {
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
        }
        })
    </script>
</body>

</html>