function fn_addnotice(isLogOn, addnotice, login) {
		if(isLogOn != '' && isLogOn != 'false') {
			location.href=addnotice;
			
		} else {
			alert("로그인 후 글쓰기가 가능합니다.")
			location.href=login + '?action=/login.do';
		}
	}
// 	function fn_search(){
// 		$("#listForm2").submit();
// 		return false;
// 	}
// 	$(document).ready( function () {
//     $('#table_id2').DataTable({
//         responsive : {deatail:{ type: 'column',
//                                 target : 1}},
//         ordering: false,
//         language: {
//             url: '/js/user/dataTables.ko.json'
//         },
//         lengthChange: true,
// 		info : false,
// 		searching:true,
// 		displayLength:10,
		
		
		
//     });
// 	// let table = $('#table_id').DataTable();
// 	// if(! table.data().count()){
// 	// 	alert('글이 없습니다. 새로운 글을 작성해주세요.');
// 	// }else{
// 	// 	return false;
// 	// }
// } );