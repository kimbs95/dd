<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
   
    <title>매물 중개사</title>
    <!-- reset css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <style>
        * {
            box-sizing: border-box;
            user-select: none;
            margin: 0 auto;
        }

        /* maintab */
        .maintab {
            display: flex;
            margin-top: 10px;
            margin-bottom: 20px;
            background: rgb(238, 232, 232);
        }

        .maintab li {
            padding: 20px 20px;
            cursor: pointer;
            font-size: 20px;
            font-weight: bold;
            width: 100%;
            text-align: center;
        }

        .maintab .a:hover {
            background-color: rgb(146, 142, 142);
        }

        .maintab .b:hover {
            background-color: rgb(161, 117, 20);
        }

        .hide {
            display: none;
        }

        .red {
            background-color: rgb(146, 142, 142);
        }

        .blue {
            background-color: rgb(161, 117, 20);
        }




        /* header */
        .header {
            width: 1920px;
            margin: 20px 0 0 30px;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }

        .headerleft .Main_Logo {
            width: 220px;
            height: 50px;
        }

        .headerleft {
            display: flex;
        }

        .headerleft h1 {
            font-weight: bold;
            font-size: 30px;
            margin-left: 40px;
            margin-top: 1%;
            width: 140px;
        }

        .headerul ul {
            margin-top: 2%;
            font-size: 18px;
            margin-left: 100px;
            width: 300px;
        }

        .headerul ul select {
            height: 40px;
        }

        .headerul ul li {
            display: inline-flex;
            font-weight: bold;
            margin-right: 50px;
        }

        header .headerul ul a {
            margin-top: 1.5%;
            text-decoration: none;
            color: black;
        }

        /* top버튼 */
        .top {
            text-decoration: none;
            color: black;
            position: fixed;
            bottom: 100px;
            right: 40px;
        }
    </style>
</head>

<body>

    <!-- maintab -->
    <ul class="maintab">
        <li class="a red">부동산</li>
        <li class="b">가구</li>
    </ul>


    <!-- header -->
    <header class="header">
        <div class="headerleft">
            <a href="#"><img class="Main_Logo" src="../image/메인로고.png" alt="다드림 메인로고"></a>
            <h1>중개사</h1>
        </div>

        <div class="headerul">
            <ul>
                <li>
                    <select name="" id="">
                        <a href="#">
                            <option value="" selected>중개관리</option>
                        </a>
                        <a href="#">
                            <option value="">매물관리</option>
                        </a>
                        <a href="#">
                            <option value="">계정관리</option>
                        </a>
                    </select>
                </li>
                <a href="#">
                    <li>로그인</li>
                </a>
            </ul>
        </div>

    </header>


    <!-- 내용물 -->
    <div class="detaling">
        <!-- 부동산 페이지 -->
    </div>
    <div class="pro hide">
        <!-- 가구 페이지 -->
    </div>

    <!-- TOP 부분 -->
    <!-- <a class="top" href=".headerleft">TOP</a> -->
    <a class="top" href="#">TOP</a>

    <!-- Channel Plugin Scripts -->
    <script>
        (function () {
            var w = window;
            if (w.ChannelIO) {
                return (window.console.error || window.console.log || function () {})(
                    'ChannelIO script included twice.');
            }
            var ch = function () {
                ch.c(arguments);
            };
            ch.q = [];
            ch.c = function (args) {
                ch.q.push(args);
            };
            w.ChannelIO = ch;

            function l() {
                if (w.ChannelIOInitialized) {
                    return;
                }
                w.ChannelIOInitialized = true;
                var s = document.createElement('script');
                s.type = 'text/javascript';
                s.async = true;
                s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
                s.charset = 'UTF-8';
                var x = document.getElementsByTagName('script')[0];
                x.parentNode.insertBefore(s, x);
            }
            if (document.readyState === 'complete') {
                l();
            } else if (window.attachEvent) {
                window.attachEvent('onload', l);
            } else {
                window.addEventListener('DOMContentLoaded', l, false);
                window.addEventListener('load', l, false);
            }
        })();
        ChannelIO('boot', {
            "pluginKey": "df04e6aa-33a1-40b0-b598-de67826a821e"
        });


        //  End Channel Plugin 

        // main tab
        let a = document.querySelector(".a");
        let b = document.querySelector(".b");

        let c = document.querySelector(".detaling");
        let d = document.querySelector(".pro");

        //  부동산을 클릭하였을때
        a.addEventListener('click', function () {
            b.classList.remove("blue");
            a.classList.add("red");
            d.classList.add("hide");
            c.classList.remove("hide");
        })

        // 가구를 클릭하였을때
        b.addEventListener('click', function () {
            a.classList.remove("red");
            b.classList.add("blue");

            c.classList.add("hide");
            d.classList.remove("hide");

        })
    </script>
</body>

</html>