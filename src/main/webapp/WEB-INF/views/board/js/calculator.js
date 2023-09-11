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
    if (['*', '-', '+','.','='].includes(lastChar) && ['*', '-', '+','.','='].includes(value)) {
        // 연속된 연산자는 추가하지 않음
        return;
    }

    if (value === 'Del') {
        // Del 버튼을 눌렀을 때
        if (currentInput.length > 1) {
            currentInput = currentInput.slice(0, -1); // 마지막 문자 제거
        }
    } else if (currentInput.length < 40) { // 40개 제한
        currentInput += value;
    }

    resultDisplay.innerText = currentInput;
    selectedButtonSetColor()

}

function clearLastCharacter() {
    if (currentInput.length > 1) {
        currentInput = currentInput.slice(0, -1);
    } else {
      resultDisplay.innerText = 0;
    }
    resultDisplay.innerText = currentInput;
    selectedButtonSetColor()
}

function selectedButtonSetColor() {
      // 선택한 버튼의 스타일 변경 및 원래 색상으로 돌아가기
      const button = event.target; // 이벤트 객체를 매개변수로 받아옵니다.
      button.classList.add('selected');
      setTimeout(() => {
          button.classList.remove('selected');
      }, 100);
}

function calculateResult() {
    try {
      const lastChar = currentInput[currentInput.length - 1];
        if (['*', '-', '+','.'].includes(lastChar)) {

            return;
          }


        
        const result = eval(currentInput);
        if (!isNaN(result)) {
            currentInput = result.toString();
            resultDisplay.innerText = currentInput;
        }
    } catch (error) {
        currentInput = 'Error';
        resultDisplay.innerText = currentInput;
    }
    selectedButtonSetColor()
}