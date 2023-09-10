
//날짜 포맷 변경
function formatDate(inputDate) {
	console.log("날짜포맷 변경")
	let today = new Date(inputDate);
	
	let year = today.getFullYear();
	let month = ('0' + (today.getMonth() + 1)).slice(-2);
	let day = ('0' + today.getDate()).slice(-2);
	let todayFormat = year + '-' + month  + '-' + day;
	let hours = ('0' + today.getHours()).slice(-2); 
	let minutes = ('0' + today.getMinutes()).slice(-2);
	let seconds = ('0' + today.getSeconds()).slice(-2); 
	
	let timeFormatResult = year + '-' + month  + '-' + day + hours + ':' + minutes  + ':' + seconds;
	return timeFormatResult;
}
//Ajax 리스트 출력
$(document).ready(function() {
	ajaxBoardList();
});
function ajaxBoardList() {
	$.ajax({
		url: "/board/boardAjaxList",       
		type: "GET",                          
		dataType: "JSON",                    
		contentType: "application/json",      
		success: function(data) {  
			console.log("Ajax리스트 출력")
			let h = "";
			let g = "<tr><td><button id='removeSelect' class='btn btn-danger' onclick='removeSelect()'>선택삭제</button><td><tr>";
			for (let i = 0; i < data.length; i++) {
				h += "<tr>";
				h += "<td><input type='checkbox' class='checkBoxNum' value=" + data[i].num + "></td>";
				h += "<td>" + data[i].num + "</td>";
				h += "<td><a href='javascript:getBoardDetail(" + data[i].num + ");'>" + data[i].title + "</a></td>";
				h += "<td>" + data[i].writer + "</td>";
				h += "<td>" + formatDate(data[i].writeDay) + "</td>";
				console.log(data[i].writeDay);
				h += "<td><button id='remove' class='btn btn-danger' onclick='removeItem(" + data[i].num + ")'>삭제</button></td>";
				h += "</tr>";
			}
			$("#ajaxBoardResult tbody").html( g + h);
		},
		error: function(jqXHR, textStatus, errorThrown) {}
	});
}







//Ajax 게시글 쓰기 출력
let v = 0;
function ajaxBoardAdd() {
	$.ajax({
		url :"/board/AjaxBoardAdd",
		type : "GET",
		success : function(result){
			console.log("AjaxAdd")
			if (v === 1) {
				// 내용삭제
				$("#ajaxBoardAddResult").empty();
				v = 0;
			} else {
				$("#ajaxBoardAddResult").html(result);
				v = 1;
			}
			ajaxBoardList();
		}
	})
}

$('#ajaxBoardAdd').on("click",function(){
	ajaxBoardAdd();
});



//Ajax 게시글 삭제
function removeItem(num) {
	   
	if (confirm("정말 삭제하시겠습니까??") == true){ 
		$.ajax({
		     	url : "/board/boardDelete",
		        type : "GET",
		        data : {num: num},
		        success : function(response){
		        	$("#row-" + num).remove();
		        	ajaxBoardList();
		        },
		        error : function(error) {
		        	console.log("AjaxRemove 실패")	
				}
		
		    })

	}else {   
		return false;
	}	
}


//AjaxBoard 디테일 출력하기 
function getBoardDetail(num) {
    console.log("Clicked on title with num: " + num);
    $.ajax({
        url: "/board/AjaxBoardDetail",
        type: "GET",
        data: { num: num },
        success: function (result) {
            console.log("AjaxDetail");
            $("#ajaxBoardDetailResult").html(result);
        }
    });
}

//전체 체크하기
function checkAll() {
	console.log("전체 선택")
	const checkBoxes = document.querySelectorAll(".checkBoxNum");
	const checkAllCheckbox = document.getElementById("checkAll");
	for(let i = 0; i < checkBoxes.length; i++) {
		checkBoxes[i].checked = checkAllCheckbox.checked;
	}
	
}

//선택 삭제 
function removeSelect() {
	console.log("선택삭제");
	const checkedNum = document.querySelectorAll(".checkBoxNum");
	let checkedNumList = "";
	
	for (let i = 0; i < checkedNum.length; i++) {
        if (checkedNum[i].checked) {
            console.log("선택된 항목의 value: " + checkedNum[i].value);
            $.ajax({
		     	url : "/board/boardDelete",
		        type : "GET",
		        data : {num: checkedNum[i].value},
		        success : function(response){
		        	ajaxBoardList();
		        },
		        error : function(error) {
		        	console.log("AjaxRemove 실패")	
				}	
		    });
            if(checkedNumList == 0){
            	checkedNumList += checkedNum[i].value;
            }else{
            	checkedNumList += "," + checkedNum[i].value;
            }
        }else{
        	console.log("");
        }
    }
	if(checkedNumList == "") {
		alert("삭제할 대상을 체크하여 주십시요");
	}else{
		alert(checkedNumList);	
	}
	ajaxBoardList();
}





