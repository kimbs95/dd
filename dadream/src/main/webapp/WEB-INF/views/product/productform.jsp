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
    <title>가구 상품등록</title>
    <!--부트스트랩-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- 파일업로드 드래그앤드롭 -->
    <!-- <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script> -->
    <!-- <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" /> -->
    <!-- css -->
    <link rel="stylesheet" href="/css/productform.css">
    <!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->



</head>

<body>
    <!--부트스트랩-->
    <!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script> -->

    <div class="first">
        <h1 style="margin:20px 0 0 10px; font: bold;">상품등록</h1>
        <br><br><br><br>
        <form class="product_form" method="post" action="/productpost.do" enctype="multipart/form-data">
            <div class="middle">

                <!--이미지 div-->
                <div class="dlImg">
                    <div class="dlMain">
                        <label for="product_Image">이미지 를 골라주세요</label><br>
                        <input type="file" id="product_Image" name="product_Image" accept="image/*" multiple>
                        <img id="preview" src="" width=200 height=200 />
                        <h1 class="imgh1"></h1>
                    </div>
                </div>

                <!-- 텍스트추가 -->
                <script src="http://code.jquery.com/jquery-latest.min.js"></script>
                <script type="text/javascript">
                    var cnt = 1;

                    function fn_addtext() {
                        $("#d_text").append("<br>" +
                            "<input type='text' id='product_Option1' name='product_Option1' size='32'  placeholder='상품 옵션을 입력하세요.' />"
                        );
                        cnt++;
                    }
                    var cnt = 1;

                    function fn_addtext2() {
                        $("#d_text2").append("<br>" +
                            "<input type='text' id='product_Option2' name='product_Option2' size='32'  placeholder='상품 추가 옵션을 입력하세요.' />"
                        );
                        cnt++;
                    }
                </script>
                <!--상품 설명div-->
                <div class="productcg">
                    <div class="productcon">
                        <h3>상품제목</h3>
                        <input type="text" class="width300" id="product_Name" name="product_Name" placeholder="ex)뜨거운침대"
                            size="70">
                        <br><br>
                        <h3>상품설명</h3>
                        <!-- <input type="text" class="width300" name="product_Content" placeholder="ex) 뜨거운침대는 매우 큰 사이즈입니다."
                            size="70"> -->
                        <textarea id="product_Content" name="product_Content" id="" cols="70" rows="15"
                            placeholder="상품 상세 설명"></textarea>
                        <br><br>
                    </div>
                    <div class="pfcontrol">
                        <div class="flexnum">
                            <div class="margin10">
                                <h3>상품가격</h3>
                                <input type="text" class="width145" id="product_Price" name="product_Price"
                                    placeholder="상품가격을 입력하세요." size="32">
                                <br><br>
                            </div>
                            <div class="margin10">
                                <h3>상품수량</h3>
                                <input type="text" class="width145" id="product_TotalCount" name="product_TotalCount"
                                    placeholder="상품수량을 입력해주세요." size="32">
                                <br><br>
                            </div>
                        </div>

                        <div class="option_all">
                            <div class="option">
                                <div class="flex_option">
                                    <h3>옵션 <input type="button" value="추가" onclick="fn_addtext()" class="text_button" />
                                    </h3>

                                </div>


                                <div id="d_text"></div>
                                <br><br>
                            </div>
                            <div class="option1">
                                <div class="flex_option">
                                    <h3>추가옵션 <input type="button" value="추가" onclick="fn_addtext2()"
                                            class="text_button2" /></h3>
                                </div>
                                <div id="d_text2"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="dlThumbnail2">


            </div>


            <div class="bds02">
                <input type="submit" id="productsubmit" class="btn btn-secondary btn-lg"
                    value="등록하기">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="reset" class="btn btn-secondary btn-lg" value="다시입력">
            </div>
        </form>

    </div>
    </div>
    <script>
        // 썸네일 코드 
        document.addEventListener('DOMContentLoaded', () => {
            document.querySelector("#product_Image").addEventListener("change", async e => {
                const preview = document.querySelector("#preview");
                document.querySelector(".imgh1").innerHTML = "감사합니다";
                let reader = new FileReader();
                reader.onloadend = finished => {
                    preview.setAttribute('src', finished.target.result);
                    console.log(finished.target.result);
                }
                reader.readAsDataURL(e.target.files.item(0));
            })

            // // 등록 버튼 누를시 
            // document.querySelector("#productsubmit").addEventListener("click", async () => {



            // })
        });
    </script>

</body>

</html>