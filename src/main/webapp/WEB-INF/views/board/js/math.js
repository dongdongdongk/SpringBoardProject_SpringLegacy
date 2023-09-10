// 구구단
function Math99() {
	let num = document.getElementById("num").value;
	let result = "";
	if (num == 0) {
		alert("숫자를 선택해주세요");
		return;
	}
	for (i = 1; i < 10; i++) {
		result += num + " x " + i + " = " + (num * i) + "<br>"
	}

	document.getElementById("result").innerHTML = result;

};

// 색상변경
function changeColor() {
	//색상 초기화
	let selectTextAll = document.querySelectorAll(".selectText");
	selectTextAll.forEach(function(element) {
		element.style.color = "black";
	});
	
	let selectNum = document.getElementById("selectNum").value;
	console.log(selectNum)
	let color = document.getElementById("color").value;
	console.log(color)
	
	if (color === "선택") {
		alert("변경할 색상을 선택해주세요");
	
	} else if (selectNum === "선택") {
		alert("변경할 번호를 선택해주세요");
	//전체 색상 변경
	} else if(selectNum === "num0") {
		selectTextAll.forEach(function(element) {
			element.style.color = color;
		});
	//한가지 색상 변경
	} else {
		document.getElementById(selectNum).style.color = document
		.getElementById("color").value;
		
	} 
}

//색상 최기화
function changeColorReset() {
	let selectTextElements = document.querySelectorAll(".selectText");

	selectTextElements.forEach(function(element) {
		element.style.color = "black";
	});
}

// Test6
function generateTable() {
	const number = parseInt(document.getElementById("numberInput").value);
	const tableContainer = document.getElementById("tableContainer");

	// 0일 경우
	if (number === 0) {
		tableContainer.innerHTML = "";
		return;
	}

	// 표 생성 및 초기화
	let tableHTML = "<table border='1'><tr>";
	let cellCounter = 0; // 현재 셀 수

	// 1부터 입력한 숫자까지 반복하여 표 생성
	for (let i = 1; i <= number; i++) {
		// 가로는 항상 4칸으로 고정
		if (cellCounter === 4) {
			tableHTML += "</tr><tr>";
			cellCounter = 0;
		}
		tableHTML += "<td>" + i + "</td>";
		cellCounter++;
	}

	// 남은 칸에 X 채우기
	while (cellCounter < 4) {
		tableHTML += "<td>X</td>";
		cellCounter++;
	}

	tableHTML += "</tr></table>";
	tableContainer.innerHTML = tableHTML;
}
