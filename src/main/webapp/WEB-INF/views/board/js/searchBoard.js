
let webViewPage = 1;
let imageViewPage = 1;
let videoViewPage = 1;
const initButtonHide = document.querySelectorAll(".seeMoreButton");
// console.log("버튼배열" + initButtonHide);
//초기에 버튼 숨기기
initButtonHide.forEach(button => {
    button.style.display = "none";
});



// 페이지 초기화 버튼 
function resetPage() {
    const webResultContainer = document.querySelector("#result"); // 웹 검색 결과를 초기화
    const imageResultContainer = document.querySelector("#imageResult"); // 이미지 검색 결과를 초기화
    const videoResultContainer = document.querySelector("#vclipResult"); // 동영상 검색 결과를 초기화
    webResultContainer.innerHTML = ""; 
    imageResultContainer.innerHTML = "";
    videoResultContainer.innerHTML = "";
    
    webViewPage = 1; // 웹 검색 페이지 초기화
    imageViewPage = 1; // 이미지 검색 페이지 초기화
    videoViewPage = 1; // 동영상 검색 페이지 초기화
}


// 웹 겁색 기능
function test() {
    const text = document.querySelector("#searchInput").value;
    const apiUrl ="https://dapi.kakao.com/v2/search/web";
    const seeMoreButton = document.querySelector("#webSeeMoreButton");
    checkSearchInput(text)
    // console.log(text);
    fetch(apiUrl + `?query=${text}&page=${webViewPage}`, {
        method: "GET",
        headers: {
            "Authorization": "KakaoAK fb1e286e32a16ba4ecf493292866d387",
        },
       })
       .then(response => response.json())
       .then(data => {
        // console.log(data);
        const resultContainer = document.querySelector("#result");
        let pageEnd = data.meta.is_end;
        // console.log(pageEnd);
        //버튼 숨기기 기능
        hideSeeMoreButton(seeMoreButton,pageEnd);
        // resultContainer.innerHTML = ""; // 결과를 초기화

        for (let i = 0; i < data.documents.length; i++) {
            const document = data.documents[i];
            const title = document.title;
            const url = document.url;
            const contents = document.contents;
            const resultText = 
            `<div style="margin-bottom: 35px;">
                <h3>
                    <a href="${url}" target="_blank">${title}</a>
                </h3>
                <a href="${url}" target="_blank">${url}</a>
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
    const seeMoreButton = document.querySelector("#videoSeeMoreButton");
    fetch(apiUrl + `?query=${text}&page=${videoViewPage}`, {
        method: "GET",
        headers: {
            "Authorization": "KakaoAK fb1e286e32a16ba4ecf493292866d387",
        },
       })
       .then(response => response.json())
       .then(data => {
        // console.log(data);
        const resultContainer = document.querySelector("#vclipResult");
        let pageEnd = data.meta.is_end;
        //버튼 숨기기 기능
        hideSeeMoreButton(seeMoreButton,pageEnd);
        

        for (let i = 0; i < data.documents.length; i++) {
            const document = data.documents[i];
            const title = document.title;
            const url = document.url;
            const play_time = document.play_time;
            const dateTime = document.datetime;
            const thumbnail = document.thumbnail;
            const resultText = 
            `<div class="row">
                <div style="position: relative; top: 50%; transform: translateY(-50%);">
                    <div class="col-md-2">
                        <a href="${url}" target="_blank"><img alt="em" src="${thumbnail}"></a>
                        </div>
                    <div class="col-md-10">
                        <h3>
                        <a href="${url}" target="_blank">${title}</a>
                        </h3>
                        <a href="${url}" target="_blank">${url}</a>
                        <div>${play_time}</div>
                        <div>${dateTime}</div>
                    </div>
                    </div>
            </div>`
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
    const seeMoreButton = document.querySelector("#imageSeeMoreButton");
    
    fetch(apiUrl + `?query=${text}&page=${imageViewPage}`, {
        method: "GET",
        headers: {
            "Authorization": "KakaoAK fb1e286e32a16ba4ecf493292866d387",
        },
       })
       .then(response => response.json())
       .then(data => {
        // console.log(data);
        const resultContainer = document.querySelector("#imageResult");
        let pageEnd = data.meta.is_end;
        //버튼 숨기기 기능
        hideSeeMoreButton(seeMoreButton,pageEnd);
        

        for (let i = 0; i < data.documents.length; i++) {
            const document = data.documents[i];
            const thumbnail_url = document.thumbnail_url;
            const doc_url = document.doc_url;
            const resultText = 
            `<div class="col-12 col-md-3 mb-3" style="margin-bottom: 15px;">
                <a href="${doc_url}" target="_blank"><img alt="em" src="${thumbnail_url}"></a>
            </div>`
            
            
            resultContainer.innerHTML += resultText;
        }
    })
    .catch(err => {
        console.log("Fetch error:", err);
    });
}

//웹 더보기 버튼
function webSeeMoreButton() {
    webViewPage++;
    test();
};
//이미지 더보기 버튼
function imageSeeMoreButton() {
    imageViewPage++;
    imageSearch()
};
//동영상 더보기 버튼 
function videoSeeMoreButton() {
    videoViewPage++;
    videoSearch()
};

//더보기 버튼 숨기기
function hideSeeMoreButton(seeMoreButton,pageEnd){
    // console.log("버튼의 속성" + seeMoreButton.id);
    // console.log("페이지 끝" + pageEnd);
    if (pageEnd === true) {
        // 선택한 버튼을 숨깁니다.
        seeMoreButton.style.display = "none";      
    }else {
        seeMoreButton.style.display = "block";
    }
};

//검색어 체크 
function checkSearchInput(text){
    if(text === ""){
        alert("검색어를 입력해 주세요");
    }
};
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

//엔터 클릭시 검색
document.getElementById("searchInput").addEventListener("keydown", function(event) {
    if (event.keyCode === 13) {
        resetPage();
        test();
    }
});





