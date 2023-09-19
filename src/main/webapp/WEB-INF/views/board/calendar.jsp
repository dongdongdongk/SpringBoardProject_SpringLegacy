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
<title>캘린더</title>
</head>
<body>
	<div class="sec_cal">
		<div class="cal_nav">
			<div class="year"></div>
		</div>
	</div>
	<div class="sec_cal">
		<div class="cal_nav">
			<a href="javascript:;" class="nav-btn go-prev">prev</a>
			<!-- javascript:;로 설정되어 있으므로 실제로는 아무 작업도 수행하지 않는 JavaScript 문장  현재 페이지를 새로고침하지 않고 JavaScript를 실행할 수 있음 -->
			<div class="month"></div>
			<a href="javascript:;" class="nav-btn go-next">next</a>
		</div>
		<div class="cal_wrap">
			<div class="days">
				<div class="day">MON</div>
				<div class="day">TUE</div>
				<div class="day">WED</div>
				<div class="day">THU</div>
				<div class="day">FRI</div>
				<div class="day">SAT</div>
				<div class="day">SUN</div>
			</div>
			<div class="dates"></div>
		</div>
	</div>
	<script src="../js/calendar.js"></script>
</body>
</html>