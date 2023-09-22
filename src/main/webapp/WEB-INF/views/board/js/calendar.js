$(document).ready(function () {
	calendarInit();
	calendarList();
	//버튼 클릭시 색 다시 불러오기 
	// $(".nav-btn.go-next").click(function () {
	// 	calendarList();
	// });
	// $(".nav-btn.go-prev").click(function () {
	// 	calendarList();
	// });
});

const selectElement = document.querySelector(".month");
/*
 * 달력 렌더링 할 때 필요한 정보 목록
 * 
 * 현재 월(초기값 : 현재 시간) 금월 마지막일 날짜와 요일 전월 마지막일 날짜와 요일
 */

// 날짜 정보 가져오기
var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct
// 표준시
// 도출
var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)

var thisMonth = new Date(today.getFullYear(), today.getMonth(), today
	.getDate());
// 달력에서 표기하는 날짜 객체

var currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
var currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
var currentDate = thisMonth.getDate(); // 달력에서 표기하는 일
function calendarInit() {

	document.getElementById("submitCalendar").addEventListener("click", handleSubmitCalendar);
	// kst 기준 현재시간
	// console.log(thisMonth);

	// 캘린더 렌더링
	renderCalender(thisMonth);

	// 클릭한 일 값 가져오기
	$(document).on('click', '.day', function () {
		// 클릭한 일자의 값을 가져옵니다.
		let dayValue = $(this).attr('value');

		// 모달 엘리먼트를 찾기.
		let modal = $('#exampleModal');

		// 모달 내부의 inputDay 엘리먼트를 찾아서 해당 엘리먼트의 value 값을 설정
		modal.find('.inputDay').val(dayValue);

		// 모달을 엽니다.
		modal.modal('show');
	});

	// 이전달로 이동
	$('.go-prev').on('click', function () {
		thisMonth = new Date(currentYear, currentMonth - 1, 1);
		renderCalender(thisMonth);
		calendarList();
	});

	// 다음달로 이동
	$('.go-next').on('click', function () {
		thisMonth = new Date(currentYear, currentMonth + 1, 1);
		renderCalender(thisMonth);
		calendarList();
	});

}
function renderCalender(thisMonth) {

	// 렌더링을 위한 데이터 정리
	currentYear = thisMonth.getFullYear();
	currentMonth = thisMonth.getMonth();
	currentDate = thisMonth.getDate();

	// 이전 달의 마지막 날 날짜와 요일 구하기
	var startDay = new Date(currentYear, currentMonth, 0);
	var prevDate = startDay.getDate();
	var prevDay = startDay.getDay();

	// 이번 달의 마지막날 날짜와 요일 구하기
	var endDay = new Date(currentYear, currentMonth + 1, 0);
	var nextDate = endDay.getDate();
	var nextDay = endDay.getDay();


	// 현재 월 표기
	$('.month').text(currentMonth + 1);
	$('.inputMonth').val(currentMonth + 1);

	// 햔제 년 표기
	$('.year').text(currentYear);
	$('.inputYear').val(currentYear);

	// 년,월,날짜 표기
	/*$('.fullDate').text(currentYear + "년 " + (currentMonth + 1) + "월 " + currentDate + "일");*/
	$('.inputDate').val(currentYear + "년 " + (currentMonth + 1) + "월 " + currentDate + "일");


	// 렌더링 html 요소 생성
	calendar = document.querySelector('.dates')
	calendar.innerHTML = '';

	// 지난달
	for (var i = prevDate - prevDay; i <= prevDate; i++) {
		calendar.innerHTML = calendar.innerHTML
			+ '<div class="day prev disable">' + i + '</div>'
	}
	// 이번달
	for (var i = 1; i <= nextDate; i++) {
		calendar.innerHTML = calendar.innerHTML
			+ "<a class='day current' data-toggle='modal' data-target='#exampleModal' data-month-Value='"
			+ (currentMonth + 1) + "' data-year-Value='" + currentYear
			+ "' value='" + i
			+ "' onclick='getCalendarDetailList(this)'>" + i + '</a>'
	}
	// 다음달
	for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
		calendar.innerHTML = calendar.innerHTML
			+ '<div class="day next disable">' + i + '</div>'
	}

	// 오늘 날짜 표기
	if (today.getMonth() == currentMonth) {
		todayDate = today.getDate();
		var currentMonthDate = document.querySelectorAll('.dates .current');
		currentMonthDate[todayDate - 1].classList.add('today');
	}
}


let buttonData = null;
function getCalendarDetailList(button) {
	// 클릭한 버튼에서 속성 값을 가져옵니다.
	let dayValue = button.getAttribute('value');
	let monthValue = button.getAttribute('data-month-Value');
	let yearValue = button.getAttribute('data-year-Value');
	let modal = $('#exampleModal');
	dayValue = dayValue.toString();
	monthValue = monthValue.toString();
	yearValue = yearValue.toString();
	$('.fullDate').text(yearValue + "년" + monthValue + "월" + dayValue + "일");
	//버튼에서 가져온 값 저장
	buttonData = {
		"dayValue": dayValue,
		"monthValue": monthValue,
		"yearValue": yearValue
	};

	// 캘린더 디테일 출력
	$.ajax({
		url: '/board/CalendarDetail',
		type: 'GET',
		data: {
			calDay: dayValue,
			calMonth: monthValue,
			calYear: yearValue
		},
		success: function (data) {
			console.log("성공")
			CalendarListResult(data)
		},
		error: function (error) {
			console.log("실패")
			console.log(yearValue)
			console.log(monthValue)
			console.log(dayValue)
		}
	});
	function CalendarListResult(data) {
		let table = $("<table>").addClass("table"); // 테이블 생성 및 클래스 추가

		// 테이블 헤더 생성
		let tableHead = $("<thead>");
		let tableHeadRow = $("<tr>");
		tableHeadRow.append("<th>시간</th>");
		tableHeadRow.append("<th>내용</th>");
		tableHeadRow.append("<th>중요</th>");
		tableHeadRow.append("<th>삭제</th>");
		tableHead.append(tableHeadRow);

		// 테이블 본문 생성
		let tableBody = $("<tbody>");
		for (let i = 0; i < data.length; i++) {
			let rowData = data[i];
			let tableRow = $("<tr>");
			let dataRowNumber = i + 1;
			tableRow.attr("data-row-number", dataRowNumber);
			tableRow.append("<td>" + rowData.calTime + "</td>");
			tableRow.append("<td>" + rowData.calContents + "</td>");
			if (rowData.calReq == 1) {
				tableRow.append("<td><span style='color: red;'>*</span></td>");
			} else {
				tableRow.append("<td>" + "" + "</td>");
			}
			tableRow.append("<td><a href='#' onclick='deleteItem(" + rowData.calNo + "," + dataRowNumber + ");'>x</a></td>");
			tableBody.append(tableRow);
		}

		// 테이블에 헤더와 본문 추가
		table.append(tableHead);
		table.append(tableBody);

		// 이전에 있던 데이터 삭제
		$('.modalResult').empty();

		// 생성한 테이블을 추가
		$('.modalResult').append(table);
	}

	
}
function handleSubmitCalendar() {
    const form = document.getElementById("setCalendar");
    const calYear = form.querySelector("input[name='calYear']").value;
    const calMonth = form.querySelector("input[name='calMonth']").value;
    const calDay = form.querySelector("input[name='calDay']").value;
    const calTime = form.querySelector("input[name='calTime']").value;
    const calContents = form.querySelector("textarea[name='calContents']").value;
    const calReq = form.querySelector("input[name='calReq']:checked");

    // calReq의 경우 체크되었을 때만 값을 가져옴
    if (calReq) {
        calReqValue = calReq.value;
    } else {
        calReqValue = "0"; // 체크되지 않았을 때 기본값 설정
    }

	    // 입력값 유효성 검사 (calTime 필드가 비어있을 때)
		if (!calTime) {
			alert("시간을 입력해주세요.");
			return; 
		}

    // 클릭한 버튼에서 속성 값을 가져옵니다.
    const dayValue = buttonData.dayValue;
    const monthValue = buttonData.monthValue;
    const yearValue = buttonData.yearValue;

    let formData = {
        "calYear": calYear,
        "calMonth": calMonth,
        "calDay": calDay,
        "calTime": calTime,
        "calContents": calContents,
        "calReq": calReqValue
    };
    console.log(formData);

    $.ajax({
        url: "/board/setCalendar",
        type: "POST",
        dataType: "text",
        data: JSON.stringify(formData),
        contentType: "application/json",
        success: function (data) {
            let currentYear = $('.inputYear').val();
            let currentMonth = $('.inputMonth').val();

            // 갱신된 데이터를 서버로부터 받아옴
            $.ajax({
                url: "/board/CalendarListData",
                type: "GET",
                dataType: "json",
                contentType: "application/json",
                success: function (data) {
                    console.log("데이터 받아오기 성공");
                    console.log(data);

                    // 다시 캘린더를 렌더링하고 현재 연도와 월로 설정
                    let thisMonth = new Date(currentYear, currentMonth - 1, 1);
                    renderCalender(thisMonth);
                    displayEventsOnCalendar(data);

                    // input 창 비우기
                    form.querySelector("input[name='calTime']").value = "";
                    form.querySelector("textarea[name='calContents']").value = "";
                    form.querySelector("input[name='calReq']").checked = false;
                    $.ajax({
                        url: '/board/CalendarDetail',
                        type: 'GET',
                        data: {
                            calDay: dayValue,
                            calMonth: monthValue,
                            calYear: yearValue
                        },
                        success: function (buttonData) {
                            console.log("성공")
                            CalendarListResult(buttonData);
                        },
                        error: function (error) {
                            console.log("실패")
                            console.log(yearValue)
                            console.log(monthValue)
                            console.log(dayValue)
                        }
                    });
                    console.log("버튼 정보는" + dayValue);
                    console.log("버튼 정보는" + monthValue);
                    console.log("버튼 정보는" + yearValue);
                    // 캘린더 디테일 출력
                },
                error: function (error) {
                    console.error("데이터 받아오기 실패");
                    console.error(error);
                }
            });
        },
        error: function (error) {
            console.error("추가 실패");
            console.error(error);
        }
    });
}


//캘린더 리스트  데이터 가져오기 (스케줄 있는날 표시를 위해서)
function calendarList() {
	$.ajax({
		url: "/board/CalendarListData",
		type: "GET",
		dataType: "json",
		contentType: "application/json",
		success: function (data) {
			console.log("데이터 받아오기 성공");
			console.log(data);
			displayEventsOnCalendar(data);
		},
		error: function (error) {
			console.error("데이터 받아오기 실패");
			console.error(error);
		}
	});
}



//받아온 데이터를 이용하여 캘린더에 이벤트를 표시하는 함수
function displayEventsOnCalendar(data) {
	// 예시: 각 이벤트 데이터를 순회하고, 해당 날짜에 이벤트가 있을 경우 버튼 스타일을 변경합니다.
	var buttons = document.querySelectorAll('.day');

	buttons.forEach(function (button) {
		var yearValue = button.getAttribute('data-year-Value');
		var monthValue = button.getAttribute('data-month-Value');
		var dayValue = button.getAttribute('value');

		for (var i = 0; i < data.length; i++) {
			if (
				data[i].calYear == yearValue &&
				data[i].calMonth == monthValue &&
				data[i].calDay == dayValue
			) {
				// 데이터에 해당하는 날짜에 이벤트가 있으면 버튼을 스타일링
				button.classList.add('event-date');
				break; // 데이터가 하나라도 일치하면 루프 종료
			}
		}
	});
}
//캘린더 스케줄 삭제
function deleteItem(num, dataRowNumber) {

	if (confirm("정말 삭제하시겠습니까??") == true) {
		$.ajax({
			url: "/board/CalendarDelete",
			type: "POST",
			data: { calNo: num },
			success: function (response) {

			},
			error: function (error) {
				console.log("Remove 성공");
				console.log(error);
				console.log(dataRowNumber)
				$("[data-row-number='" + dataRowNumber + "']").remove();
				// 삭제 성공 시 현재 연도와 월 정보 가져오기
				let currentYear = $('.inputYear').val();
				let currentMonth = $('.inputMonth').val();

				// 갱신된 데이터를 서버로부터 받아옴
				$.ajax({
					url: "/board/CalendarListData",
					type: "GET",
					dataType: "json",
					contentType: "application/json",
					success: function (data) {
						console.log("데이터 받아오기 성공");
						console.log(data);

						// 다시 캘린더를 렌더링하고 현재 연도와 월로 설정
						let thisMonth = new Date(currentYear, currentMonth - 1, 1);
						renderCalender(thisMonth);
						displayEventsOnCalendar(data);
					},
					error: function (error) {
						console.error("데이터 받아오기 실패");
						console.error(error);
					}
				});
			}
		});
	} else {
		return false;
	}
}


function CalendarListResult(data) {
	let table = $("<table>").addClass("table"); // 테이블 생성 및 클래스 추가

	// 테이블 헤더 생성
	let tableHead = $("<thead>");
	let tableHeadRow = $("<tr>");
	tableHeadRow.append("<th>시간</th>");
	tableHeadRow.append("<th>내용</th>");
	tableHeadRow.append("<th>중요</th>");
	tableHeadRow.append("<th>삭제</th>");
	tableHead.append(tableHeadRow);

	// 테이블 본문 생성
	let tableBody = $("<tbody>");
	for (let i = 0; i < data.length; i++) {
		let rowData = data[i];
		let tableRow = $("<tr>");
		let dataRowNumber = i + 1;
		tableRow.attr("data-row-number", dataRowNumber);
		tableRow.append("<td>" + rowData.calTime + "</td>");
		tableRow.append("<td>" + rowData.calContents + "</td>");
		if (rowData.calReq == 1) {
			tableRow.append("<td><span style='color: red;'>*</span></td>");
		} else {
			tableRow.append("<td>" + "" + "</td>");
		}
		tableRow.append("<td><a href='#' onclick='deleteItem(" + rowData.calNo + "," + dataRowNumber + ");'>x</a></td>");
		tableBody.append(tableRow);
	}

	// 테이블에 헤더와 본문 추가
	table.append(tableHead);
	table.append(tableBody);

	// 이전에 있던 데이터 삭제
	$('.modalResult').empty();

	// 생성한 테이블을 추가
	$('.modalResult').append(table);
}