					//--------------- 지도생성 -----------------//
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
                        //(function(){
                        kakao.maps.event.addListener(map, 'click', function (mouseEvent) {
                            document.querySelector("#sample5_address").value = "";
                            searchDetailAddrFromCoords(mouseEvent.latLng, function (result, status) {
                                if (status === kakao.maps.services.Status.OK) {
                                    // 클릭한 위도, 경도 정보를 가져옵니다 
                                    var latlng = mouseEvent.latLng;

                                    // 마커 위치를 클릭한 위치로 옮깁니다
                                    marker.setPosition(latlng);

                                    var dl_Lat = latlng.getLat();
                                    var dl_Lng = latlng.getLng();
                                    //console.log(dl_Lat);
                                    //console.log(dl_Lng);

                                    console.log(result[0]);
                                    /* if문 안먹음 */
                                    if (!result[0].road_address) {
                                        alert("정확한 위치를 찍어주세요 ");
                                        return;
                                    }

                                    

                                    var jibun_address = result[0].address.address_name; // 지번 주소
                                    var road_address = result[0].road_address.address_name; //도로명 주소

                                    //마커찍으면 주소 변환
                                    document.querySelector("#sample5_address").value = road_address;
                                    

                                    console.log(road_address);
                                    console.log(jibun_address);
                                    // var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
                                    // message += '경도는 ' + latlng.getLng() + ' 입니다';

                                    // var resultDiv = document.getElementById('clickLatlng');
                                    // resultDiv.innerHTML = message;

                                    //인풋에 value 값 넣기
                                    document.querySelector("#dl_Lat").setAttribute('value', dl_Lat);
                                    document.querySelector("#dl_Lng").setAttribute('value', dl_Lng);
                                }
                            });
                        });
                        //})();
                        function searchDetailAddrFromCoords(coords, callback) {
                            // 좌표로 법정동 상세 주소 정보를 요청합니다
                            geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
                        }


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
                        
                        
                        
                        //------------------썸네일 코드---------------
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
        });
        
        
        
        //-------------------경고창---------------//
        document.querySelector("#submitbtn").addEventListener("click", () => {
            event.preventDefault();
            check();
            
        });
        let check = ()=>{

        
        let dealing_Image = document.querySelector("#dealing_Image").value.trim();
        let dl_Title = document.querySelector("#dl_Title").value.trim();
        let sample5_address = document.querySelector("#sample5_address").value.trim();
        let dl_Price = document.querySelector("#dl_Price").value.trim();
        let dl_Option = document.querySelector("#dl_Option").value.trim();
        let dl_Form = document.querySelector("#dl_Form").value.trim();
        let dl_Form2 = document.querySelector("#dl_Form2").value.trim();
        let dl_Room = document.querySelector("#dl_Room").value.trim();
        let dl_Size = document.querySelector("#dl_Size").value.trim();
        let summernote = document.querySelector("#summernote").value.trim();
        let FORMTAG =document.querySelector("#FORMTAG");
        if (dealing_Image === '') {
            alert("이미지를 넣어주세요");
            dealing_Image.focus();
            return ;
        } else if (dl_Title === '') {
            alert("매물명 을 입력해주세요");
            dl_Title.focus();
            return ;
        } else if (sample5_address === '') {
            alert("주소를 입력해주세요");
            sample5_address.focus();
            return ;
        } else if (dl_Price === '') {
            alert("가격을 입력해주세요");
            dl_Price.focus();
            return ;
        } else if (dl_Option === '') {
            alert("옵션을 입력해주세요");
            dl_Price.focus();
            return ;
        } else if (dl_Form === '') {
            alert("건물을 입력해주세요");
            dl_From.focus();
            return ;
        } else if (dl_Form2 === '') {
            alert("구매방식 입력해주세요");
            dl_From2.focus();
            return ;
        } else if (dl_Room === '') {
            alert("방 개수 를 입력해주세요");
            dl_Room.focus();
            return ;
        } else if (dl_Size === '') {
            alert("평수 를 입력해주세요");
            dl_Size.focus();
            return ;
        } else if (summernote === '') {
            alert("상세설명 을 입력해주세요");
            summernote.focus();
            return ;
        }FORMTAG.submit();
            
    }
        
        