<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
  request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>로그인 / 회원가입 폼 템플릿</title>
    <!-- css -->
    <link rel="stylesheet" href="/css/proside.css">
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
            <form id="pro_household" action="${contextPath}/order.do" class="input-group">
                <ul>
                    <li>
                        <img src="" alt="">
                        <p>title</p>
                        <p>가격</p>
                    </li>
                </ul>
                <button class="submit">구매하기</button>
            </form>
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
                data: {user_Id},
                success: function(proDlList) {
                    console.log(proDlList);

                    var proDljjim = "";

                    $.each(proDlList, function(index, item) {
                        proDljjim += '<div id="dlRadio" style="display:flex;">';
                        proDljjim += '<div style="margin-right:20px; margin-top:25px;"><button type="button" onclick="show_slide(proDl_Num=' + item.dl_Num + ', proUser_Id=' + "'" + item.user_Id + "', proDl_img='" +item.dealing[0].dl_Image + "'" +')" style="width:45px; height:35px;">';
                        proDljjim += '<img src="../image/slideicon.png"></button></div>';
                        proDljjim += '<div><p>매물번호 : ' + item.dl_Num + '</p><br>';
                        proDljjim += '<p>제목 : ' + item.dealing[0].dl_Title + '</p><br>';
                        proDljjim += '<p>가격 : ' + item.dealing[0].dl_Price + '</p>';
                        proDljjim += '</div></div>';

                    });

                    document.getElementById("proDljjim").innerHTML = proDljjim;
                },
                error: function() {
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
                    var $sliderItem = $("<div>", {class:"slide_item"});
                    var $sliderImg = $("<img>", {src:"../dealing/" + proUser_Id + "/" + proDl_img}); 
                    $sliderItem.append($sliderImg);
                    $slider.append($sliderItem);
                    // for문 종료
                
                // slider reload
                bxSlider1.reloadSlider();
            }
        
    </script>
</body>

</html>