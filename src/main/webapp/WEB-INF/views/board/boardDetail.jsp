<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<c:import url="../common/common.jsp"></c:import>
	<c:import url="../common/nav.jsp"></c:import>
	<title>게시글 상세</title>
</head>

<div class="container-fluid my-5">
	<div class="row col-md-9 mx-auto">
		<body>
			<h1>게시글 상세</h1>
			<p>번호 ${detail.num}</p>
			<p></p>
			<p>제목 ${detail.title}</p>
			<p></p>
			<p>작성자 ${detail.writer}</p>
			<p></p>
			<p>내용 ${detail.contents}</p>
		</body>
		<a class="btn btn-info" href=../board/boardUpdate?num=${detail.num} role="button">수정</a>
		<a class="btn btn-danger" href=../board/boardDelete?num=${detail.num} role="button">삭제</a>
		<a class="btn btn-success" href="../board/boardList" role="button">목록</a>
	</div>
</div>
</html>