<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<c:import url="../common/common.jsp"></c:import>
	<c:import url="../common/nav.jsp"></c:import>
	<title>게시판</title>
</head>
<body>
<div class="container-fluid my-5">
	<div id="ajaxBoardResult">
		<div class="row col-md-9 mx-auto">
			<h1>HOME</h1>
			<a href="http://www.wooriict.com" target="_blank"><img alt="em" src="../img/wooriict.png"></a>
			<button onclick="location.href='/board/userLogin'">로그인</button>
		</div>
	</div>
</div>


</body>
</html>