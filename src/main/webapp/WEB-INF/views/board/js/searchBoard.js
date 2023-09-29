// 웹 겁색 기능
function test() {
    const text = document.querySelector("#searchInput").value;
    const apiUrl ="https://dapi.kakao.com/v2/search/web";
    
    fetch(apiUrl + `?query=${text}`, {
        method: "GET",
        headers: {
            "Authorization": "KakaoAK fb1e286e32a16ba4ecf493292866d387",
        },
       })
       .then(response => response.json())
       .then(data => {
        console.log(data);
        const resultContainer = document.querySelector("#result");
        resultContainer.innerHTML = ""; // 결과를 초기화

        for (let i = 0; i < data.documents.length; i++) {
            const document = data.documents[i];
            const title = document.title;
            const url = document.url;
            const contents = document.contents;
            const resultText = 
            `<div class="mb-4">
                <h3>
                    <a href="${url}">${title}</a>
                </h3>
                <a>${url}</a>
                <div>${contents}</div>
            </div>`
            resultContainer.innerHTML += resultText;
        }
    })
    .catch(err => {
        console.log("Fetch error:", err);
    });

    videoSearch()
    imageSearch()

}

// 동영상 겁색 기능
function videoSearch() {
    const text = document.querySelector("#searchInput").value;
    const apiUrl ="https://dapi.kakao.com/v2/search/vclip";
    
    fetch(apiUrl + `?query=${text}`, {
        method: "GET",
        headers: {
            "Authorization": "KakaoAK fb1e286e32a16ba4ecf493292866d387",
        },
       })
       .then(response => response.json())
       .then(data => {
        console.log(data);
        const resultContainer = document.querySelector("#vclipResult");
        resultContainer.innerHTML = ""; // 결과를 초기화

        for (let i = 0; i < data.documents.length; i++) {
            const document = data.documents[i];
            const title = document.title;
            const url = document.url;
            const play_time = document.play_time;
            const dateTime = document.datetime;
            const resultText = `<h2><a href="${url}">${title}</a></h2><a>${url}</a><div>${play_time}</div><div>${dateTime}</div>`
            resultContainer.innerHTML += resultText;
        }
    })
    .catch(err => {
        console.log("Fetch error:", err);
    });
}

//이미지 검색
function imageSearch() {
    const text = document.querySelector("#searchInput").value;
    const apiUrl ="https://dapi.kakao.com/v2/search/image";
    
    fetch(apiUrl + `?query=${text}`, {
        method: "GET",
        headers: {
            "Authorization": "KakaoAK fb1e286e32a16ba4ecf493292866d387",
        },
       })
       .then(response => response.json())
       .then(data => {
        console.log(data);
        const resultContainer = document.querySelector("#imageResult");
        resultContainer.innerHTML = ""; // 결과를 초기화

        for (let i = 0; i < data.documents.length; i++) {
            const document = data.documents[i];
            const thumbnail_url = document.thumbnail_url;
            const image_url = document.image_url;
            const resultText = 
            `<div class="col-12 col-md-3 mb-3">
                <img alt="em" src="${thumbnail_url}">
                <a href="${image_url}"></a>
            </div>`
            
            
            resultContainer.innerHTML += resultText;
        }
    })
    .catch(err => {
        console.log("Fetch error:", err);
    });
}


// 탭 사용 함수
$(function(){
    var hash = window.location.hash;
    hash && $('ul.nav a[href="' + hash + '"]').tab('show');
  
    $('.nav-tabs a').click(function (e) {
      $(this).tab('show');
      var scrollmem = $('body').scrollTop();
      window.location.hash = this.hash;
      $('html,body').scrollTop(scrollmem);
    });
  });








