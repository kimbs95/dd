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
    <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />
    <!-- css -->
    <link rel="stylesheet" href="/css/productform.css">


</head>

<body>
    <!--부트스트랩-->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <div class="first">
        <h1 style="margin:20px 0 0 10px; font: bold;">상품등록</h1>
        <br><br><br><br>
        <form class="product_form" method="post" action="/productpost.do" enctype="multipart/form-data">
            <div class="middle">

                <!--이미지 div-->
                <div class="dlImg">
                    <div class="dlMain">
                        <!-- 드롭존을 적용할 클래스이름을 dropzone 해야 css테마가 적용된다 -->
                        <div class="dropzone dz1" style="width:500px; height: 400px;">

                        </div>

                        <script>
                            Dropzone.autoDiscover = false; // deprecated 된 옵션. false로 해놓는걸 공식문서에서 명시

                            const dropzone = new Dropzone("div.dropzone.dz1", {
                                url: "https://httpbin.org/post",
                                dictDefaultMessage: "대표 이미지를 등록해주세요.",
                                autoProcessQueue: false, //자동으로 보내기
                                clickable: true, // 클릭 가능 여부
                                autoQueue: false, // 드래그 드랍 후 바로 서버로 전송
                                createImageThumbnails: true, //파일 업로드 썸네일 생성
                                thumbnailHeight: 150, // Upload icon size
                                thumbnailWidth: 150, // Upload icon size
                                maxFiles: 1, // 업로드 파일수
                                maxFilesize: 1000, // 최대업로드용량 : 1000MB
                                paramName: 'dl_Image', // 서버에서 사용할 formdata 이름 설정 (default는 file)
                                uploadMultiple: false, // 다중업로드 기능
                                timeout: 300000, //커넥션 타임아웃 설정 -> 데이터가 클 경우 꼭 넉넉히 설정해주자
                                addRemoveLinks: true, // 업로드 후 파일 삭제버튼 표시 여부
                                dictRemoveFile: '삭제', // 삭제버튼 표시 텍스트
                                acceptedFiles: '.jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF', // 이미지 파일 포맷만 허용
                            });
                        </script>
                    </div>

                    <div class="dlThumbnail1">
                        <!-- 드롭존을 적용할 클래스이름을 dropzone 해야 css테마가 적용된다 -->
                        <div class="dropzone dz2" style="width:500px; height: 200px;">
                        </div>

                        <script>
                            Dropzone.autoDiscover = false; // deprecated 된 옵션. false로 해놓는걸 공식문서에서 명시

                            const dropzone2 = new Dropzone("div.dropzone.dz2", {
                                url: "https://httpbin.org/post",
                                dictDefaultMessage: "추가 할 이미지를 등록해주세요.",
                                autoProcessQueue: false, //자동으로 보내기
                                clickable: true, // 클릭 가능 여부
                                autoQueue: false, // 드래그 드랍 후 바로 서버로 전송
                                // createImageThumbnails: true, //파일 업로드 썸네일 생성
                                // thumbnailHeight: 150, // Upload icon size
                                // thumbnailWidth: 150, // Upload icon size
                                maxFiles: 10, // 업로드 파일수
                                maxFilesize: 1000, // 최대업로드용량 : 1000MB
                                paramName: 'dl_Image', // 서버에서 사용할 formdata 이름 설정 (default는 file)
                                uploadMultiple: false, // 다중업로드 기능
                                timeout: 300000, //커넥션 타임아웃 설정 -> 데이터가 클 경우 꼭 넉넉히 설정해주자
                                addRemoveLinks: true, // 업로드 후 파일 삭제버튼 표시 여부
                                dictRemoveFile: '삭제', // 삭제버튼 표시 텍스트
                                acceptedFiles: '.jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF', // 이미지 파일 포맷만 허용
                            });
                        </script>

                    </div>
                </div>


                <!-- 텍스트추가 -->
                <script src="http://code.jquery.com/jquery-latest.min.js"></script>
                <script type="text/javascript">
                    var cnt = 1;

                    function fn_addtext() {
                        $("#d_text").append("<br>" +
                            "<input type='text' name='product_Option1' size='32'  placeholder='상품 옵션을 입력하세요.' />");
                        cnt++;
                    }
                    var cnt = 1;

                    function fn_addtext2() {
                        $("#d_text2").append("<br>" +
                            "<input type='text' name='product_Option2' size='32'  placeholder='상품 추가 옵션을 입력하세요.' />"
                            );
                        cnt++;
                    }
                </script>
                <!--상품 설명div-->
                <div class="productcg">
                    <div class="productcon">
                        <h3>상품제목</h3>
                        <input type="text" class="width300" name="product_Name" placeholder="ex)뜨거운침대" size="70">
                        <br><br>
                        <h3>상품설명</h3>
                        <!-- <input type="text" class="width300" name="product_Content" placeholder="ex) 뜨거운침대는 매우 큰 사이즈입니다."
                            size="70"> -->
                            <textarea name="product_Content" id="" cols="70" rows="15" placeholder="상품 상세 설명"></textarea>
                        <br><br>
                    </div>
                    <div class="pfcontrol">
                        <div class="flexnum">
                            <div class="margin10">
                                <h3>상품가격</h3>
                                <input type="text" class="width145" name="product_Price" placeholder="상품가격을 입력하세요."
                                    size="32">
                                <br><br>
                            </div>
                            <div class="margin10">
                                <h3>상품수량</h3>
                                <input type="text" class="width145" name="product_TotalCount"
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
                <h2 style="width:150px; font-weight: bold; margin: 15px 0; ">상품설명이미지 등록</h2>
                <!-- 드롭존을 적용할 클래스이름을 dropzone 해야 css테마가 적용된다 -->
                <div class="dropzone dz3" style="width:1130px; height: 200px;">
                </div>

                <script>
                    Dropzone.autoDiscover = false; // deprecated 된 옵션. false로 해놓는걸 공식문서에서 명시

                    const dropzone3 = new Dropzone("div.dropzone.dz3", {
                        url: "https://httpbin.org/post",
                        dictDefaultMessage: "추가 할 이미지를 등록해주세요.",
                        autoProcessQueue: false, //자동으로 보내기
                        clickable: true, // 클릭 가능 여부
                        autoQueue: false, // 드래그 드랍 후 바로 서버로 전송
                        // createImageThumbnails: true, //파일 업로드 썸네일 생성
                        // thumbnailHeight: 150, // Upload icon size
                        // thumbnailWidth: 150, // Upload icon size
                        maxFiles: 10, // 업로드 파일수
                        maxFilesize: 1000, // 최대업로드용량 : 1000MB
                        paramName: 'dl_Image', // 서버에서 사용할 formdata 이름 설정 (default는 file)
                        uploadMultiple: false, // 다중업로드 기능
                        timeout: 300000, //커넥션 타임아웃 설정 -> 데이터가 클 경우 꼭 넉넉히 설정해주자
                        addRemoveLinks: true, // 업로드 후 파일 삭제버튼 표시 여부
                        dictRemoveFile: '삭제', // 삭제버튼 표시 텍스트
                        acceptedFiles: '.jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF', // 이미지 파일 포맷만 허용
                    });
                </script>

            </div>


            <div class="bds02">
                <input type="submit" class="btn btn-secondary btn-lg"
                    value="등록하기">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset"
                    class="btn btn-secondary btn-lg" value="다시입력">
            </div>
        </form>

    </div>
    </div>
</body>

</html>