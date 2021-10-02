$(function() {
    let data = {
        "name": "korea-administrative-district",
        "version": "20160125",
        "url": "https://github.com/cosmosfarm/korea-administrative-district",
        "data": [
            {
                "서울특별시": [
                    "전체","종로구", "중구", "용산구", "성동구", "광진구", "동대문구", "중랑구", "성북구", "강북구", "도봉구", "노원구", "은평구", "서대문구", "마포구", "양천구", "강서구", "구로구", "금천구", "영등포구", "동작구", "관악구", "서초구", "강남구", "송파구", "강동구"
                ]
            },
            {
                "부산광역시": [
                    "전체","중구", "서구", "동구", "영도구", "부산진구", "동래구", "남구", "북구", "강서구", "해운대구", "사하구", "금정구", "연제구", "수영구", "사상구", "기장군"
                ]
            },
            {
                "인천광역시": [
                    "전체","중구", "동구", "남구", "연수구", "남동구", "부평구", "계양구", "서구", "강화군", "옹진군"
                ]
            },
            {
                "대구광역시": [
                    "전체","중구", "동구", "서구", "남구", "북구", "수성구", "달서구", "달성군"
                ]
            },
            {
                "광주광역시": [
                    "전체","동구", "서구", "남구", "북구", "광산구"
                ]
            },
            {
                "대전광역시": [
                    "전체","동구", "중구", "서구", "유성구", "대덕구"
                ]
            },
            {
                "울산광역시": [
                    "전체","중구", "남구", "동구", "북구", "울주군"
                ]
            },
            {
                "세종특별자치시": ["전체"]
            },
            {
                "경기도": [
                    "전체","가평군", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "양평군", "여주시", "연천군", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시"
                ]
            },
            {
                "강원도": [
                    "전체","원주시", "춘천시", "강릉시", "동해시", "속초시", "삼척시", "홍천군", "태백시", "철원군", "횡성군", "평창군", "영월군", "정선군", "인제군", "고성군", "양양군", "화천군", "양구군"
                ]
            },
            {
                "충청북도": [
                    "전체","청주시", "충주시", "제천시", "보은군", "옥천군", "영동군", "증평군", "진천군", "괴산군", "음성군", "단양군"
                ]
            },
            {
                "충청남도": [
                    "전체", "천안시", "공주시", "보령시", "아산시", "서산시", "논산시", "계룡시", "당진시", "금산군", "부여군", "서천군", "청양군", "홍성군", "예산군", "태안군"
                ]
            },
            {
                "경상북도": [
                    "전체","포항시", "경주시", "김천시", "안동시", "구미시", "영주시", "영천시", "상주시", "문경시", "경산시", "군위군", "의성군", "청송군", "영양군", "영덕군", "청도군", "고령군", "성주군", "칠곡군", "예천군", "봉화군", "울진군", "울릉군"
                ]
            },
            {
                "경상남도": [
                    "전체", "창원시", "김해시", "진주시", "양산시", "거제시", "통영시", "사천시", "밀양시", "함안군", "거창군", "창녕군", "고성군", "하동군", "합천군", "남해군", "함양군", "산청군", "의령군"
                ]
            },
            {
                "전라북도": [
                    "전주시", "익산시", "군산시", "정읍시", "완주군", "김제시", "남원시", "고창군", "부안군", "임실군", "순창군", "진안군", "장수군", "무주군"
                ]
            },
            {
                "전라남도": [
                    "전체","여수시", "순천시", "목포시", "광양시", "나주시", "무안군", "해남군", "고흥군", "화순군", "영암군", "영광군", "완도군", "담양군", "장성군", "보성군", "신안군", "장흥군", "강진군", "함평군", "진도군", "곡성군", "구례군"
                ]
            },
            {
                "제주특별자치도": [
                    "전체","제주시", "서귀포시"
                ]
            }
        ]
    }

    function testfunc() {
        alert("testfunc"); //테스트용...
    }

//let key = Object.keys(data.data[0]);
//console.log(key);
    let sido = [];
    for (let i = 0; i < data.data.length; i++) {
        sido.push(Object.keys(data.data[i])[0])
    };

    //console.log(sido); //서울특별시, 경기도, 등등 string  으로 들어있는 array

    //let loca = document.querySelector("#location1");
    //console.log(loca.innerHTML);

    let loca1 = document.getElementById("location1");//시도
    let loca2 = document.getElementById("location2");//시군구

    for(let j=0;j<sido.length;j++){
        loca1.innerHTML += "<option value=" +sido[j]+ ">" +
            sido[j] + "</option>";
    };


    let sidoarr1 =data.data[0].서울특별시;
    let sidoarr2 =data.data[1].부산광역시;
    let sidoarr3 =data.data[2].인천광역시;
    let sidoarr4 =data.data[3].대구광역시;
    let sidoarr5 =data.data[4].광주광역시;
    let sidoarr6 =data.data[5].대전광역시;
    let sidoarr7 =data.data[6].울산광역시;
    let sidoarr8 =data.data[7].세종특별자치시;
    let sidoarr9 =data.data[8].경기도;
    let sidoarr10 =data.data[9].강원도;
    let sidoarr11 =data.data[10].충청북도;
    let sidoarr12 =data.data[11].충청남도;
    let sidoarr13 =data.data[12].경상북도;
    let sidoarr14 =data.data[13].경상남도;
    let sidoarr15 =data.data[14].전라북도;
    let sidoarr16 =data.data[15].전라남도;
    let sidoarr17 =data.data[16].제주특별자치도;
    $("select[name=location1]").change(function(){
        let test = $(this).val();
        if(test == "서울특별시"){
            let myhtml = "";
            for(let j=0;j<data.data[0].서울특별시.length;j++){
                myhtml += "<option value=" + sidoarr1[j] +">" +
                    sidoarr1[j]+"</option>";
            };
            loca2.innerHTML =myhtml;

        }else if(test == "부산광역시"){
            let myhtml = "";
            for(let j=0;j<data.data[1].부산광역시.length;j++){
                myhtml += "<option value=" + sidoarr2[j] +">" +
                    sidoarr2[j]+"</option>";
            };
            loca2.innerHTML =myhtml;
        }else if(test == "인천광역시"){
            let myhtml = "";
            for(let j=0;j<data.data[2].인천광역시.length;j++){
                myhtml += "<option value=" + sidoarr3[j] +">" +
                    sidoarr3[j]+"</option>";
            };
            loca2.innerHTML =myhtml;
        }else if(test == "대구광역시"){
            let myhtml = "";
            for(let j=0;j<data.data[3].대구광역시.length;j++){
                myhtml += "<option value=" + sidoarr4[j] +">" +
                    sidoarr4[j]+"</option>";
            };
            loca2.innerHTML =myhtml;
        }else if(test == "광주광역시"){
            let myhtml = "";
            for(let j=0;j<data.data[4].광주광역시.length;j++){
                myhtml += "<option value=" + sidoarr5[j] +">" +
                    sidoarr5[j]+"</option>";
            };
            loca2.innerHTML =myhtml;
        }else if(test == "대전광역시"){
            let myhtml = ""
            for(let j=0;j<data.data[5].대전광역시.length;j++){
                myhtml += "<option value=" + sidoarr6[j] +">" +
                    sidoarr6[j]+"</option>";
            };
            loca2.innerHTML =myhtml;
        }else if(test == "울산광역시"){
            let myhtml = "";
            for(let j=0;j<data.data[6].울산광역시.length;j++){
                myhtml += "<option value=" + sidoarr7[j] +">" +
                    sidoarr7[j]+"</option>";
            };
            loca2.innerHTML =myhtml;
        }else if(test == "세종특별자치시"){
            let myhtml = "";
            for(let j=0;j<data.data[7].세종특별자치시.length;j++){
                myhtml += "<option value=" + sidoarr8[j] +">" +
                    sidoarr8[j]+"</option>";
            };
            loca2.innerHTML =myhtml;
        }else if(test == "경기도"){
            let myhtml = "";
            for(let j=0;j<data.data[8].경기도.length;j++){
                myhtml += "<option value=" + sidoarr9[j] +">" +
                    sidoarr9[j]+"</option>";
            };
            loca2.innerHTML =myhtml;
        }else if(test == "강원도"){
            let myhtml = "";
            for(let j=0;j<data.data[9].강원도.length;j++){
                myhtml += "<option value=" + sidoarr10[j] +">" +
                    sidoarr10[j]+"</option>";
            };
            loca2.innerHTML =myhtml;
        }else if(test == "충청북도"){
            let myhtml = "";
            for(let j=0;j<data.data[10].충청북도.length;j++){
                myhtml += "<option value=" + sidoarr11[j] +">" +
                    sidoarr11[j]+"</option>";
            };
            loca2.innerHTML =myhtml;
        }else if(test == "충청남도"){
            let myhtml = "";
            for(let j=0;j<data.data[11].충청남도.length;j++){
                myhtml += "<option value=" + sidoarr12[j] +">" +
                    sidoarr12[j]+"</option>";
            };
            loca2.innerHTML =myhtml;
        }else if(test == "경상북도"){
            let myhtml = "";
            for(let j=0;j<data.data[12].경상북도.length;j++){
                myhtml += "<option value=" + sidoarr13[j] +">" +
                    sidoarr13[j]+"</option>";
            };
            loca2.innerHTML =myhtml;
        }else if(test == "경상남도"){
            let myhtml = "";
            for(let j=0;j<data.data[13].경상남도.length;j++){
                myhtml += "<option value=" + sidoarr14[j] +">" +
                    sidoarr14[j]+"</option>";
            };
            loca2.innerHTML =myhtml;
        }else if(test == "전라북도"){
            let myhtml = "";
            for(let j=0;j<data.data[14].전라북도.length;j++){
                myhtml += "<option value=" + sidoarr15[j] +">" +
                    sidoarr15[j]+"</option>";
            };
            loca2.innerHTML =myhtml;
        }else if(test == "전라남도"){
            let myhtml = "";
            for(let j=0;j<data.data[15].전라남도.length;j++){
                myhtml += "<option value=" + sidoarr16[j] +">" +
                    sidoarr16[j]+"</option>";
            };
            loca2.innerHTML =myhtml;
        }else if(test == "제주특별자치도"){
            let myhtml = "";
            for(let j=0;j<data.data[16].제주특별자치도.length;j++){
                myhtml += "<option value=" + sidoarr17[j] +">" +
                    sidoarr17[j]+"</option>";
            };
            loca2.innerHTML =myhtml;
        }
    });



    //console.log(data.data[1]);
    //let mykey = Object.keys(data.data[0])[0];
    //console.log(data.data[0].서울특별시);//서울특별시 안의 구만 쫙 나옴
    //console.log(Object.keys(data.data[0])[0]);//서울특별시
    //console.log(Object.keys(data.data[1])[0]);//부산광역시
    //let key = Object.keys(data.data[1])[0];
    //console.log(key);
    //console.log(data.data[1].key);

});