<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <title>������ ����</title>
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
            cursor: pointer; /* Ŀ�� ����� �����ͷ� ���� */
        }

        #result {
            font-size: 24px;
            background-color: #f2f2f2;
            text-align: right;
            padding: 10px;
            user-select: none; /* �ؽ�Ʈ ���� ��Ȱ��ȭ */
        }

        /* ���õ� ��ư�� ��Ÿ�� */
        .selected {
            background-color: gray;
            color: white;
        }
    </style>
</head>
<body>
    <h1>������ ����</h1>
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
                // ������ �����ڷ� �������� �ʵ��� ó��
                return;
            }

            // ���� �Է°��� ������ ���ڰ� ���������� Ȯ��
            const lastChar = currentInput[currentInput.length - 1];
            if (['*', '-', '+','.'].includes(lastChar) && ['*', '-', '+','.'].includes(value)) {
                // ���ӵ� �����ڴ� �߰����� ����
                return;
            }

            if (value === 'Del') {
                // Del ��ư�� ������ ��
                if (currentInput.length > 1) {
                    currentInput = currentInput.slice(0, -1); // ������ ���� ����
                }
            } else if (currentInput.length < 12) { // Display up to 12 characters
                currentInput += value;
            }

            resultDisplay.innerText = currentInput;

            // ������ ��ư�� ��Ÿ�� ���� �� ���� �������� ���ư���
            const button = event.target; // �̺�Ʈ ��ü�� �Ű������� �޾ƿɴϴ�.
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