<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>부동산 매물수정</title>
    <!--부트스트랩-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- 파일업로드 드래그앤드롭 -->
    <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css"/>
    <!-- css -->
    <link rel="stylesheet" href="/css/dealingmod.css">

</head>
<body>
    <!--부트스트랩-->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<div class="first">
    <h1 style="margin:20px 0 0 10px; font: bold;">매물수정</h1>
    <br><br><br><br>
<form method="get" action="" enctype="multipart/form-data">
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
   
    <!--상품 설명div-->
    <div class="dealingcon">
            <h3>건물이름</h3>
            <input type="text" name="dl_title" placeholder="건물명을 입력해주세요." size="50">
            <br><br>
            <h3>도시명</h3>
            <input type="text" name="dl_city" placeholder="ex) 서울, 부산, 대전" size="50">
            <br><br>
            <h3>주소입력</h3>
            <input type="text" name="dl_Map" placeholder="건물주소를 입력하세요." size="50">
            <br><br>
            <h3>가격</h3>
            <input type="text" name="dl_Price" placeholder="희망하시는 가격을 입력해주세요." size="50">
            <br><br>
            <h3>매물정보</h3>
            <input type="text" name="dl_Info" placeholder="매물의 추가정보를 입력해주세요." size="50">
            <br><br>
            <h3>상세설명</h3>
            <input type="text" name="dl_Content" placeholder="매물에 대한 상세설명을 입력해주세요." size="50">
    </div>
</div>

    <!--카테고리-->
    <div class="cg">
        <h3>카테고리 선택</h3>
        <br><br>
            <h5>건물형태</h5>
            <select>
                <option name="cg_Type1" value="아파트">아파트</option>
                <option name="cg_Type1" value="투룸+">투룸+</option>
                <option name="cg_Type1" value="원룸">원룸</option>
                <option name="cg_Type1" value="오피스텔">오피스텔</option>
                <option name="cg_Type1" value="주택">주택</option>
            </select>
            <br><br>
            <h5>매물종류</h5>
            <select>
                <option name="cg_Type2" value="매매">매매</option>
                <option name="cg_Type2" value="월세">월세</option>
                <option name="cg_Type2" value="전세">전세</option>
            </select>
            <br><br>
            <h5>방개수</h5>
            <select>
                <option name="cg_Room_Count" value="1">1층</option>
                <option name="cg_Room_Count" value="2">2층</option>
                <option name="cg_Room_Count" value="3">3층</option>
                <option name="cg_Room_Count" value="4">4층</option>
                <option name="cg_Room_Count" value="5">5층</option>
                <option name="cg_Room_Count" value="6">6층</option>
                <option name="cg_Room_Count" value="7">7층</option>
                <option name="cg_Room_Count" value="8">8층</option>
                <option name="cg_Room_Count" value="9">9층</option>
                <option name="cg_Room_Count" value="10">10층</option>
            </select>
            <br><br>
            <h5>평수</h5>
            <input type="text" name="cg_Width" placeholder="평수를 입력해주세요.">
            <br><br>
            <h5>추가옵션</h5>
            <input type="text" name="cg_Option" placeholder="추가옵션을 입력해주세요.">
            <br><br>
    </div>

    <div class="bds02"></div>
    <input type="submit" class="btn btn-secondary btn-lg" value="등록하기">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="btn btn-secondary btn-lg" value="다시입력">
</form>
    <div class="" style="background-color:white; height: 200px;">
       
    </div>
</div>
</body>
</html>