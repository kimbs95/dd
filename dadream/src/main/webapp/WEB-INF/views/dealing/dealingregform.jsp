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

    <script src="http://code.jquery.com/jquery-latest.js"></script>

    <!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- 파일업로드 드래그앤드롭 -->
    <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />

    <!-- css -->
    <link rel="stylesheet" href="/css/dealingform.css">

    <!-- 섬머노트 -->
    <script src="/js/summernote/summernote-lite.js"></script>
    <script src="/js/summernote/lang/summernote-ko-KR.js"></script>
    <link rel="stylesheet" href="/css/summernote/summernote-lite.css">

    <style>
        .dropdown-toggle::after {
            display: none;
        }
    </style>

</head>

<body>
    <!--부트스트랩-->
    <!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <div class="first">
        <h1 style="margin:40px 0 0 10px; font: bold;">매물등록</h1>

        <form method="post" action="${contextPath}/addNewdealing.do" enctype="multipart/form-data">
            <div class="middle">

                <!--이미지 div-->
                <div class="dlImg">
                    <div class="dlMain">
                        <label for="dealing_Image">이미지 를 골라주세요</label><br>
                        <input type="file" id="dealing_Image" name="dl_Image" accept="image/*" multiple>
                        <img id="preview" src="" width=200 height=200 />
                        <h1 class="imgh1"></h1>
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
                    <input type="hidden" name="dl_Lat" id="dl_Lat" />
                    <input type="hidden" name="dl_Lng" id="dl_Lng" />
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

                <textarea id="summernote" name="dl_Content"></textarea>

                <div class="bds02">
                    <input type="submit" id="submit" class="btn btn-secondary btn-lg" value="등록하기">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="reset" class="btn btn-secondary btn-lg" value="다시입력">
                </div>
            </div>
        </form>
    </div>
    <script>
        // 썸네일 코드 
        document.addEventListener('DOMContentLoaded', () => {
            document.querySelector("#dealing_Image").addEventListener("change", async e => {
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


    <script>
       
         (function(){

             
             $("#summernote").summernote({
                    height: 300, // 에디터 높이
                    minHeight: 300, // 최소 높이
                    maxHeight: null, // 최대 높이(null 제한없음)
                    focus: false, // 에디터 로딩후 포커스를 맞출지 여부
                    lang: "ko-KR", // 한글 설정
                    toolbar: [
                        ['fontname', ['fontname']], // 글꼴 설정
                        ['fontsize', ['fontsize']], // 글자 크기 설정
                        ['style', ['bold', 'italic', 'underline', 'strikethrough',
                        'clear'
                    ]], // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
                    ['color', ['forecolor', 'color']], // 글자색
                    ['table', ['table']], // 표만들기
                    ['para', ['ul', 'ol', 'paragraph']], // 글머리 기호, 번호매기기, 문단정렬
                    ['height', ['height']], // 줄간격
                    ['insert', ['picture', 'link', 'video']], // 그림첨부, 링크만들기, 동영상첨부
                    ['view', ['fullscreen', 'codeview', 'help']] // 코드보기, 확대해서보기, 도움말
                    ],
                    // 추가한 글꼴
                    fontNames: ['Arial', 'Arial Black', '맑은 고딕', '궁서',
                    '굴림체', '굴림', '돋음체', '바탕체'
                ],
                    // 추가한 폰트사이즈
                    fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24',
                    '28', '30',
                    '36', '50', '72'
                ]
                });
                
                
            })();
          
  
    </script>
</body>

</html>