<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>마이페이지</title>
        <!-- reset css -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
        <!-- css -->
        <link rel="stylesheet" href="/css/mypage.css">
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
        </script>
    </head>

    <body>
        <div class="mypagecontrol" style="display: flex; flex-direction: column; margin-left: 140px;">


            <div class="mypage">
                <h1 style="font-size:2.5em; font-weight: bold; margin: 30px 0;">My Page</h1>
                <div>


                    <form>
                        <h3 style="font-weight: 900; font-size: 2em;">회원정보 변경</h3><br>
                        <label style="font-weight: 700; ">ID</label><br>
                        <input type="text" style="margin: 10px 0;" value="사용자아이디" disabled="disabled"><br>
                        <label style="font-weight: 700;margin-bottom: 10px;">Password</label><br>
                        <input type="password" name="userPwd" id="pwd1" placeholder="비밀번호를 입력하세요" required="required"
                            style="margin-top:7px ;"><br>
                        <input type="password" name="userPwdConfirm" id="pwd2" placeholder="다시 입력하세요"
                            required="required" style="margin-top:3px ;">
                        <div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
                        <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
                        <br>
                        <br>
                        <p style="margin-bottom: 5px; font-weight: bold;">주소</p>
                        <input type="text" size="30">
                        <br>
                        <br>
                        <p style="margin-bottom: 5px; font-weight: bold;">상세주소</p>
                        <input type="text" size="20" placeholder="상세주소를 입력해주세요." style="margin-top: 3px;">
                        <br><br>
                        <input type="submit" name="mod" value="변경" style="font-weight:700; margin-top:10px;width: 100px; height:30px;"><br><br>
                    </form>
                </div>
                <br>
                <h2 style="font-weight: 900; font-size: 2em;">내가 등록한 방</h2>
                <div id="myroom">
                    <div style="display: flex;">
                        <div style="width: 200px; height: 200px;"><img src="images/네이버.PNG"
                                style="width:200px; height: 200px;">
                        </div>
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
                    <div style="display:flex;"><img src="images/네이버.PNG"
                            style="width:150px; height: 150px; margin-top: 25px;"><br>
                        <div style="border: 1px solid black; width: 200px; height: 200px;">OO동<br>
                            원룸<br>
                            주소:</div>
                    </div>
                    <div style="display:flex;"><img src="images/네이버.PNG"
                            style="width:150px; height: 150px; margin-top: 25px;"><br>
                        <div style="border: 1px solid black; width: 200px; height: 200px;">OO동<br>
                            원룸<br>
                            주소:</div>
                    </div>
                    <div style="display:flex;"><img src="images/네이버.PNG"
                            style="width:150px; height: 150px; margin-top: 25px;"><br>
                        <div style="border: 1px solid black; width: 200px; height: 200px;">OO동<br>
                            원룸<br>
                            주소:</div>
                    </div>
                </div>
                <hr>
                <br><br>
                <div class="report" style="width: 1000px;">
                    <h2 style="font-weight: 900; font-size: 2em;">허위매물 신고목록</h2><br>
                    <table class="table">
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
                <input type="submit" value="회원탈퇴" style="width: 150px; height: 30px; font-weight: bolder; color: red;"
                    onclick="">
            </div>

        </div>
    </body>

    </html>