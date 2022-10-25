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
        <title>상품관리</title>
        <style>
            #productInfo {}

            .proImage {
                width: 222px;
                height: 222px;
            }

            #proform {
                /* display: flex; */
                
            }
            #proform>*{
                margin: 10px;
            }

            .sun {
                display: flex;
                border-bottom: 1px solid #000;
                margin: 10px;
                padding: 10px;
            }
            #myproduct{
                width: 700px;
            }
            .modelete{
                display: flex;

            }
            .modelete > form{
                margin-right: 10px;
            }
            .modman{
                font-weight: bold;
                font-size: 30px;
            }
            #myproduct{
                border: 1px solid #000;
                margin-top: 10px;
            }
        
        </style>
        <!-- css -->
    </head>

    <body>
        <div>
            <h2 class="modman">상품관리</h2>
            <div id="myproduct">
                <c:forEach var="i" items="${pro}">
                    <div id="productInfo">
                        <c:if test="${member.user_Id == i.user_Id}">
                            <div class="sun">
                                <img class="proImage" src="/product/${i.user_Id}/${i.product_Image}" alt="상품사진">
                                <div id="proform">
                                    <p>상품명 : ${i.product_Name}</p>
                                    <p>상품 가격 : ${i.product_Price}</p>
                                    <p>재고 : ${i.product_TotalCount}</p>
                                    <p>조회수 : ${i.product_Views}</p>
                                    <div class="modelete">
                                        <form action="/productMod.do" method="post">
                                            <input type="hidden" value ="${i.product_Num}" name="product_Num">
                                            <input type="hidden" value="${i.user_Id}" name="user_Id">
                                            <button type="submit">수정</button>
                                        </form>
                                        <button type="button" value="${i.product_Num}" name="product_Num" id="proDelete">삭제</button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </c:forEach>
            </div>
        </div>
        <script>
            let proDelete = document.querySelector("#proDelete");
            let proDeletes =document.querySelectorAll("#proDelete");
            for(let i = 0; i<proDeletes.length; i++){
                let proNum = +document.querySelectorAll("#proDelete")[i].value;
                console.log(proNum);
                
                
                proDeletes[i].addEventListener("click", async (e) => {
                console.log(typeof(proNum));
                if(!confirm("상품을 삭제 하시겠습니까?")){
                    return;
                }
                let res = await fetch("/proDelete.do", {
                    method: "POST",
                    headers: {
                        "content-type": "application/json"
                    },
                    body: JSON.stringify(
                        proNum
                    )                    
                })
                if(res.status === 200){
                    let check = await res.json();
                    if(check.result===1){
                        alert("삭제 완료");
                        location.reload();
                        return;
                    }else{
                        alert("다시 시도해주세요");
                        return;
                    }
                }
                alert("서버 오류");

            })
        }
        </script>
    </body>

    </html>