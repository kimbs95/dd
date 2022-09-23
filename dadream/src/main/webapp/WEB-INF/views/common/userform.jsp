<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입창</title>
    <!-- css -->
    <link rel="stylesheet" href="/css/userform.css">
</head>

<body>
    <form class="userform" action="${contextPath}/addMember.do" method="post">
        <fieldset>
            <h1>회원가입</h1>
            <br><br>
            <div class="form1">


                <h3>이름</h3>
                <div class="userformbtn">
                    <input type="text" id="userName" name="user_Name" size="40" /><br><br>
                </div>
                <h3>아이디</h3>
                <div class="userformbtn">
                    <input type="text" id="userId" name="user_Id" size="40" /> <button>중복확인</button><br><br>
                </div>
                <h3>비밀번호</h3>
                <div class="userformbtn">
                    <input type="password" id="userPwd" name="user_Pwd" size="40" /><br><br>
                </div>
                <h3>비밀번호 확인</h3>
                <div class="userformbtn">
                    <input type="password" id="userPwd2" name="비밀번호확인" size="40" /><br><br>
                </div>
                <h3>주소</h3>
                <div class="userformbtn">
                    <input type="text" id="sample4_postcode" placeholder="우편번호" name="user_Address1" size="40" /> <input type="button"
                        onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br><br>
                </div>
                <h3>도로명주소</h3>
                <div class="userformbtn">
                    <input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="user_Address2"
                        size="40" /><br><br>
                    <input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" name="user_Address2" size="40" />
                    <span id="guide" style="color:#999;display:none"></span>
                </div>
                <h3>상세주소</h3>
                <div class="userformbtn">
                    <input type="text" id="userAddress2" name="user_Address3" size="40" /><br><br>
                </div>
                <h3>이메일</h3>
                <div class="userformbtn">
                    <input type="email" id="userEmail" name="user_Email" size="40" /><br><br>
                </div>
                <h3>휴대폰 인증</h3>
                <div class="userformbtn">
                    <input type="text" id="phoneNumber" name="user_Phone" size="40" /> <button>인증번호 받기</button><br><br>
                </div>
                <h3>인증번호 입력</h3>
                <div class="userformbtn">
                    <input type="text" id="phoneCheck" name="휴대폰인증" size="40" /> <button>인증번호 확인</button>
                </div>

                <!--판매자 ,중개사 전용 태그-->
                <c:choose>
                    <c:when test="${memberjoin == '2'}">
                        <h3>사업자 번호</h3>
                        <div class="userformbtn">
                            <input type="text" id="businessNum" name="user_Business" size="40" />
                            <input type="hidden" name="user_Level"  value =2>
                        </div>
                    </c:when>
                    <c:when test="${memberjoin == '3'}">
                        <h3>사업자 번호</h3>
                        <div class="userformbtn">
                            <input type="text" id="businessNum" name="user_Business" size="40" />
                            <input type="hidden" name="user_Level"  value =3>
                        </div>
                    </c:when>
                </c:choose>
                <input type="submit" value="회원가입"
                    style="margin-left: 135px; margin-top: 20px; width: 100px; height: 40px;">
            </div>
        </fieldset>
    </form>


    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
                        guideTextBox.style.display = 'block';

                    } else if (data.autoJibunAddress) {
                        var expJibunAddr = data.autoJibunAddress;
                        guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                        guideTextBox.style.display = 'block';
                    } else {
                        guideTextBox.innerHTML = '';
                        guideTextBox.style.display = 'none';
                    }
                }
            }).open();
        }
    </script>

</body>

</html>