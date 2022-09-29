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
    <title>부동산 매물등록</title>
    <!--부트스트랩-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- 파일업로드 드래그앤드롭 -->
    <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />

    <!-- css -->
    <link rel="stylesheet" href="/css/dealingform.css">

</head>

<body>
    <!--부트스트랩-->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <div class="first">
        <h1 style="margin:40px 0 0 10px; font: bold;">매물등록</h1>

        <form method="post" action="${contextPath}/addNewdealing.do" enctype="multipart/form-data" name="dl_Image">
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
                                thumbnailHeight: 500, // Upload icon size
                                thumbnailWidth: 500, // Upload icon size
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
                    <h3>매물이름</h3>
                    <input type="text" name="dl_Title" placeholder="건물명을 입력해주세요." size="50">
                    <br><br>
                    <h3>도시명</h3>
                    <input type="text" name="dl_City" placeholder="ex) 서울, 부산, 대전" size="50">
                    <br><br>
                    <h3>주소입력</h3>
                    <input type="text" id="sample5_address" name="dl_Address" placeholder="주소" size="38">
                    <input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br><br>
                    <div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div><br>
                    <!-- 우편api -->
                    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                    <!-- 지도api -->
                    <script
                        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d1a9a1b185a416c4c43f9c88915f8650&libraries=services">
                    </script>
                    <!-- 지도생성 -->
                    <script>
                        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                            mapOption = {
                                center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
                                level: 5 // 지도의 확대 레벨
                            };

                        //지도를 미리 생성
                        var map = new daum.maps.Map(mapContainer, mapOption);
                        //주소-좌표 변환 객체를 생성
                        var geocoder = new daum.maps.services.Geocoder();
                        // //마커를 미리 생성
                        // var marker = new daum.maps.Marker({
                        //     position: new daum.maps.LatLng(37.537187, 127.005476),
                        //     map: map
                        // });
                        // 지도를 클릭한 위치에 표출할 마커입니다
                        var marker = new kakao.maps.Marker({
                            // 지도 중심좌표에 마커를 생성합니다 
                            position: map.getCenter()
                        });
                        // 지도에 마커를 표시합니다
                        marker.setMap(map);

                        // 지도에 클릭 이벤트를 등록합니다
                        // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
                        kakao.maps.event.addListener(map, 'click', function (mouseEvent) {

                            // 클릭한 위도, 경도 정보를 가져옵니다 
                            var latlng = mouseEvent.latLng;

                            // 마커 위치를 클릭한 위치로 옮깁니다
                            marker.setPosition(latlng);

                            var dl_Lat = latlng.getLat();
                            var dl_Lng = latlng.getLng();
                            console.log(dl_Lat);
                            console.log(dl_Lng);
                            // var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
                            // message += '경도는 ' + latlng.getLng() + ' 입니다';

                            // var resultDiv = document.getElementById('clickLatlng');
                            // resultDiv.innerHTML = message;

                            //인풋에 value 값 넣기
                            document.querySelector("#dl_Lat").setAttribute('value', dl_Lat);
                            document.querySelector("#dl_Lng").setAttribute('value', dl_Lng);
                            

                        });

                        function sample5_execDaumPostcode() {
                            new daum.Postcode({
                                oncomplete: function (data) {
                                    var addr = data.address; // 최종 주소 변수

                                    // 주소 정보를 해당 필드에 넣는다.
                                    document.getElementById("sample5_address").value = addr;
                                    // 주소로 상세 정보를 검색
                                    geocoder.addressSearch(data.address, function (results, status) {
                                        // 정상적으로 검색이 완료됐으면
                                        if (status === daum.maps.services.Status.OK) {

                                            var result = results[0]; //첫번째 결과의 값을 활용

                                            // 해당 주소에 대한 좌표를 받아서
                                            var coords = new daum.maps.LatLng(result.y, result.x);
                                            // 지도를 보여준다.
                                            mapContainer.style.display = "block";
                                            map.relayout();
                                            // 지도 중심을 변경한다.
                                            map.setCenter(coords);
                                            // 마커를 결과값으로 받은 위치로 옮긴다.
                                            marker.setPosition(coords)
                                        }
                                    });
                                }
                            }).open();
                        }
                    </script>
                    <input type="hidden" name="dl_Lat" id ="dl_Lat"  />
                    <input type="hidden" name="dl_Lng" id ="dl_Lng"  />
                    <h3>가격</h3>
                    <input type="text" name="dl_Price" placeholder="희망하시는 가격을 입력해주세요." size="50">
                    <br><br>
                    <h3>옵션정보</h3>
                    <input type="text" name="dl_Option" placeholder="매물의 추가정보를 입력해주세요." size="50">

                    <!--카테고리-->
                    <div class="cg">
                        <h3>카테고리 선택</h3>
                        <br><br>
                        <h5>건물형태</h5>
                        <select name="dl_Form">
                            <option name="dl_Form" value="아파트">아파트</option>
                            <option name="dl_Form" value="투룸+">투룸+</option>
                            <option name="dl_Form" value="원룸">원룸</option>
                            <option name="dl_Form" value="오피스텔">오피스텔</option>
                            <option name="dl_Form" value="주택">주택</option>
                        </select>
                        <br><br>
                        <h5>매물종류</h5>
                        <select name="dl_Form2">
                            <option name="dl_Form2" value="매매">매매</option>
                            <option name="dl_Form2" value="월세">월세</option>
                            <option name="dl_Form2" value="전세">전세</option>
                        </select>
                        <br><br>
                        <h5>방개수</h5>
                        <select name="dl_Room">
                            <option name="dl_Room" value="1">1층</option>
                            <option name="dl_Room" value="2">2층</option>
                            <option name="dl_Room" value="3">3층</option>
                            <option name="dl_Room" value="4">4층</option>
                            <option name="dl_Room" value="5">5층</option>
                            <option name="dl_Room" value="6">6층</option>
                            <option name="dl_Room" value="7">7층</option>
                            <option name="dl_Room" value="8">8층</option>
                            <option name="dl_Room" value="9">9층</option>
                            <option name="dl_Room" value="10">10층</option>
                        </select>
                        <br><br>
                        <h5>평수</h5>
                        <input type="text" name="dl_Size" placeholder="평수를 입력해주세요.">
                        <br><br>

                    </div>

                </div>

            </div>

            <div class="dealingformcontent">
                <h3>상세설명</h3>

                <textarea name="dl_Content" id="dl_Content" cols="120" rows="10"
                    placeholder="매물에 대한 상세설명을 입력해주세요."></textarea>

                <div class="bds02">
                    <input type="submit" class="btn btn-secondary btn-lg" value="등록하기">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="reset" class="btn btn-secondary btn-lg" value="다시입력">
                </div>
            </div>
        </form>
    </div>
</body>
</html>