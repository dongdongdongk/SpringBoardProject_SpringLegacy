<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul class="nav nav-tabs">
	<li role="presentation" class="home"><a href="home">Home</a></li>
	<li role="presentation" class="dropdown board">
	<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false"> 게시판<span class="caret"></span></a>
		<ul class="dropdown-menu" role="menu">
			<li><a href="boardList">게시판 목록</a></li>
			<li><a href="boardAjax">게시판 목록 Ajax</a></li>
		</ul></li>
	<li role="presentation" class="boardMath"><a href="boardMath">구구단</a></li>
	<li role="presentation" class="calculator"><a href="calculator">계산기</a></li>
	<li role="presentation" class="calendar"><a href="calendar">캘린더</a></li>
	<li role="presentation" class="html"><a href="searchBoard">Html</a></li>


</ul>
<script>
$(document).ready(function() {
	console.log("[네비게이션바] 적용 jsp");
	var loc = location.pathname.split("/")[2];
	console.log("loc => "+loc);
	// 해당 페이지에 맞는 네비게이션바 강조 옵션 적용
	if(loc.indexOf("board") > -1){
		$(".board").addClass("active");
	}else if(loc.indexOf("home") > -1){
		$(".home").addClass("active");
	}
});
</script>