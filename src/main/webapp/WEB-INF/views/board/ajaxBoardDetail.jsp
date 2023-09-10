<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<c:import url="../common/common.jsp"></c:import>
	<title>게시글Ajax 상세</title>
</head>

<div class="container-fluid my-5">
	<div class="row col-md-9 mx-auto">
		<body>
			<p>번호 ${detail.num}</p>
			<p></p>
			<p>제목 ${detail.title}</p>
			<p></p>
			<p>작성자 ${detail.writer}</p>
			<p></p>
			<p>내용 ${detail.contents}</p>
		</body>
		<button class="btn btn-info" id="DetailClose">닫기</button>
	</div>
</div>
<script>
	$('#DetailClose').on("click",function(){
		$("#ajaxBoardDetailResult").empty();
	});
</script>