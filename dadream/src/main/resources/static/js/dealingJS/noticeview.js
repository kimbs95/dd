// 뒤로가기
	/*$(document).ready(function(){
		var msg = "${msg}";
		if(msg != ""){
			alert(msg);
		}
	});
	function backToList(obj) {
		obj.action="${contextPath}/noticelist.do";
		obj.submit();
	}*/
	
	function fn_remove_article(url,notice_Num){
	var form = document.createElement("form");
	form.setAttribute("method", "post");
	form.setAttribute("action", url);
 	var inte_NumInput = document.createElement("input");
 	inte_NumInput.setAttribute("type","hidden");
 	inte_NumInput.setAttribute("name","notice_Num");
 	inte_NumInput.setAttribute("value",notice_Num);
 	form.appendChild(notice_NumInput);
 	document.body.appendChild(form);
 	form.submit();
	alert("삭제하시겠습니까?");
}
	
	function readURL(input) {
		if(input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}