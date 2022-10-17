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
         
            .myLike {
                overflow-x: auto;
                overflow-y: hidden;
                margin-bottom: 100px;
            }

            .jjimContents {
                border: 1px solid #ccc;
                width: 300px;
                height: 200px;
                padding: 10px;
            }
            #btn{
                margin-left: 10px;
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
        <!-- <h1>${empty user_Pwd ? "안 넘어옴" : "넘어옴"}</h1> -->
        <div class="mypagecontrol" style="display: flex; flex-direction: column; margin-left: 140px;">


            <div class="mypage">

                <div>


                    <form>
                        <h3 style="font-weight: 900; font-size: 2em;">회원정보 변경</h3><br>
                        <label style="font-weight: 700; ">ID</label><br>
                        <input type="text" style="margin: 10px 0;" value="${member.user_Id}" disabled><br>
                        <p>비밀번호</p>
                        <input type="password" value="${members.user_Pwd}" id="infoPwdCheck" name="user_Pwd" disabled>
                        <p>비밀번호 재확인</p>
                        <input type="password" id="infoPwdCheck2" value="${members.user_Pwd}"  disabled>
                        <p>이메일</p>
                        <input type="text" id="infoEmailCheck" value="${members.user_Email}" disabled>
                        <p>핸드폰</p>
                        <input type="text" id="infoPhoneCheck" value="${members.user_Phone}" disabled>
                        <p style="margin-bottom: 5px; font-weight: bold;">주소</p>
                        <input type="text" size="50" id="infoAddress2Check" value ="${members.user_Address2}" disabled>
                        <br>
                        <br>
                        <p style="margin-bottom: 5px; font-weight: bold;">상세주소</p>
                        <input type="text" size="20" id="infoAddress3Check" value="${members.user_Address3}" style="margin-top: 3px;" disabled>
                        <br><br>
                        <input type="submit" name="mod" id="change" value="변경"
                            style="font-weight:700; margin-top:10px;width: 100px; height:30px;"><br><br>
                    </form>
                    <div class="passwordcheck"></div>
                    <script>
                        let infoPwdCheck2= document.querySelector("#infoPwdCheck2");
                        let passwordcheck =document.querySelector(".passwordcheck");
                        let infoPwdCheck =document.querySelector("#infoPwdCheck");
                        let infoEmailCheck=document.querySelector("#infoEmailCheck");
                        let infoPhoneCheck=document.querySelector("#infoPhoneCheck");
                        let infoAddress2Check=document.querySelector("#infoAddress2Check");
                        let infoAddress3Check=document.querySelector("#infoAddress3Check");
                        document.querySelector("#change").addEventListener("click",(e)=>{
                            e.preventDefault();
                            let check = document.createElement("input");
                            let btn = document.createElement("input");
                            btn.setAttribute("type","button");
                            btn.setAttribute("id","btn");
                            btn.setAttribute("value","비밀번호확인");
                            check.setAttribute("type","password");
                            check.setAttribute("placeholder","기존 비밀번호");
                            passwordcheck.appendChild(check);
                            passwordcheck.appendChild(btn);
                            check.focus();
                            btn.addEventListener("click", async (e)=>{
                                console.log(check.value);
                                if(e.target.matches("#btn")){
                                    let pwd = await fetch("/infoCheck.do",{
                                        method:"POST",
                                        headers:{"content-type":"application/json"},
                                        body:JSON.stringify({
                                            user_Id:"${member.user_Id}",
                                            user_Pwd:check.value
                                        })

                                    })
                                    if(pwd.status ===200){
                                        let res = await pwd.json();
                                        if(res.userCheck === 1){
                                            alert("확인되었습니다");
                                            passwordcheck.setAttribute("style","display:none;");
                                            infoPwdCheck.removeAttribute("disabled");
                                            infoPwdCheck2.removeAttribute("disabled");
                                            infoEmailCheck.removeAttribute("disabled");
                                            infoPhoneCheck.removeAttribute("disabled");
                                            infoAddress2Check.removeAttribute("disabled");
                                            infoAddress3Check.removeAttribute("disabled");
                                            document.querySelector("#change").setAttribute("value","수정하기");
                                            document.querySelector("#change").classList.add("changeMod");
                                        }else{
                                            alert("비밀번호가 틀립니다.");
                                        }
                                        document.querySelector(".changeMod").addEventListener("click", async (e)=>{
                                            if(e.target.matches(".changeMod")){
                                                if(!confirm("수정하시겠습니까?")){
                                                    return;
                                                }
                                                if(infoPwdCheck.value !== infoPwdCheck2.value){
                                                    alert("비밀번호가 일치하지않습니다.");
                                                    infoPwdCheck.focus();
                                                    infoPwdCheck.value='';
                                                    infoPwdCheck2.value='';
                                                    return;
                                                }
                                                let mod = await fetch("/memberMod.do",{
                                                    method:"POST",
                                                    headers:{"content-type":"application/json"},
                                                    body:JSON.stringify({
                                                        user_Id:"${member.user_Id}",
                                                        user_Pwd:infoPwdCheck.value,
                                                        user_Email:infoEmailCheck.value,
                                                        user_Phone:infoPhoneCheck.value,
                                                        user_Address2:infoAddress2Check.value,
                                                        user_Address3:infoAddress3Check.value
                                                    })
                                                })
                                                if(mod.status === 200){
                                                    let response = await mod.json();
                                                    if(response.check ===1){
                                                        alert("수정이 완료되었습니다.");
                                                        infoPwdCheck.disabled=true;
                                                        infoPwdCheck2.disabled=true;
                                                        infoEmailCheck.disabled=true;
                                                        infoPhoneCheck.disabled=true;
                                                        infoAddress2Check.disabled=true;
                                                        infoAddress3Check.disabled=true;
                                                        location.reload();
                                                    }
                                                }
                                            }

                                        })
                                    }
                                }
                            })
                        })
                    </script>
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
                <div class="myLike" style="background: gainsboro;">
                    <c:forEach var="jjimList" items="${myJjim}">
                        <c:forEach var="myDealing2" items="${jjimList.dealing}">
                            <div style="display: flex; margin-right: 20px;">
                                <div>
                                    <img src="/dealing/${jjimList.user_Id}/${myDealing2.dl_Image}" alt="매물사진" style="width:200px; height:200px">
                                </div>
                                <div class="jjimContents">
                                    <p>매물이름 : ${myDealing2.dl_Title}</p><br>
                                    <p>건물형태 : ${myDealing2.dl_Form}</p><br>
                                    <P>매매종류 : ${myDealing2.dl_Form2}</P><br>
                                    <p>방 개수 : ${myDealing2.dl_Room}</p><br>
                                    <p>매매가격 : ${myDealing2.dl_Price}</p><br>
                                    <p>조회수 : ${myDealing2.dl_Views}</p><br>
                                </div>
                            </div>
                        </c:forEach>
                    </c:forEach>
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
                                <td>${myReport.rp_Title}</td>
                                <td>${myReport.rp_Content}</td>
                                <td>${myReport.rp_Date}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <br><br><br>
                <!-- <form method="post" action="${contextPath}/removeMember.do">
                <input type="submit" value="회원탈퇴" style="width: 150px; height: 30px; font-weight: bolder; color: red;">
                </form> -->
                <button type="button" onclick="pwdCheck()" value="회원탈퇴" style="width: 150px; height: 30px; font-weight: bolder; color: red;">회원탈퇴</button>
            </div>

        </div>

        <script>
            var user_Id = "${member.user_Id}"
            console.log(user_Id);

            function pwdCheck() {
                let pwdCheck = prompt("비밀번호 확인","비밀번호 를 입력해주세요");
            console.log(pwdCheck);
                if(pwdCheck === null && pwdCheck === "") {
                    console.log("다시 시도하십시오.");
                } else{
                    if(!confirm("정말로 탈퇴하시겠습니까?")){
                        alert("탈퇴가 취소되었습니다.");
                        return;
                    }
                    $.ajax({
                        url:"pwdCheck.do",
                        type: "post",
                        dataType: "json",
                        data: {pwdCheck, user_Id},
                        success: function(result) {
                            console.log(result.userCheck);
                            if(result.userCheck === 1 ) {
                                location.href="/removeMember.do"
                                alert("탈퇴가 완료되었습니다.");
                                return;
                            }
                            else if(result.userCheck !== 1) {
                                alert("비밀번호가 틀립니다.");
                                return;
                            }

                            
                        },
                        error: function() {
                            alert("오류");
                        }

                    });
                    return;
                } 

                // function deleteMem() {
                //     var form = document.createElement('form');
                //     form.setAttribute('method', 'post');
                //     form.setAttribute('action', 'removeMember.do');
                //     document.charset = "utf-8";

                //     form.submit();
                // }

                // if(!confirm("정말로 탈퇴하시겠습니까?")) {
                //     console.log("탈퇴취소");
                // }

            }
        </script>
    </body>

    </html>