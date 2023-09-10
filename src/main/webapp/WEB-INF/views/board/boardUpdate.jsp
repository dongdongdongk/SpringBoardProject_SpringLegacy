<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<c:import url="../common/common.jsp"></c:import>
	<c:import url="../common/nav.jsp"></c:import>
	<title>게시글 수정</title>
</head>
<body>
<div class="container-fluid my-5">
	<div class="row col-md-9 mx-auto">
		<h1>게시글 수정</h1>
		
		<form action="/board/boardUpdate" method="post">
		  <div class="form-group">
		    
		    <input type="hidden" class="form-control" id="num" name="num" value ="${detail.num}" placeholder="제목을 입력하세요">
		  </div>
		  <div class="form-group">
		    
		    <input type="hidden" class="form-control" id="writeDay" name="writeDay" value ="${detail.writeDay}" placeholder="제목을 입력하세요">
		  </div>
		  
		  <div class="form-group">
		    <label for="exampleFormControlInput1">제목</label>
		    <input type="text" class="form-control" id="title" name="title" value ="${detail.title}" placeholder="제목을 입력하세요">
		  </div>
		  <div class="form-group">
		    <label for="exampleFormControlInput1">작성자</label>
		    <input type="text" class="form-control" id="writer" name="writer" value = "${detail.writer}"  placeholder="작성자를 입력하세요">
		  </div>
		
		  <div class="form-group">
		    <label for="exampleFormControlTextarea1">내용</label>
		    <textarea class="form-control" id="contents" name="contents" rows="8" placeholder="내용을 입력하세요">${detail.contents}</textarea>
		  </div>
		  <button type="submit" class="btn btn-primary">수정</button>
		  <a class="btn btn-success" href="../board/boardList" role="button">목록</a>
		</form>
	</div>
</div>
<script src="../js/validation.js"></script>
</body>
</html>