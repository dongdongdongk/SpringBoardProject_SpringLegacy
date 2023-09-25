



function test() {
    const text = document.querySelector("#searchInput").value;
    const apiUrl ="https://dapi.kakao.com/v2/search/web"
    alert(text);
    
    fetch(apiUrl + `?query=${text}`, {
        method: "GET",
        headers: {
            "Authorization": "KakaoAK fb1e286e32a16ba4ecf493292866d387",
        },
       })
       .then(response => response.json())
       .then(date => console.log(date))
       .catch(err => console.log(err));

}





