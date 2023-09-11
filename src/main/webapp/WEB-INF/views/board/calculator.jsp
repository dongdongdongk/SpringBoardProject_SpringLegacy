<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>계산기</title>
<style>
table {
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid black;
}

th, td {
	padding: 10px;
	text-align: center;
	cursor: pointer; /* 커서 모양을 포인터로 변경 */
}

#result {
	font-size: 24px;
	text-align: right;
	padding: 10px;
	user-select: none; /* 텍스트 선택 비활성화 */
}

/* 선택된 버튼의 스타일 */
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