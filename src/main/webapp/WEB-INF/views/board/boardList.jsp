<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>날짜</th>
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
					
					<!--서치 부분-->
					<form class="row g-3 " action="./boardList" method="get" id="searchForm">
						<div class="col-auto ml-auto">
							<div class="input-group mb-4">
								<input type="hidden" name="page" value="1" id="page">
								<div class="col-auto">
									<label for="kind" class="visually-hidden">Kind</label>
									<select class="form-select wow fadeInUp" name="kind" id="kind"
										aria-label="Default select example">
										<option value="title" ${pager.kind eq 'title' ? 'selected' :''}>Title</option>
										<option value="contents" ${pager.kind eq 'contents' ?'selected':''}>Contents
										</option>
										<option value="writer" ${pager.kind eq 'writer' ? 'selected' :''}>Writer
										</option>
									</select>
								</div>
								<input type="text" class="form-control mb-4"
									value="${pager.search}" name="search" id="search" placeholder="검색어를 입력하세요">
								<button type="submit" 
									class="align-items-start">
								</button>
							</div>
						</div>
					</form>

					<!-- 페이징 -->
					<div class="row">
						<nav aria-label="Page navigation example">
							<ul class="pagination ">
								<li class="page-item "><a class="page-link text-dark" href="#"
										aria-label="Previous" data-board-page="1"> <span
											aria-hidden="true">&laquo;</span>
									</a></li>
								<li class="page-item ${pager.before?'disabled':''}"><a
										class="page-link text-dark" href="#" aria-label="Previous"
										data-board-page="${pager.startNum-1}"> <span aria-hidden="true">&lsaquo;</span>
									</a></li>

								<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
									<li class="page-item"><a class="page-link text-dark" href="#"
											data-board-page="${i}">${i}</a></li>
								</c:forEach>

								<li class="page-item ${pager.after eq false ? 'disabled' : ''}">
									<%--${pager.after eq false ? 'disabled' : '' } --%> <a
											class="page-link text-dark" href="#" aria-label="Next"
											data-board-page="${pager.lastNum+1}"> <span
												aria-hidden="true">&rsaquo;</span>
										</a>
								</li>
								<li class="page-item ">
									<%--${pager.after eq false ? 'disabled' : '' } --%> <a
											class="page-link text-dark" href="#" aria-label="Next"
											data-board-page="${pager.totalPage}"> <span
												aria-hidden="true">&raquo;</span>
										</a>
								</li>
							</ul>
						</nav>
					</div>


				</div>
			</div>
			<script src="../js/pageing.js"></script>
		</body>

		</html>