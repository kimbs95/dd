<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="result" value="{param.result}" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script defer type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script defer type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js">
    </script>

    <title>회원가입창</title>
    <!-- css -->
    <link rel="stylesheet" href="/css/userform.css">
    <style>
        .error {
            color: red;
            display: block;
        }
        #user_Id-error, #user_Pwd-error,#user_Pwd2-error ,#user_Email-error{
            margin-top: 5px;
        }

        .id {
            display: inline-flex;
        }

        #idcheck {
            display: inline;
            height: 32px;
            margin-left: 10px;
            line-height: 32px;
        }

        #user_Id {
            height: 32px;

        }
        .form1 input{
            height: 32px;
        }
        .userformbtn {
            height: 55px;
        }
    </style>
</head>

<body>
    <form id="userform" action="${contextPath}/addMember.do" method="post" onsubmit="return check()">
        <fieldset>
            <h1>회원가입</h1>
            <br><br>
            <div class="form1">


                <h3>이름</h3>
                <div class="userformbtn">
                    <input type="text" id="user_Name" name="user_Name" size="40" /><br><br>
                </div>
                <h3>아이디</h3>
                <div class="userformbtn" >
                    <div class="id">
                        <div>
                            <input type="text" id="user_Id" name="user_Id" size="40" />
                        </div>
                        <button id="idcheck">중복확인</button>
                    </div>
                </div>
                <h3 class="idcheckresult"></h3>

                <label class="error"></label>
                <h3>비밀번호</h3>
                <div class="userformbtn">
                    <input type="password" id="user_Pwd" name="user_Pwd" size="40" /><span id="pwd"></span><br><br>
                </div>
                <h3>비밀번호 확인</h3>
                <div class="userformbtn">
                    <input type="password" id="user_Pwd2" name="user_Pwd2" size="40" /><span id="pwd2"></span><br><br>
                </div>
                <h3>주소</h3>
                <div class="userformbtn">
                    <input type="text" id="sample4_postcode" placeholder="우편번호" name="user_Address1" size="40" /> <input
                        type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br><br>
                </div>
                <h3>도로명주소</h3>
                <div class="userformbtn">
                    <input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="user_Address2"
                        size="40" /><br><br>
                    <input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" name="user_Address2" size="40" />
                    <input type="hidden" id="sample4_extraAddress">
                    <input type="hidden" id="sample4_engAddress">
                    <span id="guide" style="color:#999;display:none"></span>
                </div>
                <h3>상세주소</h3>
                <div class="userformbtn">
                    <input type="text" id="userAddress2" name="user_Address3" size="40" /><br><br>
                </div>
                <h3>이메일</h3>
                <div class="userformbtn">
                    <input type="email" id="user_Email" name="user_Email" size="40" /><br><br>
                </div>
                <h3>휴대폰 인증</h3>
                <div class="userformbtn">
                    <input type="text" id="user_Phone" name="user_Phone" size="40" /> <button>인증번호 받기</button><br><br>
                </div>
                <h3>인증번호 입력</h3>
                <div class="userformbtn">
                    <input type="text" id="phoneCheck" name="휴대폰인증" size="40" /> <button>인증번호 확인</button>
                </div>

                <!--판매자 ,중개사 전용 태그-->
                <c:choose>
                    <c:when test="${memberjoin == '1'}">
                        <input type="hidden" name="user_Level" value=1>
                    </c:when>
                    <c:when test="${memberjoin == '2'}">
                        <h3>사업자 번호</h3>
                        <div class="userformbtn">
                            <input type="text" id="businessNum" name="user_Business" size="40" />
                            <input type="hidden" name="user_Level" value=2>
                        </div>
                    </c:when>
                    <c:when test="${memberjoin == '3'}">
                        <h3>사업자 번호</h3>
                        <div class="userformbtn">
                            <input type="text" id="businessNum" name="user_Business" size="40" />
                            <input type="hidden" name="user_Level" value=3>
                        </div>
                    </c:when>
                </c:choose>
                <input type="submit" value="회원가입"
                    style="margin-left: 135px; margin-top: 20px; width: 100px; height: 40px;">

        </fieldset>
    </form>

</body>
<!-- 회원가입 유효성 검사(alert)-->
<script type="text/javascript">
    function check() {


        //값 불러오기
        let getId = document.getElementById("user_Id");
        let getPw = document.getElementById("user_Pwd");
        let getPwCheck = document.getElementById("user_Pwd2");
        let getMail = document.getElementById("user_Email");
        let getName = document.getElementById("user_Name");



        //value 불러오기
        let user_Id = getId.value;
        let user_Pwd = getPw.value;
        let user_Pwd2 = getPwCheck.value;
        let user_Email = getMail.value;
        let user_Name = getName.value;


        //유효성 검사(정규식패턴)
        let regExp = /^[a-zA-Z0-9]{4,12}$/; //아이디 
        let regPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8,16}$/; //비밀번호
        let regName = /^[가-힝]{2,}$/; //이름
        let regMail = /[a-z0-9]{2,}@[a-z0-9-]{2,}.[a-z0-9]{2,}/i; //이메일

        if (!regExp.test(user_Id)) { //id
            alert("아이디를 다시 입력하세요.");
            getId.value = "";
            getId.focus();
            return false;
        } else if (!regPw.test(user_Pwd)) { //password
            alert("비밀번호를 다시 입력하세요.");
            getPw.value = "";
            getPw.focus();
            return false;
        } else if (!(user_Pwd2.slice(0, user_Pwd2.length) == user_Pwd.slice(0, user_Pwd.length))) { //password 동일한지 확인
            alert("비밀번호가 일치하지 않습니다.");
            getPwCheck.value = "";
            getPwCheck.focus();
            return false;
        } else if ((user_Pwd.slice(0, user_Pwd2.length) == user_Id.slice(0, user_Id.length))) { //password랑 id 다른지 확인
            alert("비밀번호랑 ID가 동일합니다.");
            getPw.value = "";
            getPwCheck.value = "";
            getPw.focus();
            return false;
        } else if (!regMail.test(user_Email)) { //메일주소 확인
            alert("이메일형식에 맞게 작성하세요.");
            getMail.value = "";
            getMail.focus();
            return false;
        } else if (!regName.test(user_Name)) { //이름 확인
            alert("이름을 다시입력하세요.");
            getName.value = "";
            getName.focus();
            return false;
        } else {
            document.querySelector("#userform").submit();
        }




    }
</script>


<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data
                        .buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraRoadAddr !== '') {
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                document.getElementById("sample4_engAddress").value = data.addressEnglish;

                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if (roadAddr !== '') {
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if (data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'none';

                } else if (data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'none';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
<!-- 아이디 중복체크 -->
<script>
    document.addEventListener("DOMContentLoaded", () => {

        const idcheck = document.querySelector("#idcheck");
        idcheck.addEventListener("click", async (e) => {
            const idcheckresult = document.querySelector(".idcheckresult");
            const userId = document.querySelector("#user_Id").value;
            console.log(userId);
            e.preventDefault();
            const res = await fetch('/idcheck.do', {
                method: 'POST',
                headers: {
                    'content-type': 'application/json'
                },
                body: JSON.stringify({
                    user_Id: userId,

                })

            });
            if (res.status === 200) {
                let jsondata = await res.json();
                if (jsondata.resultCode !== 0) {
                    alert("중복된 아이디가 있습니다");
                    document.querySelector("#user_Id").value = '';
                    return;
                } else if (jsondata.resultCode === 0) {
                    alert("사용가능한 아이디입니다.");
                }
            } else {
                alert('예상치 못한 오류가 발생하였습니다.');
            }


        });
    });
</script>

<!-- jQuery.validate 플러그인 삽입 -->
<script>
    document.querySelector("#userform").addEventListener("keyup", () => {

        $(document).ready(function () {
            // 기본형태 $('#registerForm').validate(); 유효성 검사를 적용 validate signup form on keyup
            // and submit 확장옵션
            $('#userform').validate({
                rules: {
                    user_Id: {
                        required: true,
                        minlength: 4,
                        remote: "Validate"
                    },
                    user_Pwd: "required",
                    user_Pwd2: {
                        required: true,
                        equalTo: '#user_Pwd'
                    },
                    user_Name: {
                        required: true
                    },
                    user_Email: {
                        required: true,
                        email: true
                    }
                },
                messages: {
                    user_Id: {
                        required: "아이디를 입력하세요.",
                        minlength: jQuery.validator.format("아이디는 {0}자 이상 입력해주세요!"),
                        remote: jQuery.validator.format("입력하신 {0}는 이미존재하는 아이디입니다. ")
                    },
                    user_Pwd: "비밀번호를 입력하세요.",
                    user_Pwd2: {
                        required: "비밀번호를 입력하시요.",
                        equalTo: "비밀번호를 다시 확인하세요"
                    },
                    user_Name: {
                        required: "이름을 입력하세요."
                    },
                    user_Email: {
                        required: "이메일을 입력하세요.",
                        email: "이메일 형식에 맞게 입력하세요."
                    }
                },



                submitHandler: function (frm) {
                    frm.submit();
                    //유효성 검사를 통과시 전송
                },
                success: function (e) {
                    //
                }

            });

        }); //end ready()
    })
</script>


</html>