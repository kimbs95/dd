<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <style>
            #myroom {
                overflow-x: auto;
                height: 200px;
            }
            #mydl {
                border: 1px solid #ccc; 
                width: 300px; 
                height: 200px;
                padding: 10px;
            }

            #likeroom {
                overflow-x: scroll;
                
            }
        </style>
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
                <h1 style="font-size:2.5em; font-weight: bold; margin: 30px 0 150px 0;">My Page</h1>
                <div>


                    <form>
                        <h3 style="font-weight: 900; font-size: 2em;">회원정보 변경</h3><br>
                        <label style="font-weight: 700; ">ID</label><br>
                        <input type="text" style="margin: 10px 0;" value="${member.user_Id}" disabled="disabled"><br>
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
                        <input type="submit" name="mod" value="변경"
                            style="font-weight:700; margin-top:10px;width: 100px; height:30px;"><br><br>
                    </form>
                </div>
                <br>
                <h2 style="font-weight: 900; font-size: 2em; margin-top: 80px; margin-bottom: 40px;">내가 등록한 방</h2>
                <div id="myroom">
                <c:forEach var="myDealing" items="${myDealing}">
                    <div style="display: flex; margin-right: 20px;">
                        <div style="width: 200px; height: 200px;">
                            <img src="/dealing/${myDealing.user_Id}/${myDealing.dl_Image}" alt="매물사진"
                            style="width:200px; height: 200px;">
                        </div>
                        <div id="mydl">
                            <p>매물이름 : ${myDealing.dl_Title}</p><br>
                            <P>건물형태 : ${myDealing.dl_Form}</P><br>
                            <P>매매종류 : ${myDealing.dl_Form2}</P><br>
                            <p>방 개수 : ${myDealing.dl_Room}</p><br>
                            <p>매매가격 : ${myDealing.dl_Price}</p><br>
                            <p>조회수  : ${myDealing.dl_Views}</p><br>
                        </div>
                    </div>
                </c:forEach>
                </div>
                <br>
                <h2 style="font-weight: 900; font-size: 2em; margin-top: 80px; margin-bottom: 40px;">관심목록</h2>
                <div id="likeroom" style="display:flex;">
                    <div style="display:flex; margin-right: 20px;"><img src="images/네이버.PNG"
                            style="width:200px; height: 200px;"><br>
                        <div style="border: 1px solid #ccc; width: 200px; height: 200px;">OO동<br>
                            원룸<br>
                            주소:</div>
                    </div>
                    <div style="display:flex; margin-right: 20px;"><img src="images/네이버.PNG"
                            style="width:200px; height: 200px;"><br>
                        <div style="border: 1px solid #ccc; width: 200px; height: 200px;">OO동<br>
                            원룸<br>
                            주소:</div>
                    </div>
                    <div style="display:flex; margin-right: 20px;"><img src="images/네이버.PNG"
                            style="width:200px; height: 200px;"><br>
                        <div style="border: 1px solid #ccc; width: 200px; height: 200px;">OO동<br>
                            원룸<br>
                            주소:</div>
                    </div>
                </div>
                <hr>
                <br><br>
                <div class="report" style="width: 1000px;">
                    <h2 style="font-weight: 900; font-size: 2em; margin-top: 80px; margin-bottom: 40px;">허위매물 신고목록</h2><br>
                    <table class="table">
                        <tr style="height: 30px; line-height: 30px;">
                            <th>No</th>
                            <th>매물명</th>
                            <th>신고사유</th>
                            <th>신고일</th>
                        </tr>
                        <c:forEach var="myReport" items="${myReport}">
                            <tr style="border-bottom: 1px solid #ccc; height: 40px; line-height: 40px;">
                                <td>${myReport.dl_ReportNum}</td>
                                <td>${myReport.dl_Title}</td>
                                <td>${myReport.rp_Title}</td>
                                <td>${myReport.rp_Date}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <br><br><br>
                <form method="post" action="${contextPath}/removeMember.do">
                    <input type="submit" value="회원탈퇴" style="width: 150px; height: 30px; font-weight: bolder; color: red;">
                    </form>
            </div>

        </div>
    </body>

    </html>