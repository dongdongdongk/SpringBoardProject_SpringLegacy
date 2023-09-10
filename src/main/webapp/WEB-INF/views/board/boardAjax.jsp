<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../common/common.jsp"></c:import>
<c:import url="../common/nav.jsp"></c:import>
</head>
<body>
	<div class="container-fluid my-5">
		<div class="row col-md-12 mx-auto">
			<h1>게시판</h1>
			<div id="ajaxBoardResult2">
				<table class="table table-fixed wow fadeIn tableSize" id="ajaxBoardResult">
					<thead class="table-light">
						<tr>
							<th><input type='checkbox' class='checkAll' id = "checkAll" onclick ="checkAll()">전체체크</th>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>날짜</th>
							<th>삭제</th>
						</tr>
					</thead>

					<tbody>
						
					</tbody>
				</table>
			</div>
			<a class="btn btn-success" id="ajaxBoardAdd">글쓰기</a>
		</div>
	</div>
	<div id="ajaxBoardAddResult"></div>
	<div id="ajaxBoardDetailResult"></div>
	<script src="../js/boardAjax.js"></script>


</body>
</html>