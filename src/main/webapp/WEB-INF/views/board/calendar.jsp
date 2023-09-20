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
				<div class="day">SUN</div>
				<div class="day">MON</div>
				<div class="day">TUE</div>
				<div class="day">WED</div>
				<div class="day">THU</div>
				<div class="day">FRI</div>
				<div class="day">SAT</div>
			</div>
			<div class="dates"></div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">스케줄 입력</h5>
					<div class="fullDate"></div>
				<form action="/board/setCalendar" method="post" id="setCalendar">
					<div class="cs-form">
						<h5>년</h5>
						<input type="text" class="form-control inputYear" name="calYear" />
					</div>
					<div class="cs-form">
						<h5>월</h5>
						<input type="text" class="form-control inputMonth" name="calMonth" />
					</div>
					<div class="cs-form">
						<h5>일</h5>
						<input type="text" class="form-control inputDay" name="calDay"/>
					</div>

					<div class="cs-form">
						<h5>시간</h5>
						<input type="time" class="form-control" name="calTime"/>
					</div>
					<div class="form-group">
						<h5>내용</h5>
						<textarea class="form-control" id="exampleFormControlTextarea1" name="calContents"
							rows="1"></textarea>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" name="calReq" id="flexCheckDefault" value='1'> 
						<input type="hidden" name="calReq" id="flexCheckDefault_hidden" value='0'/>
						<label class="form-check-input" for="flexCheckDefault"> 중요 스케줄(체크시 * 표시됩니다.) </label>
					</div>
				</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-primary" form="setCalendar">저장</button>
				</div>
			</div>
		</div>
	</div>
	<script src="../js/calendar.js"></script>
</body>
</html>