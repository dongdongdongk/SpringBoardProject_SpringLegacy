<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <title>간단한 계산기</title>
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
            background-color: #f2f2f2;
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
    <h1>간단한 계산기</h1>
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
            <td onclick="calculateResult()">=</td>
        </tr>
    </table>

    <script>
        let currentInput = '';
        let currentOperation = '';
        let resultDisplay = document.getElementById('result');

        function addToResult(value) {
            if (!currentInput && ['*', '-', '+'].includes(value)) {
                // 시작이 연산자로 시작하지 않도록 처리
                return;
            }

            // 현재 입력값의 마지막 문자가 연산자인지 확인
            const lastChar = currentInput[currentInput.length - 1];
            if (['*', '-', '+','.'].includes(lastChar) && ['*', '-', '+','.'].includes(value)) {
                // 연속된 연산자는 추가하지 않음
                return;
            }

            if (value === 'Del') {
                // Del 버튼을 눌렀을 때
                if (currentInput.length > 1) {
                    currentInput = currentInput.slice(0, -1); // 마지막 문자 제거
                }
            } else if (currentInput.length < 12) { // Display up to 12 characters
                currentInput += value;
            }

            resultDisplay.innerText = currentInput;

            // 선택한 버튼의 스타일 변경 및 원래 색상으로 돌아가기
            const button = event.target; // 이벤트 객체를 매개변수로 받아옵니다.
            button.classList.add('selected');
            setTimeout(() => {
                button.classList.remove('selected');
            }, 100);
        }

        function clearLastCharacter() {
            if (currentInput.length > 1) {
                currentInput = currentInput.slice(0, -1);
            }
            resultDisplay.innerText = currentInput;
        }

        function calculateResult() {
            try {
                const result = eval(currentInput);
                if (!isNaN(result)) {
                    currentInput = result.toString();
                    resultDisplay.innerText = currentInput;
                }
            } catch (error) {
                currentInput = 'Error';
                resultDisplay.innerText = currentInput;
            }
        }
    </script>
</body>
</html>