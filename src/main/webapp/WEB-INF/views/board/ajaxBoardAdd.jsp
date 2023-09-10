<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<c:import url="../common/common.jsp"></c:import>
	<title>Ajax게시글 작성</title>
</head>
<body>
<div class="container-fluid my-5">
	<div class="row col-md-9 mx-auto">
		<form id="addBoard" method="post">
		  <div class="form-group">
		    <label for="exampleFormControlInput1">제목</label>
		    <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요">
		  </div>
		  <div class="form-group">
		    <label for="exampleFormControlInput1">작성자</label>
		    <input type="text" class="form-control" id="writer" name="writer" placeholder="작성자를 입력하세요">
		  </div>
		
		  <div class="form-group">
		    <label for="exampleFormControlTextarea1">내용</label>
		    <textarea class="form-control" id="contents" name="contents"  rows="8" placeholder="내용을 입력하세요"></textarea>
		  </div>
		</form>
		  <button type="submit" id="add" class="btn btn-primary">작성</button>
	</div>
</div>
<script>
//유효성 검사 위에 있는데 왜?..
function validateForm() {
    if (document.getElementById('title').value == '') {
        alert('제목을 입력해 주세요');
        return false;
    }
    if (document.getElementById('writer').value == '') {
        alert('작성자를 입력해 주세요');
        return false;
    }
    if (document.getElementById('contents').value == '') {
        alert('내용을 입력해 주세요');
        return false;
    }
    
    return true;
}

document.querySelector('form').addEventListener('submit', function(e){
    if (!validateForm()) {
        e.preventDefault();
    }
});

$('#add').on('click', function(){
    if (!validateForm()) {
        return;
    }  
    $.ajax({
        url: "/board/boardAjaxAdd",
        type: "POST",
        data: $('#addBoard').serialize(),
        success: function(data){
            $("#ajaxBoardAddResult").empty();
            v = 0;
            ajaxBoardList();
        },
        error: function(){ 
            alert("등록 error");  
        }
    });
});
</script>

</body>
</html>