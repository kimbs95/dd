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
        <title>마이페이지</title>
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
            .mypage {
                width: 1460px;
                margin: auto;
                /* margin: 0px auto; */
                /* height: 1920px; */
                /* background-color: rgb(220, 219, 219);  */

            }
            #myroom {
                width: 1130px;
                height: 350px;
                display: flex;
                margin: 5px;
                /* margin: 0px auto; */
            }
            #likeroom {
                width:  1130px;
                height: 350px;
                display: flex;
                margin: 27px;
                /* margin: 0px auto; */
                
            }
            .report {
                align-content: center;
                margin: 0px;
                /* margin: 0px auto; */
            }
            table {
                width:  1130px;
                border-top: 1px solid #444444;
                border-collapse: collapse;
                /* margin: 0px auto; */
            }
            td,
            th {
                border-bottom: 1px solid #444444;
                border-left: 1px solid #444444;
                padding: 10px;
                text-align: center;
                
                
            }
            td:first-child,
            th:first-child {
                border-left: none;
                text-align: center;

            }
            th{
                font-weight: 700;
                background-color: gainsboro;
            }
             .footer {
                width:  1920px;
                padding: 20px 40px;
                background: gray;
                display: flex;
                align-items: center;
                justify-content: space-around;
                margin: 0px auto;

            }

    
            .footer_content {
                /* font-weight: bold; */
                margin-top: 20px;
                /* line-height: 1.2; */
            }

            .footerinfo {
                /* margin: 20px 30px; */
                /* font-weight: bold; */
                /* line-height: 1.2; */
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script type="text/javascript">
            $(function () {
                $("#alert-success").hide();
                $("#alert-danger").hide();
                $("input").keyup(function () {
                    var pwd1 = $("#pwd1").val();
                    var pwd2 = $("#pwd2").val();
                    if (pwd1 != "" || pwd2 != "") {
                        if (pwd1 == pwd2) {
                            $("#alert-success").show();
                            $("#alert-danger").hide();
                            $("submit").removeAttr("disabled");
                        } else {
                            $("#alert-success").hide();
                            $("#alert-danger").show();
                            $("submit").attr("disabled", "disabled");
                        }
                    }
                });
            });
            // $(function(){     $("#input_id").keyup(function(){         let user_Id =
            // $("#input_id").val();         $.ajax({             url : "/",
            // type : "post",             data : {user_Id: userId},             dataType :
            // "json",             success : function(result){                 if(result ==
            // 0){                     $("#checkId").html("사용할 수 없는 아이디입니다.");
            // $("#checkId").attr("color","blue");                 }else{
            // $("#checkId").html("사용할 수 있는 아이디입니다.");
            // $("#checkId").attr("color","red");                 }             },
            // error : function(){                 alert("요청실패");             }         })
            // }); })
        </script>
    </head>
    <body>
        <header>
            <div class="headerleft">
                <a href="#"><img class="Main_Logo" src="images\메인로고.png" alt="다드림 메인로고"></a>
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
        <script>
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
        <div class="mypage">
            <div>
                <div>
                    <h1 style="font-size:2.5em;">My Page</h1>
                    <br>
                    
                </div>

                <h3 style="font-weight: 900; font-size: 2em;">회원정보 변경</h3><br>
                <label style="font-weight: 700;">ID</label><br>
                <input type="text" value="사용자아이디" disabled="disabled">
                <font id="checkId" size="2"></font><br><br>
                <label style="font-weight: 700;">Password</label><br>
                <input
                    type="password"
                    name="userPwd"
                    id="pwd1"
                    placeholder="비밀번호를 입력하세요"
                    required="required"
                    style="margin-top:7px ;"><br>
                <input
                    type="password"
                    name="userPwdConfirm"
                    id="pwd2"
                    placeholder="다시 입력하세요"
                    required="required"
                    style="margin-top:3px ;">
                <div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
                <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
                <br>
                <input
                    type="submit"
                    name="mod"
                    value="변경"
                    style="font-weight:700; margin-top:3px;"><br><br>
                <form>
                    <label style="font-weight:700;">주소</label><br>
                    <input type="text" size="30" disabled="disabled">&nbsp;<button type="submit" style="font-weight: 700;">주소찾기</button><br><br>
                    <label style="font-weight: 700;">상세주소</label><br>
                    <input
                        type="text"
                        size="20"
                        placeholder="상세주소를 입력해주세요."
                        style="margin-top: 3px;">
                        <input
                        type="submit"
                        name="mod"
                        value="변경"
                        style="font-weight:700; margin-top:3px;"></form>
            </div>
            <br>
            <h2 style="font-weight: 900; font-size: 2em;">내가 등록한 방</h2>
            <div id="myroom">
                <div style="display: flex;">
                    <div style="width: 200px; height: 200px;"><img src="images/네이버.PNG" style="width:200px; height: 200px;"></div>
                    <div style="border: 1px solid black; width: 300px; height: 200px;">OO동<br>
                        원룸<br>
                        주소:</div>
                    <div style="width: 200px; height: 200px; border: 1px solid black;">조회수:
                        <br>
                        연락온 고객:
                    </div>
                </div>
            </div>
            <br>
            <h2 style="font-weight: 900; font-size: 2em;">관심목록</h2>
            <div id="likeroom" style="display:flex;">
                <div style="display:flex;"><img src="images/네이버.PNG" style="width:150px; height: 150px; margin-top: 25px;"><br>
                    <div style="border: 1px solid black; width: 200px; height: 200px;">OO동<br>
                        원룸<br>
                        주소:</div>
                </div>
                <div style="display:flex;"><img src="images/네이버.PNG" style="width:150px; height: 150px; margin-top: 25px;"><br>
                    <div style="border: 1px solid black; width: 200px; height: 200px;">OO동<br>
                        원룸<br>
                        주소:</div>
                </div>
                <div style="display:flex;"><img src="images/네이버.PNG" style="width:150px; height: 150px; margin-top: 25px;"><br>
                    <div style="border: 1px solid black; width: 200px; height: 200px;">OO동<br>
                        원룸<br>
                        주소:</div>
                </div>
            </div>
            <hr style="width: 1920px;">
            <br><br>
            <div class="report" style="width: 1920px;">
                <h2 style="font-weight: 900; font-size: 2em;">허위매물 신고목록</h2><br>
                <table>
                    <tr>
                        <th>No</th>
                        <th>매물명</th>
                        <th>신고사유</th>
                        <th>신고일</th>
                    </tr>

                    <tr>
                        <td>1</td>
                        <td>오라클 빌딩</td>
                        <td>건물 구조 상이</td>
                        <td>2022.08.31</td>
                    </tr>

                    <tr>
                        <td>2</td>
                        <td>오라클 빌딩</td>
                        <td>건물 구조 상이</td>
                        <td>2022.08.31</td>
                    </tr>
                </table>
            </div>
            <br><br><br>
            <input type="submit" value="회원탈퇴" style="width: 150px; height: 30px; font-weight: bolder; color: red;" onclick="">
        </div>

        <footer>
            <div class="footer">
                <!-- <div class="footer_img">
                    <img src="images/구글.PNG" alt="다드림 메인이미지">
                </div> -->
                <div class="footer_content">
                    <span>대표자&nbsp;:</span><span>&nbsp;뜨거운 감자</span>
                    <br>
                    <span>사업장&nbsp;:</span><span>&nbsp;사랑시 고백구 행복동</span>
                    <br>
                    <span>사업자 번호&nbsp;:</span><span>&nbsp;02-222-2222</span>
                    <br>
                    <span>Email&nbsp;:</span><span>&nbsp;DaDream@test.com</span>
                    <br><br>
                    <button>회사위치보기</button>
                </div>
                <div class="footerinfo">
                    <span>저희 다드림은 집을 계약하고 가구도 함께 구매 할 수 있는 사이트입니다 .</span>
                    <br>
                    <span>고객센터 : 042-2222-2222 | 평일 10:00 ~ 18:30, 점심시간 : 12:00 ~ 13:00 (토·일요일, 공휴일 휴무)<br>
                            팩스 : 042-111-1111     프로모션/사업 제휴문의 : dadream@co.kr</span>
                    <span>이용해주셔서 감사합니다.</span>
                    <br>
                    <br>
                    <span>팀장 : 육주영</span><br>
                    <span>팀원 : 안형수, 김병성, 이재욱</span>
                </div>
            </div>
        </footer>
    </body>
</html>