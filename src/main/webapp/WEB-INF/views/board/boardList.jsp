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
	<div class="row col-md-12 mx-auto">
		<h1>게시판</h1>
		<table class="table table-fixed wow fadeIn tableSize">
					  	<thead class="table-light">
					 		<tr>
								<th>번호</th><th>제목</th><th>작성자</th><th>날짜</th>
							</tr>
						</thead>
						
						<tbody>
							<c:forEach items="${boardList}" var="list">
								<tr>
									<td>${list.num}</td>
									<td><a href=./boardDetail?num=${list.num}>${list.title}</a></td>
									<td>${list.writer}</td>
									<td>${list.writeDay}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
		<a class="btn btn-success" href="../board/boardAdd" role="button">글쓰기</a>
	</div>
</div>
</body>
</html>