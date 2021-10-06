//time .0 묻어서 추가 구문
let setTime = String($('.timeago').attr('title')).replace(".0", "");
$('.timeago').attr('title', setTime);

let allData = "job_type=1&job_mid_cd=2&job_cd=&edu_lv=&loc_cd=";

$.ajax({
    url: 'http://localhost:8090/jobData.do?',  //json데이터에 검색할 param담아서 요청
    type: 'get',
    dataType: 'json',
    data: allData,

    success: function (data) {
        $.each(data, function (index, obj) {
            for (let i = 0; i < 7; i++) {
                let url = String(data.jobs.job[i]["url"]); //공고 url
                let title = String(data.jobs.job[i].position["title"]);
                let href = String(data.jobs.job[i].company["detail"].href);
                let deadline = new Date((data.jobs.job[i]['expiration-timestamp']) * 1000)
                deadline = deadline.toLocaleDateString();

                let jobArticle = `
										<li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
												<div class="list-title-wrapper">
														<h5 class="list-group-item-heading">
																<a href="` + url + `">` + title + `</a>
																<div class="list-group-item-author pull-right clearfix">
																		<div class="avatar clearfix avatar-x-small ">
																				<div class="avatar-info">
																						<div class="activity"></div>
																						<div class="date-created">
																						<span class="timeago"   title="` + deadline + `">마감  ` + deadline + `</span>
																						</div>
																				</div>
																		</div>
																</div>
														</h5>
												</div>
										</li>`
                $('.col-sm-6.main-block-right .list-group').append(jobArticle);
            }
        });
    }
});

//board 카테고리에 따라 매핑 href 변하게
let columnData = $('div[data-group-value="100"]').data('value');
let qnaData = $('div[data-group-value="200"]').data('value');
let studyData = $('div[data-group-value="300"]').data('value');

$('div[data-group-value="100"]').children().children().attr('href', 'StudyDetail.so?no=' + studyData);
$('div[data-group-value="200"]').children().children().attr('href', 'QnAContent.qo?no=' + studyData);
$('div[data-group-value="300"]').children().children().attr('href', 'BoardContent.go?no=' + studyData);


<!-- 주소, 맵 관련 -->


var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    };

// 지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
//     infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
// HTML5의 geolocation으로 사용할 수 있는지 확인합니다
if (navigator.geolocation) {

    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function (position) {

        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도

        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">당신,,있다,,이곳</div>'; // 인포윈도우에 표시될 내용입니다

        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);

    });

} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
        message = 'geolocation을 사용할수 없어요..'

    displayMarker(locPosition, message);
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: locPosition
    });

    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);

    searchAddrFromCoords(map.getCenter(), displayCenterInfo);

    function searchAddrFromCoords(coords, callback) {
        // 좌표로 행정동 주소 정보를 요청합니다
        geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
    }

// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수
    //본문 안의 주소 데이터와 매핑하여 일치하는 요소의 값을 변경함
    function displayCenterInfo(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var infoDiv = document.getElementById('centerAddr');

            for (var i = 0; i < result.length; i++) {
                // 행정동의 region_type 값은 'H' 이므로
                if (result[i].region_type === 'H') {
                    infoDiv.innerHTML = result[i].address_name;
                    break;
                }
            }
            let check = 1;
            let sido = $('#centerAddr').html();
            let splitsido = sido.split(' ');  //splitsido[0] 서울특별시 splitsido[1] 관악구


            for (let i = 0; i < $('.panel-body .article-middle-block').length; i++) {
                if (check < 4) {
                    //console.log($('#' + i + '_sido2 ').html()); //2번째 구 이름 정상출력 . 문) 전체< 잡아야함

                    if (splitsido[1] == $('#' + i + '_sido2 ').html()) { //구 동일할 경우  ck += 1
                        $('#' + i + '_sido2 ').parent().parent().attr('style', 'display:block');
                        // splitsido[0] == $('#' + i + '_sido1 ').html()

                        check += 1;
                        console.log(" if check= " + check);

                    } // 2번 진행됨. 아직 3이 아니니까 두번째 반복문 실행
                }
            }
            ;


            for (let j = 0; j < $('.panel-body .article-middle-block').length; j++) {
                if (check < 4) {
                    if (splitsido[0] == $('#' + j + '_sido1 ').html() &&
                        splitsido[1] == '전체') { //시 동일할 경우 ck += 1
                        $('#' + j + '_sido1').parent().parent().attr('style', 'display:block');

                        check += 1;
                        console.log("else if check= " + check);
                        if (check == 3) {
                            break;
                        }
                    }
                }
            };

            for (let j = 0; j < $('.panel-body .article-middle-block').length; j++) {
                if (check < 4) {
                    if (splitsido[0] == $('#' + j + '_sido1 ').html() &&
                        splitsido[1] != $('#' + j + '_sido2 ').html()) { //시 동일할 경우 ck += 1
                        $('#' + j + '_sido1').parent().parent().attr('style', 'display:block');

                        check += 1;
                        console.log("else if check= " + check);
                        if (check == 3) {
                            break;
                        }
                    }
                }

            };

        };

    }
}