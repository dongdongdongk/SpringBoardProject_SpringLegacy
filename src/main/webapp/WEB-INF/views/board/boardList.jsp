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
		<!-- paging -->
		<div class="row">
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
			  	<li class="page-item">
			      <a class="page-link" href="./boardList?page=1&kind=${pager.kind}&search=${pager.search}" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			  
			  
			    <li class="page-item ${pager.before?'disabled':''}">
			      <a class="page-link" href="./boardList?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" aria-label="Previous">
			        <span aria-hidden="true">&lsaquo;</span>
			      </a>
			    </li>
			    
			    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			    <li class="page-item"><a class="page-link" href="./boardList?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
			    </c:forEach>
			    
			    <li class="page-item ${pager.after eq false ? 'disabled':''}"><%-- ${pager.after eq false ? 'disabled':''} --%>
	
			      <a class="page-link" href="./boardList?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}"  aria-label="Next">
			      
			        <span aria-hidden="true">&rsaquo;</span>
			      </a>
			    </li>
			    
			    <li class="page-item"><%-- ${pager.after eq false ? 'disabled':''} --%>
	
			      <a class="page-link" href="./boardList?page=${pager.totalPage}&kind=${pager.kind}&search=${pager.search}"  aria-label="Next">
			      
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			    
			  </ul>
			</nav>
		</div>

		<!-- 검색창 -->
		<div class="row">
			<form class="row g-3" action="./boardList" method="get">
				<div class="col-auto">
				  <label for="kind" class="visually-hidden">Kind</label>
				  <select class="form-select" name="kind" id="kind" aria-label="Default select example">
					<option value="title">제목</option>
					<option value="contents">내용</option>
				  </select>
				</div>
				<div class="col-auto">
				  <label for="search" class="visually-hidden">Search</label>
				  <input type="text" class="form-control" name="search" id="search" placeholder="검색어를 입력하세요">
				</div>
				<div class="col-auto">
				  <button type="submit" class="btn btn-primary mb-3">검색</button>
				</div>
			</form>
		
		
		</div>
		
		
		</div>
	</div>
</div>
<script src="../js/pageing.js"></script>
</body>
</html>