<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../common/common.jsp"></c:import>
<c:import url="../common/nav.jsp"></c:import>
<link rel="stylesheet" href="/css/calendar.css">
<head>
<title>검색</title>
</head>
<body>
    <h1>검색</h1>

    <div class="cs-form">
        <input type="text" class="form-control" name="searchInput" id="searchInput" />
        <button class="button" onclick="test()">입력</button>
    </div>
    <script src="../js/searchBoard.js"></script>
</body>
</html>