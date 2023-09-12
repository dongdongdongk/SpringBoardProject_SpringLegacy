<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../common/common.jsp"></c:import>
<c:import url="../common/nav.jsp"></c:import>
<head>
<title>계산기</title>
<style>
table {
	border-collapse: collapse;
    width: 100%;
}

table, th, td {
	border: 1px solid black;
}

th, td {
	padding: 10px;
	text-align: center;
	cursor: pointer;
    min-height: 100px;
}

#result {
    width: 100%;
    height: 40px;
    margin-bottom: 10px;
    font-size: 20px;
    text-align: right;
}


.selected {
	background-color: gray;
	color: white;
}
</style>
</head>
<body>
	<h1>계산기</h1>
	<table>
		<tr>
			<td colspan="4" id="result">0</td>
		</tr>
		<tr>
			<td onclick="addToResult('7')">7</td>
			<td onclick="addToResult('8')">8</td>
			<td onclick="addToResult('9')">9</td>
			<td onclick="addToResult('*')">x</td>
		</tr>
		<tr>
			<td onclick="addToResult('4')">4</td>
			<td onclick="addToResult('5')">5</td>
			<td onclick="addToResult('6')">6</td>
			<td onclick="addToResult('-')">-</td>
		</tr>
		<tr>
			<td onclick="addToResult('1')">1</td>
			<td onclick="addToResult('2')">2</td>
			<td onclick="addToResult('3')">3</td>
			<td onclick="addToResult('+')">+</td>
		</tr>
		<tr>
			<td onclick="clearLastCharacter()">Del</td>
			<td onclick="addToResult('0')">0</td>
			<td onclick="addToResult('.')">.</td>
			<td onclick="calculateResult();">=</td>
		</tr>
	</table>
    <script src="../js/calculator.js"></script>
</body>
</html>