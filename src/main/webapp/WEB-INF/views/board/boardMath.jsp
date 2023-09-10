<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../common/common.jsp"></c:import>
<c:import url="../common/nav.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<h3>Test2-구구단</h3>
			<div class="col-8">
				<form class="d-flex">
					<select id="num" class="form-select">
						<option selected value="0">선택</option>
						<option value="1">1단</option>
						<option value="2">2단</option>
						<option value="3">3단</option>
						<option value="4">4단</option>
						<option value="5">5단</option>
						<option value="6">6단</option>
						<option value="7">7단</option>
						<option value="8">8단</option>
						<option value="9">9단</option>
					</select> <input type="button" value="계산" class="btn btn-primary"
						onclick="Math99()">
				</form>
			</div>
			<div id="result"></div>
		</div>
	</div>


	<div class="container mt-8">
		<div class="row">
			<h3>Test4-색상변경</h3>
			<div class="col-8">
				<div id="num1" class ="selectText">첫번째</div>
				<div id="num2" class ="selectText">두번째</div>
				<div id="num3" class ="selectText">세번째</div>
				<div id="num4" class ="selectText">네번째</div>
				<form class="d-flex">
					<select id="selectNum" class="form-select">
						<option selected>선택</option>
						<option value="num0">전체</option>
						<option value="num1">첫번째</option>
						<option value="num2">두번째</option>
						<option value="num3">세번쨰</option>
						<option value="num4">네번째</option>
					</select> <select id="color" class="form-select">
						<option selected>선택</option>
						<option value="red">빨강</option>
						<option value="blue">파랑</option>
						<option value="yellow">노랑</option>
						<option value="green">초록</option>
					</select> <input type="button" value="변경" class="btn btn-primary"
						onclick="changeColor()">
				</form>
			</div>
		</div>
	</div>

	<h3>Test6</h3>
	<label for="numberInput">숫자 입력: </label>
	<input type="text" id="numberInput">
	<button onclick="generateTable()">선택</button>
	<div id="tableContainer"></div>
	<script src="../js/math.js"></script>
</body>
</html>