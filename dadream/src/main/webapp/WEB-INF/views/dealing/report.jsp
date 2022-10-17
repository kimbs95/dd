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
    <title>신고하기</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        #rp_Title {
            display: flex;
            margin-left: 10px;
        }
        #dl_Num{
            margin-left: 10px;
        }

        #rp_Title input {
            width: 400px;
        }

        #rp_Content {
            display: flex;
         
        }

        #rp_Content  {
            margin-top: 5px;
        }

        #rpBtn {
            text-align: right;
            margin-top: 40px;
            margin-right: 20px;
        }
        #title{
            display: inline-flex;
        }
        #No{
            display: inline-flex;
            margin: 10px 0;
        }
        #reform{
            margin-left: 10px;
        }
    </style>
</head>

<body>
    <!--부트스트랩-->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <h1 style="margin: 20px 0 20px 10px;">신고하기</h1>
    <hr>
    <form id="reform" method="post" name="reprot" action="${contextPath}/report.do">
        <div id="No">
            <h3 >매물 번호 : </h3>
            <input type="text" id="dl_Num" name="dl_Num" value="${dl_Num}" readonly>
        </div>
        <div id="title">
            <h3>제목 :</h3><input type="text" size="40" id="rp_Title" name="rp_Title" />
        </div>
        <div >
            <h3>내용 :
            <textarea rows="20" id="rp_Content" cols="65" name="rp_Content"></textarea>
        </h3>
        </div>
        <div id="rpBtn">
            <button id="rep" type="button">신고하기</button>
        </div>
    </form>
    <script>
        
        document.querySelector("#rep").addEventListener("click", async (e) => {
            let dl_Num = +document.querySelector("#dl_Num").value;
            let rp_Title = document.querySelector("#rp_Title").value;
            let rp_Content = document.querySelector("#rp_Content").value;

            if (!confirm("신고하시겠습니까?")) {
                return;
            }
            let req = await fetch("/report.do", {
                method: "POST",
                headers: {
                    "content-type": "application/json"
                },
                body: JSON.stringify({
                    dl_Num: dl_Num,
                    rp_Title: rp_Title,
                    rp_Content: rp_Content
                })
            })
            if(req.status = 200 ){
                let result = await req.json();
                if(result.result === 1){
                    alert("신고가 완료되었습니다.")
                    window.close();
                    return;
                }else{
                    alert("다시 시도 하세요");
                    return;
                }
            }else{
                alert("서버 오류");
                return;
            }




        })
    </script>
</body>

</html>