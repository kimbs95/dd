<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>매물 수정/삭제</title>
        <!-- reset css -->
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
        <style>
             * {
                box-sizing: border-box;
                user-select: none;
                margin: 0 auto;
                
                
            }
            header {
                /* margin: 20px 0 0 30px; */
                display: flex;
                justify-content: space-between;
                align-items: center;
                background-color: burlywood;
            }

            header .Main_Logo {
                width: 220px;
                height: 50px;
                margin-right: 300px;
            }

            .headerleft {
                display: flex;
            }

            div ul {
                display: flex;
                margin-top: 2%;
                font-size: 22px;
                width: 500px;
            }

            div ul li {
                font-weight: bold;
                margin-right: 50px;
            }

            header div ul > a {
                margin-top: 1.5%;
                text-decoration: none;
                color: black;
            }

            /* top버튼 */
            .top {
                width: 25px;
                height: 25px;
                text-decoration: none;
                text-align: center;
                color: black;
                position: fixed;
                bottom: 90px;
                right: 20px;
            }

            div {
                margin: 20px;
            }
            /* top버튼 */
            .top {
                text-decoration: none;
                color: black;
                position: fixed;
                bottom: 100px;
                right: 40px;
            }
            #dealing-mod-delete {
                margin: 15px;
                margin-left: 50px;
                /* margin-right: 50px; */
                padding: 15px;
                
                

            }
            #my-dealing1 {
                margin: 20px;
            }
           
        </style>
    </head>
    <body>
        <header>
            <div class="headerleft">
                <a href="#"><img class="Main_Logo" src="images/mainlogo.png" alt="다드림 메인로고" "></a>
            </div>

            <div>
                <ul>
                    <a href="#">
                        <li>매물등록</li>
                    </a>
                    <a href="#">
                        <li>로그인</li>
                    </a>
                    <a href="#">
                        <li>회원가입</li>
                    </a>
                </ul>
            </div>
        </header>

        <!-- TOP 부분 -->
        <!-- <a class="top" href=".headerleft">TOP</a> -->
        <a class="top" href="#">TOP</a>
        <!-- Channel Plugin Scripts -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script type="text/javascript">
            (function () {
                var w = window;
                if (w.ChannelIO) {
                    return (window.console.error || window.console.log || function () {})(
                        'ChannelIO script included twice.'
                    );
                }
                var ch = function () {
                    ch.c(arguments);
                };
                ch.q = [];
                ch.c = function (args) {
                    ch
                        .q
                        .push(args);
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
                    x
                        .parentNode
                        .insertBefore(s, x);
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
            ChannelIO('boot', {"pluginKey": "df04e6aa-33a1-40b0-b598-de67826a821e"});
        </script>
        <!-- End Channel Plugin -->

        <br>
        <div id="dealing-mod-delete" style="border:0px; width: 1920px; height: auto; display:inline-block">
            <h2 style="font-weight: bolder; font-size: 1.2em;">매물수정 / 삭제</h2>
            <!--1번 매물-->
            <div
                id="my-dealing1"
                style="width: 550px; height: 100px; border: 1px solid black;display: inline-flex;">
                <div style="margin:20px"><input
                    type="image"
                    src="images/mainlogo.png"
                    style="border: 1px soild grey; width: 100px; height: 60px;">
                </div>

            </div>
            <div
                style="border: 0px solid white; width: auto; height: 50px;display: inline-flex; ">
                <button id="mod" type="submit" onclick="">수정</button>
                <button id="delete" type="submit">삭제</button>
            </div>

            <!--2번 매물-->

            <div
                id="my-dealing1"
                style="width: 550px; height: 100px; border: 1px solid black;display: inline-flex;">
                <div style="margin:20px"><input
                    type="image"
                    src="images/mainlogo.png"
                    style="border: 1px soild grey; width: 100px; height: 60px;">
                </div>

            </div>
            <div
                style="border: 0px solid white; width: auto; height: 50px;display: inline-flex; ">
                <button id="mod" type="submit" onclick="">수정</button>
                <button id="delete" type="submit">삭제</button>
            </div>

            <!--3번 매물-->
            <div
                id="my-dealing1"
                style="width: 550px; height: 100px; border: 1px solid black;display: inline-flex;">
                <div style="margin:20px"><input
                    type="image"
                    src="images/mainlogo.png"
                    style="border: 1px soild grey; width: 100px; height: 60px;">
                </div>

            </div>
            <div
                style="border: 0px solid white; width: auto; height: 50px;display: inline-flex; ">
                <button id="mod" type="submit" onclick="">수정</button>
                <button id="delete" type="submit">삭제</button>
            </div>
            <!--4번매물-->
            <div
                id="my-dealing1"
                style="width: 550px; height: 100px; border: 1px solid black;display: inline-flex;">
                <div style="margin:20px"><input
                    type="image"
                    src="images/mainlogo.png"
                    style="border: 1px soild grey; width: 100px; height: 60px;">
                </div>

            </div>
            <div
                style="border: 0px solid white; width: auto; height: 50px;display: inline-flex; ">
                <button id="mod" type="submit" onclick="">수정</button>
                <button id="delete" type="submit">삭제</button>
            </div>

            <div
                id="my-dealing1"
                style="width: 550px; height: 100px; border: 1px solid black;display: inline-flex;">
                <div style="margin:20px"><input
                    type="image"
                    src="images/mainlogo.png"
                    style="border: 1px soild grey; width: 100px; height: 60px;">
                </div>

            </div>
            <div
                style="border: 0px solid white; width: auto; height: 50px;display: inline-flex; ">
                <button id="mod" type="submit" onclick="">수정</button>
                <button id="delete" type="submit">삭제</button>
            </div>

            <div
                id="my-dealing1"
                style="width: 550px; height: 100px; border: 1px solid black;display: inline-flex;">
                <div style="margin:20px"><input
                    type="image"
                    src="images/mainlogo.png"
                    style="border: 1px soild grey; width: 100px; height: 60px;">
                </div>

            </div>
            <div
                style="border: 0px solid white; width: auto; height: 50px;display: inline-flex; ">
                <button id="mod" type="submit" onclick="">수정</button>
                <button id="delete" type="submit">삭제</button>
            </div>
        </div>
    </body>
</html>