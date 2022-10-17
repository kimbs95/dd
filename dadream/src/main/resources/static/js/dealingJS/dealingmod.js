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
                
                
                //-------------------------------------------------//
                
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