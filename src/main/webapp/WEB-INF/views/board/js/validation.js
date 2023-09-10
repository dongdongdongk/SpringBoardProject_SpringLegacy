function validateForm() {
    if (document.getElementById('title').value == '') {
        alert('제목을 입력해 주세요');
        return false;
    }
    if (document.getElementById('writer').value == '') {
        alert('작성자를 입력해 주세요');
        return false;
    }
    if (document.getElementById('contents').value == '') {
        alert('내용을 입력해 주세요');
        return false;
    }
    
    return true;
}

document.querySelector('form').addEventListener('submit', function(e){
    if (!validateForm()) {
        e.preventDefault();
    }
});