// 뒤로가기
	/*$(document).ready(function(){
		var msg = "${msg}";
		if(msg != ""){
			alert(msg);
		}
	});
	
	function backToList(obj) {
		obj.action="${contextPath}/inteboardlist.do";
		obj.submit();
	}
*/
	
	function fn_remove_article(url,inte_Num){
	var form = document.createElement("form");
	form.setAttribute("method", "post");
	form.setAttribute("action", url);
 	var inte_NumInput = document.createElement("input");
 	inte_NumInput.setAttribute("type","hidden");
 	inte_NumInput.setAttribute("name","inte_Num");
 	inte_NumInput.setAttribute("value",inte_Num);
 	form.appendChild(inte_NumInput);
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