//초기화면 셋팅
requestJobSearch('', '', "2", "", "", "");

//태그 x버튼 클릭시 태그 삭제
function deletePill(obj) {
    let parent = obj.parentNode;
    parent.parentNode.removeChild(parent); //태그 삭제
    let dataValue = '';
    dataValue = $(obj).parent().data('value'); //부모의 data-value값 저장
    $('div[data-value="' + dataValue + '"]').attr('class', 'filter-select'); //같은 data-value값을 가지는 div찾아 비활성화
};

//클릭하면 토글 -급여, 기타상세
function onClickToggle(obj) {
    console.log("토글클릭하고싶음");
    $(obj).toggleClass("active");
    console.log($(obj).attr('class'));
};

// //사이드바 상세 게시판명 클릭하면 토글
// $(".nav a").click(function (event) {
//     // console.log("nav클릭하고싶음");
//     // console.log(  $('.nav-indicator.nav-selected'));
//     // console.log(  $('.nav-indicator.nav-selected').prop('class'));
//     // $('.nav-indicator.nav-selected').prop('class', 'nav-indicator'); //모든 도트 끄기
//     // console.log( $(this).children('.nav-indicator'));
//     // console.log(   $(this));
//     // console.log(   $(this).children('.nav-indicator').prop('class'));
//     // $(this).children('.nav-indicator').addClass('nav-selected');
//
//     if (location.href == 'http://localhost:8090/job.do?jobType=CONTRACT') {
//         $('a[href="/job.do?jobType=FULLTIME"]').children('.nav-indicator').removeClass('nav-selected');
//     } else if (location.href == 'http://localhost:8090/job.do?jobType=FULLTIME') {
//         $('a[href="/job.do?jobType=CONTRACT"]').children('.nav-indicator').removeClass('nav-selected');
//     }
//
// });


//선택초기화 클릭시 모든 셋팅 초기화
$("#job-filter-modal-reset").click(function (event) {
    console.log($(".filter-select active"));
    console.log($(".filter-select"));
    $(".filter-select.active").prop('class', 'filter-select');
    $(".filter-active-tags").children().remove();
});


$(function () {
//         $.ajax({
//             url: 'http://localhost:8090/jobData.do', //json데이터 주소
//             type: 'get',
//             dataType: 'json',
//             success: function (data) {
//
//                 //data길이만큼 돌면서 list를 출력하는 함수
//                 $.each(data, function (index, obj) {
//                     for (let i = 1; i < obj.job.length; i++) {
// //TODO 중복 제거 - data.jobs.job[0]
//                         $(".list-group").append($('#list-group-items').attr('style', ('display:""'))); //list 생성
//                         $('#list-group-items:eq(0)').attr('style', ('display:none')); //첫번째 공고 숨김
//
//                         $('.title-link:eq(' + i + ')').attr('href', (data.jobs.job[i]["url"])); //타이틀 링크 변경
//                         $('.position:eq(' + i + ')').text((data.jobs.job[i].position["location"].name).replace("&gt;", ">")); //지역
//                         $('.project:eq(' + i + ')').text(data.jobs.job[i].position["title"]); //공고제목
//                         $('.salary-name:eq(' + i + ')').text(data.jobs.job[i]["salary"].name); //연봉
//                         $('.required-education-level-name:eq(' + i + ')').text(data.jobs.job[i].position["required-education-level"].name); //학력
//                         $('.experience-level-name:eq(' + i + ')').text(data.jobs.job[i].position["experience-level"].name); //경력
//                         $('.location-name:eq(' + i + ')').text((data.jobs.job[i].position["location"].name).replace("&gt;", ">")); //지역
//                         $('.job-type-name:eq(' + i + ')').text(data.jobs.job[i].position["job-type"].name); //근무형태
//                         let deadline = new Date((data.jobs.job[i]['expiration-timestamp']) * 1000);
//                         $('.expiration-timestamp:eq(' + i + ')').text('마감일   ' + deadline.toLocaleDateString()); //마감일
//                         $('.list-company-info:eq(' + i + ') a').attr('href', (data.jobs.job[i].company["detail"].href)) //회사 링크 변경
//                         $('.company-nickname:eq(' + i + ')').text((data.jobs.job[i].company["detail"].name)) //회사명 변경
//                     }
//                     ;
//                 });
//
//             }
//         });

    //모달창의 지역정보를 관리하는 함수
    $.ajax({ //지역정보를 json데이터로 가져옴
        url: '../../../assets/data/location_data.json', //json데이터 주소
        type: 'get',
        dataType: 'json',
        success: function (data) {
            //json의 loc_mcd.name을 <div class="filter-select-wrapper" data-name="city"> </div> 안에
            //<div class="filter-select" data-value="서울">서울</div> 로 넣어야함
            //1차 지역 생성 함수
            $.each(data, function (index, obj) {
                for (let i = 0; i < data.loc.loc_mcd.length; i++) { //1차 지역 목록 생성
                    $('div[data-name="city"]').append( //데이터 삽입
                        '<div class="filter-select" onclick="deleteNot(this)" data-value="' + data.loc.loc_mcd[i].code + '">' + data.loc.loc_mcd[i].name + '</div>'
                    );
                }
                ;
            });

            //2차 지역 생성 함수
            $(".filter-select").click(function (event) {
                $('div[data-name="district"]').empty(); //생성된 2차 목록 비우고
                let temp = $(this).data('value'); //클릭한 1차 지역의 코드값을
                $.each(data, function (index, obj) { //반복문
                    for (let i = 0; i < data.loc.loc_bcd.length; i++) { //2차지역 총갯수만큼 돌면서
                        if (temp === parseInt(data.loc.loc_bcd[i].loc_mcd)) { //2차지역 코드와 일치하면
                            $('div[data-name="district"]').append( //일치하는 2차 지역값만큼 삽입
                                '<div class="filter-select" onclick="javascript:test(this)" data-group-value="' + data.loc.loc_bcd[i].loc_mcd + '" data-value="' + data.loc.loc_bcd[i].code + '">' + data.loc.loc_bcd[i].name + '</div>'
                            );
                        }
                        ;
                    }
                    ;
                });
                if ($(this).parent().data('name') === 'minPay' ||
                    $(this).parent().data('name') === 'academicBackground' ||
                    $(this).parent().data('name') === 'minCareer' ||
                    $(this).parent().data('name') === 'city' &&
                    // !$('div[class$="disabled"]')
                    $(this).parent().attr('class') != 'filter-select-wrapper disabled'
                ) { //부모 클래스가 data-name="city" 일때만
                    $(this).parent().children().prop('class', 'filter-select'); //클릭한 div의 동일레벨 div 클래스가 비활성화
                    $(this).prop('class', 'filter-select active'); //클릭한 div만 활성화 == 클릭한 옵션이 선택된다
                }
                ;
            });
        }
    });


    //모달창 내부 데이터 값(연봉, 학력, 경력 조건) 삽입하기 위한 함수
    $.ajax({ //saramin 각종 코드표를 담은 json데이터 호출
        url: '../../../assets/data/job_data.json', //json데이터 주소
        type: 'get',
        dataType: 'json',
        success: function (data) {
            $.each(data, function (index, obj) {
                for (let i = 0; i < data.jobInfo.salary.length; i++) { //연봉 목록 생성
                    $('div[data-name="minPay"]').append( //데이터 삽입
                        '<div class="filter-select" onclick="javascript:onClickToggle(this)" data-value="' + data.jobInfo.salary[i].code + '">' + data.jobInfo.salary[i].name + '</div>'
                    );
                }
                ;
                for (let i = 0; i < data.jobInfo.edu_lv.length; i++) { //학력조건 목록 생성
                    $('div[data-name="academicBackground"]').append( //데이터 삽입
                        '<div class="filter-select" onclick="javascript:onClickToggle(this)" data-value="' + data.jobInfo.edu_lv[i].code + '">' + data.jobInfo.edu_lv[i].name + '</div>'
                    );
                }
                ;
                for (let i = 0; i < data.jobInfo.exp_lv.length; i++) { //경력조건 목록 생성
                    $('div[data-name="minCareer"]').append( //데이터 삽입
                        '<div class="filter-select" onclick="javascript:onClickToggle(this)" data-value="' + data.jobInfo.exp_lv[i].code + '">' + data.jobInfo.exp_lv[i].name + '</div>'
                    );
                }
                ;

            });
        }
    });


    //모달창
//TODO 버튼 클릭시 해당 분류화면으로 팝업되게
    //버튼 누르면 모달창 뜨고
    $(".job-filter-btn").click(function () {
        $("#job-filter-modal").prop('class', ('contract'));
    });
    //x버튼 누르면 모달창 꺼짐
    $(".job-filter-close-btn").click(function () {
        $("#job-filter-modal").prop('class', ('contract off'));
    });

    //모달창 대분류 클릭시 활성화 , 비활성화
    $(".job-filter-modal-item-title").click(function (event) {
//1. top안의 동일레벨 div 클래스에 active제거
        $('.job-filter-modal-top').children().prop('class', 'job-filter-modal-item-title');

        //2. 클릭한 div 클래스에만 active 추가
        $(this).addClass('active');

        //3. job-filter-modal-body 안의 data-type!=null이면 class add off
        console.log($('.job-filter-modal-body > div[data-type!=""]'));
        $('.job-filter-modal-body > div[data-type!=""]').addClass('off');
        //4. 클릭한 data-type과 일치하는 job-filter-modal-body 안의 class off 삭제(job-filter-modal-item

        $('.job-filter-modal-body > div[data-type="' + $(this).data("type") + '"]').removeClass('off');
//


//
//             $(this).parent().children().prop('class', 'job-filter-modal-item-title'); //클릭한 div의 동일레벨 div 클래스가 비활성화
//             $(this).prop('class', 'job-filter-modal-item-title active');
//             $(this).parent().next().children().prop('class', 'job-filter-modal-item off');
//
//             if ($(this).data('type') != '') {
//                 // <div class="job-filter-modal-item" data-type="position">을 class="job-filter-modal-item"로 변경해야하는데
//                 //class="job-filter-modal-body" 밑의 job-filter-modal-item만 적용해야함
// //TODO 이부분 토글클래스 써서 줄여보기-추후
//                 //.job-filter-modal-body 하위 div 중 data-type="position"인 class명을 'job-filter-modal-item'로 변경해서 활성화 시킨다.
//                 $('.job-filter-modal-body > div[data-type="position"]').prop('class', 'job-filter-modal-item');
//             } else if ($(this).data('type') === 'pay') {
//                 $('.job-filter-modal-body > div[data-type="pay"]').prop('class', 'job-filter-modal-item');
//             } else if ($(this).data('type') === 'location') {
//                 $('.job-filter-modal-body > div[data-type="location"]').prop('class', 'job-filter-modal-item');
//             } else if ($(this).data('type') === 'extra') {
//                 $('.job-filter-modal-body > div[data-type="extra"]').prop('class', 'job-filter-modal-item');
//             }
//             ;
    });

    //급여항목 직접입력 클릭시 선택목록 비활성화 + 직접입력 input 활성화
    // $("#pay-self-checkbox").click(function () {
    //     $('div[data-name="minPay"]').toggleClass("disabled"); //최소연봉 wrapper 토글
    //     if ($('#pay-self-input').prop('disabled')) { //#pay-self-input박스에 disabled 속성 토글
    //         $('#pay-self-input').removeProp('disabled')
    //     } else {
    //         $('#pay-self-input').prop('disabled', 'disabled');
    //     }
    //     ;
    // });


    $(".filter-select").click(function (event) {
//TODO 이부분 토글클래스 써서 줄여보기-추후
        //선택한 옵션의 그룹아이디와 부모-형제의 그룹 요소값이 같지 않으면 클래스명 + off
        if ($(this).parent().data('name') === 'group') { //부모 클래스가 data-name="group" 일때만
            $(this).parent().children().prop('class', 'filter-select'); //클릭한 div의 동일레벨 div 클래스가 비활성화
            $(this).prop('class', 'filter-select active'); //클릭한 div만 활성화 == 클릭한 옵션이 선택된다
            console.log($(this).data('group-id'));
            $(this).parent().parent().children().prop('class', 'filter-select-wrapper off'); //모든 wrapper 비활성화
            $(this).parent().parent().children().first().prop('class', 'filter-select-wrapper'); //첫번째 wrapper(group) 활성화

            if ($(this).data('group-id') == '2') { //선택한 옵션만 활성화 //선택한 옵션(div)의 요소 data('group-id')가 1이라면
                $('div[data-group="2"]').prop('class', 'filter-select-wrapper') //요소 data('group-id')를 가지는 div의 클래스명을 변경
            } else if ($(this).data('group-id') == '14') {
                $('div[data-group="14"]').prop('class', 'filter-select-wrapper')
            } else if ($(this).data('group-id') == '15') {
                $('div[data-group="15"]').prop('class', 'filter-select-wrapper')
            } else if ($(this).data('group-id') == '16') {
                $('div[data-group="16"]').prop('class', 'filter-select-wrapper')
            }
        } else if ($(this).parent().prop('class') === 'filter-select-wrapper' &&
            $(this).parent().data('name') != '') {
            console.log($(this).text());


            // $(this).data('value')
            // <span class="filter-pill" data-name="jobDuty" data-value="11">풀스택개발<span class="filter-pill-delete">X</span></span>
//태그를 생성합니다
            let $span;
            let $subSpan = $('<span>', { //TODO wotkdydd
                class: "filter-pill-delete",
                onclick: "deletePill(this)",
                text: "X"
            });

            if ($(this).data("value") != $(this).parent().data('group')) { //일반 옵션의 태그 생성

                if ($('#position' + $(this).data("value")).text() == '') { //클릭옵션의 태그가 존재하지 않는다면
                    //$('#position'+$(this).data("value")).text() == ''
                    //position + 클릭한 div태그의 data-value값 조합을 가진 태그의 텍스트값이 '' 이라면 태그가 존재하지않는걸로 판단
                    $span = $('<span>', { //일반 옵션의 태그 생성
                        class: "filter-pill",
                        id: "position" + $(this).data("value"),
                        "data-value": $(this).data("value"),
                        "data-group-value": $(this).parent().data("group"),
                        "data-flag": $(this).parent().data("group"),
                        text: $(this).text()
                    });

                    $span.append($subSpan);
                    $(this).parent().parent().next().append($span);
                } else {//태그가 존재하니까 삭제
                    $('#position' + $(this).data("value")).remove();
                }
                /*$(this).parent().parent().next().append(
                        ' <span class="filter-pill" data-name="jobDuty" data-value=' + $(this).data("value") +
                        ' data-group-value=' + $(this).data("group-id") + '>' + $(this).text() +
                        '<span class="filter-pill-delete">X</span></span>'
                )*/
                console.log('태그 잘 담았어요');

                $('div[data-value="' + $(this).parent().data('group') + '"]').prop('class', 'filter-select'); //<전체> active 풀어주며 비활성화
                $('#position' + $(this).parent().data('group')).remove(); //<전체> 태그 삭제

            } else { //<전체> 태그 생성
                //$('#position'+$(this).parent().data('group')).remove();

                if ($('#position' + $(this).data("value")).text() == '') {
                    $('span[data-flag="' + $(this).parent().data("group") + '"]').remove(); //data-group의 값을 가진 모든 span(태그) 삭제

                    // $('div[class="filter-select-wrapper"][data-group="'+$(this).parent().data('group')+'"][data-name="jobDuty"]')
                    //         .children().prop('class','filter-select');
                    $(this).parent().children().prop('class', 'filter-select'); //동일한 레벨의 div를 모두 비활성화

                    $span = $('<span>', { //<전체>태그 생성
                        class: "filter-pill",
                        id: "position" + $(this).data("value"),
                        "data-name": "jobDuty",
                        "data-value": $(this).data("value"),
                        "data-flag": $(this).parent().data("group"),
                        text: $(this).text()
                    });
                    $span.append($subSpan);
                    $(this).parent().parent().next().append($span);
                } else {
                    $('#position' + $(this).parent().data('group')).remove();  //<전체> 태그 삭제
                }
                /*$(this).parent().parent().next().append( //'전체' 옵션의 태그 생성 (식별용 data-group-id 부여)
                        ' <span class="filter-pill" data-name="jobDuty" data-value=' + $(this).data("value") + '>'
                        + $(this).text() + '<span class="filter-pill-delete">X</span></span>'
                )*/
                console.log('<전체>태그 잘 담았어요');
            }

            // <li><a href="javascript:replyUpdate(1, "toootoo") class='edit'> <i class="fa fa-edit fa-fw"></i> 수정 </a></li>`
            // `<li><a href="javascript:replyUpdate(` + obj.rno + `,"` + obj.rcont + `") class='edit'><i class="fa fa-edit fa-fw"></i> 수정 </a></li>`
            // $(this).toggleClass("active");

        }
        ;
    });
});


//배열내의 특정 값 포함 여부 확인하는 함수(확인할 배열, 값)
function checkOverlapData(data, obj) {
    let overlapData;
    for (let i = 0; i < data.length; i++) {
        for (let j = 0; j < obj.length; j++) {
            if (data[i] == obj[j]) {
                overlapData = $(data[i]);
            }
        }
    }
    return overlapData; //null일때는 존재하는 데이터없음 == 일치하지않는다
};


//옵션 태그가 담겨있을 때 다른 1차지역을 선택하면 초기
function deleteNot(obj) {
    let locTagNode = $('div[data-type="location"] .filter-active-tags').children();
    let tagGroupData = [];
    for (let i = 0; i < locTagNode.length; i++) { //.반복문 돌며 존재하는 태그들의 value값을 담는다. (없으면 undi-나옴)
        tagGroupData.push($(locTagNode[i]).data('group-value'));
    }
    ;
    console.log(tagGroupData);

    if (locTagNode.length != 0) { //옵션 태그가 담겨있을 때 다른 1차지역을 선택하면 초기화
        if (checkOverlapData(tagGroupData, $(obj).data('value')) == null
            // ||$(obj).data('value') != locTagNode.children().first().data("group-value")
        ) { //선택한 데이터가 기존 태그와 다른 1차지역 분류 값을 갖고있다면
            alert("다른 지역 선택시 기존 선택이 초기화됩니다.")
            //$(obj).parent().children().prop('class', 'filter-select'); //클릭한 div의 동일레벨 div 클래스가 비활성화
            $('div[data-type="location"] .filter-active-tags').children().remove(); //태그창 싹 비우고
        }

    }
};

//2차 지역 //클래스명에 active를 토글방식으로 생성제거, tag 생성제거 하는 함수
function test(obj) {
    let locTagNode = $('div[data-type="location"] .filter-active-tags').children();
    //지역 태그값 추가, 제거에 필요한 변수
    //city안의 value 값을 먼저 확인하자.
    let cityData = [];
    // 1. $('div[data-name="city"]') 하위 div들의 value 데이터 수집
    let cityNode = $('div[data-name="city"]').children();
    for (let i = 0; i < cityNode.length; i++) {
        cityData.push($(cityNode[i]).attr('data-value'));
    }
    ;

    //신규태그 생성 및 중복태그의 제거하기위해


    // 1. filter-active-tags 하위 태그 데이터 수집

    let data = [];
    // 1. filter-active-tags 하위 태그 데이터 수집
    for (let i = 0; i < locTagNode.length; i++) { //.반복문 돌며 존재하는 태그들의 value값을 담는다. (없으면 undi-나옴)
        data.push($(locTagNode[i]).attr('data-value'));
    }
    ;


    // 1. data에  $(obj).data("value") 를 찾아
    const check = data.find(element => {
        return $(obj).data("value") == element
    });


    // 신규태그 생성 및 중복태그의 제거
    if ($(obj).data("value") === $(obj).data("group-value")) {   // <~전체> 옵션을 선택했다면 초기화
                                                                 // $('div[data-type="district"]').children().prop('class', 'filter-select');  //첫번째자식 = ~전체 // 를 비활성화
                                                                 // $('div[data-type="location"] .filter-active-tags').children().empty();
        console.log("여기 탔니?");
        $(obj).parent().children().prop('class', 'filter-select'); //클릭한 div의 동일레벨 div 클래스가 비활성화
        $('div[data-type="location"] .filter-active-tags').children().remove(); //태그창 싹 비우고

    } else { // 전체옵션 선택이 되어있을 때 일반 옵션을 선택했다면 초기화
        if ($('div[data-name="district"]').children().first().attr('class') === 'filter-select active') { //<~전체>옵션이 활성화=선택 되어있다면
            console.log('durldurudjlri!!')
            $(obj).parent().children().prop('class', 'filter-select'); //클릭한 div의 동일레벨 div 클래스가 비활성화
            $('div[data-type="location"] .filter-active-tags').children().remove(); //태그창 싹 비우고
        }
    }

    if (check === undefined) {   // 동일한 value값을 가진 태그가 없으면 생성
        $('div[data-type="location"] .filter-active-tags').append(
            ' <span class="filter-pill" data-name="district" data-group-value="' + $(obj).data("group-value") + '" data-value=' + $(obj).data("value") + '>' + $(obj).text() +

            '<span class="filter-pill-delete" onclick="deletePill(this)">X</span></span>'
        )
    } else { // 있으면 제거
        $('div[data-type="location"] .filter-active-tags')
            .children("span[data-name='district'][data-value='" + $(obj).data("value") + "']").remove();
    }
    $(obj).toggleClass("active"); //클릭시마다 active 토글하며 활/비활성화
};


//선택한 옵션(tag)값을 parameter에 담음(json에서 검색하기위해)
function search() {
    let edu_lv_select = ''; //선택한 학력 옵션
    let loc_cd_select = ''; //선택한 지역 옵션
    let exp_lv_select = ''; //선택한 경력 옵션
    let sal_cd_select = ''; //선택한 급여 옵션

    let job_mid_cd_select = ''; //선택한 1차직종 옵션
    let job_cd_select = ''; //선택한 2차직종 옵션 //2차-전체 선택시에는 1차직종값만 넘기고 그외 선택시에는 2차직종값만 넘김


    let jobTagNode = $('div[data-type="position"] .filter-active-tags').children(); //직종의 태그옵션임
    let locTagNode = $('div[data-type="location"] .filter-active-tags').children(); //지역의 태그옵션임

    //직종코드를 담음(전체 선택시엔 job_mid_cd가, 일반 옵션 선택시엔 job_cd가 넘어감)
    if (jobTagNode.attr('data-value') != jobTagNode.parent().attr('data-group')) { //전체가 아닌 다른 항목 선택시엔 2차직종 검색을 위한 값을 담고
        for (let i = 0; i < jobTagNode.length; i++) {
            let key = $(jobTagNode[i]).attr('data-value'); //태그의 data-value(검색할 값)
            job_cd_select = job_cd_select + key + ','; //value 차곡차곡
        }
        ;
    } else { //전체를 선택했을 때에는 선택한 옵션의 data-group-id="2"만 값으로 넘긴다. (1차직종검색을 위해)
        job_mid_cd_select = jobTagNode.data('group-value'); //TODO
    }
    console.log('job_cd_select= ' + job_cd_select + 'job_mid_cd_select= ' + job_mid_cd_select);

    //지역코드를 담음
    for (let i = 0; i < locTagNode.length; i++) {
        let key = $(locTagNode[i]).attr('data-value'); //태그의 data-value(검색할 값)
        loc_cd_select = loc_cd_select + key + ','; //value 차곡차곡
    }
    ;
    console.log('loc_cd_select= ' + loc_cd_select);

    //학력코드를 담음
    edu_lv_select = $('div[data-name="academicBackground"]').children('.filter-select.active').data('value');
    console.log('edu_lv_select= ' + edu_lv_select);

    //경력코드를 담음
    exp_lv_select = $('div[data-name="minCareer"]').children('.filter-select.active').data('value');
    console.log('exp_lv_select= ' + exp_lv_select);

    //급여코드를 담음
    sal_cd_select = $('div[data-name="minPay"]').children('.filter-select.active').data('value');
    console.log('sal_cd_select= ' + sal_cd_select);

    requestJobSearch(edu_lv_select, loc_cd_select, job_mid_cd_select, job_cd_select, exp_lv_select, sal_cd_select); //검색하는 함수로 담은 value값 넘겨주기
    $('#list-group-items-list-group').children().remove();
    $("#job-filter-modal").addClass('off'); //검색버튼 클릭하면 모달창 닫기
};

//data결과에 따라 for문을 돌며 list 생성하는 삼수
//     function appendJobData(data, index, obj) {
//         for (let i = 1; i < obj.job.length; i++) {
//
//
//             if (data.jobs.job[i]["url"] != null && data.jobs.job[i]["url"] != undefined) {
//                 console.log(obj.job.length);
//                 let url = data.jobs.job[i]["url"];
//                 let location = (data.jobs.job[i].position["location"].name);
//                 let title = data.jobs.job[i].position["title"];
//                 let salary = data.jobs.job[i]["salary"].name;
//                 let required_education_level = data.jobs.job[i].position["required-education-level"].name;
//                 let experience_level = data.jobs.job[i].position["experience-level"].name;
//                 let job_type = data.jobs.job[i].position["job-type"].name;
//                 let deadline = new Date((data.jobs.job[i]['expiration-timestamp']) * 1000)
//                 let href = data.jobs.job[i].company["detail"].href;
//                 let detailname = data.jobs.job[i].company["detail"].name;
//
//
//                let htmlfile =
//                         ` <li class="list-group-item-flex contract" style="display:none" id="list-group-items">
//                                     <div class="list-title-wrapper-flex">
//                                         <div class="list-position-info">
//                                             <div class="list-position-info-box list-position-info-title">
//                                                 <a class="title-link" href="` + url + `">
//                                                     <span class="position">` + location + `</span>
//                                                     <span class="project">` + title + `</span>
//                                                 </a>
//                                             </div>
//                                             <div class="list-position-info-wrapper">
//                                                 <div class="list-position-info-box">
//                                                     <div class="list-position-info-item">
//                                                         <i class="fa fa-krw" aria-hidden="true"></i>
//                                                         <target class="salary-name">` + salary + `</target>
//                                                     </div>
//                                                     <div class="list-position-info-item">
//                                                         <i class="fa fa-graduation-cap" aria-hidden="true"></i>
//                                                         <target class="required-education-level-name">` + required_education_level + `</target>
//                                                     </div>
//                                                 </div>
//                                                 <div class="list-position-info-box">
//                                                     <div class="list-position-info-item">
//                                                         <i class="fa fa-briefcase" aria-hidden="true"></i>
//                                                         <target class="experience-level-name">` + experience_level + `</target>
//                                                     </div>
//                                                     <div class="list-position-info-item">
//                                                         <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
//                                                         <target class="job-type-name">` + job_type + `</target>
//                                                     </div>
//                                                 </div>
//                                                 <div class="list-position-info-box">
//                                                     <div class="list-position-info-item">
//                                                         <i class="fa fa-map-marker" aria-hidden="true"></i>
//                                                         <target class="location-name">` + location + `</target>
//                                                     </div>
//                                                     <div class="list-position-info-item">
//                                                         <i class="fa fa-calendar-o" aria-hidden="true"></i>
//                                                         <target class="expiration-timestamp">마감일      ` + deadline.toLocaleDateString() + `</target>
//                                                     </div>
//                                                 </div>
//                                             </div>
//                                         </div>
//                                     </div>
//                                     <div class="list-company-info">
//                                         <a href="` + href + `" class="avatar-photo avatar-company">
//                                             <img src="https://file.okky.kr/logo/1500253256111.png">
//                                         </a>
//                                         <a class="company-nickname nickname" href="` + href + `">` + detailname + `</a>
//                                     </div>
//                                 </li>`;
//
//                 $("div#divParent > ul.list-group").append(htmlfile);
//
//             } else {
//                 console.log("slgigkklllgdddsfsfff")
//             }
//         }
//
//
//     }
//     ;


// let htmlfile =
//     ` <li class="list-group-item-flex contract" style="display:none" id="list-group-items">
//                                 <div class="list-title-wrapper-flex">
//                                     <div class="list-position-info">
//                                         <div class="list-position-info-box list-position-info-title">
//                                             <a class="title-link" href="` + url + `">
//                                                 <span class="position">` + positionlocation + `</span>
//                                                 <span class="project">` + title + `</span>
//                                             </a>
//                                         </div>
//                                         <div class="list-position-info-wrapper">
//                                             <div class="list-position-info-box">
//                                                 <div class="list-position-info-item">
//                                                     <i class="fa fa-krw" aria-hidden="true"></i>
//                                                     <target class="salary-name">` + salary + `</target>
//                                                 </div>
//                                                 <div class="list-position-info-item">
//                                                     <i class="fa fa-graduation-cap" aria-hidden="true"></i>
//                                                     <target class="required-education-level-name">` + required_education_level + `</target>
//                                                 </div>
//                                             </div>
//                                             <div class="list-position-info-box">
//                                                 <div class="list-position-info-item">
//                                                     <i class="fa fa-briefcase" aria-hidden="true"></i>
//                                                     <target class="experience-level-name">` + experience_level + `</target>
//                                                 </div>
//                                                 <div class="list-position-info-item">
//                                                     <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
//                                                     <target class="job-type-name">` + job_type + `</target>
//                                                 </div>
//                                             </div>
//                                             <div class="list-position-info-box">
//                                                 <div class="list-position-info-item">
//                                                     <i class="fa fa-map-marker" aria-hidden="true"></i>
//                                                     <target class="location-name">` + location + `</target>
//                                                 </div>
//                                                 <div class="list-position-info-item">
//                                                     <i class="fa fa-calendar-o" aria-hidden="true"></i>
//                                                     <target class="expiration-timestamp">마감일      ` + deadline + `</target>
//                                                 </div>
//                                             </div>
//                                         </div>
//                                     </div>
//                                 </div>
//                                 <div class="list-company-info">
//                                     <a href="` + href + `" class="avatar-photo avatar-company">
//                                         <img src="https://file.okky.kr/logo/1500253256111.png">
//                                     </a>
//                                     <a class="company-nickname nickname" href="` + href + `">` + detailname + `</a>
//                                 </div>
//                             </li>`;

// function appendJobData(data, index, obj) {
//     for (let i = 1; i < obj.job.length; i++) {
//
//
//         if (data.jobs.job[i]["url"] != null && data.jobs.job[i]["url"] != undefined) {
//             console.log(obj.job.length);
//             url = data.jobs.job[i]["url"];
//              location = (data.jobs.job[i].position["location"].name);
//              title = data.jobs.job[i].position["title"];
//              salary = data.jobs.job[i]["salary"].name;
//              required_education_level = data.jobs.job[i].position["required-education-level"].name;
//              experience_level = data.jobs.job[i].position["experience-level"].name;
//              job_type = data.jobs.job[i].position["job-type"].name;
//              deadline = new Date((data.jobs.job[i]['expiration-timestamp']) * 1000)
//              href = data.jobs.job[i].company["detail"].href;
//              detailname = data.jobs.job[i].company["detail"].name;
//
//
//
//
//             $("div#divParent > ul.list-group").append(htmlfile);
//
//         } else {
//             console.log("slgigkklllgdddsfsfff")
//         }
//     }
//
//
// }
// ;

//모달 선택한 옵션값을 data.jsp로 넘겨서 검색할 수 있게
function requestJobSearch(edu_lv, loc_cd, job_mid_cd, job_cd, exp_lv_select, sal_cd_select) { //이거 edu_lv, loc_cd, job_mid_cd, job_cd 다 따로 넘기는게 ㅁ자나? 아니면 변수에 담아서 한번에 옮겨야하나
    let totalData; //총 데이터 수
    let dataPerPage; //한 페이지에 나타낼 글 수
    let pageCount = 5; //페이징에 나타낼 페이지 수
    let globalCurrentPage = 1; //현재 페이지
    dataPerPage = $("#dataPerPage").val();

    let idxNum = ''; //index
    let url = ''; //공고문 url
    let positionlocation = ''; //근무지역
    let title = ''; //공고제목
    let salary = ''; //연봉
    let required_education_level = ''; //학력조건
    let experience_level = ''; //경력조건
    let job_type = ''; //근무형태(정규, 계약)
    let deadline = ''; //마감일
    let href = ''; //회사정보 url
    let detailname = ''; //회사명
    let jobType = ''; //근무방식

    edu_lv = String(edu_lv).replace("undefined", "");
    loc_cd = String(loc_cd).replace("undefined", "");
    job_mid_cd = String(job_mid_cd).replace("undefined", "2");
    job_cd = String(job_cd).replace("undefined", "");
    exp_lv_select = String(exp_lv_select).replace("undefined", "");
    sal_cd_select = String(sal_cd_select).replace("undefined", "");


    let data = "&job_mid_cd=" + job_mid_cd + '&job_cd=' + job_cd + "&edu_lv=" + edu_lv + "&loc_cd=" + loc_cd;
    let allData = '';
    if (location.href == 'http://localhost:8090/job.do?jobType=CONTRACT') {
        allData = 'job_type=2,3,4,5,6,7,8,9,10,11,12,13,14,15' + data;
    } else if (location.href == 'http://localhost:8090/job.do?jobType=FULLTIME') {
        allData = 'job_type=1' + data;
    }
    console.log(data);
    $.ajax({
        url: 'http://localhost:8090/jobData.do?',  //json데이터에 검색할 param담아서 요청
        type: 'get',
        dataType: 'json',
        // data: "job_mid_cd="+job_mid_cd + '&job_cd='+job_cd + "&edu_lv="+edu_lv + "&loc_cd="+loc_cd ,
        data: allData,
        success: function (data) {
            // console.log(data.jobs.job[0].position["experience-level"].code);
            //data길이만큼 돌면서 list를 출력하는 함수
            $.each(data, function (index, obj) {
                if (exp_lv_select != "" || sal_cd_select != "") { //경력이나 급여 조건을 선택했을 경우
                    console.log("경력이나 급여 조건을 선택했을 경우");
                    if (exp_lv_select != "" && sal_cd_select == "") { //경력조건만 선택했을 경우
                        for (let j = 1; j < 2; j++) {
                            for (let i = 1; i < obj.job.length; i++) {
                                console.log(String(exp_lv_select));
                                // console.log(String(data.jobs.job[j].position["experience-level"].code));

                                if (data.jobs.job[i]["url"] != null && data.jobs.job[i]["url"] != undefined
                                    && (exp_lv_select === String(data.jobs.job[i].position["experience-level"].code))) {
                                    console.log(obj.job.length);

                                    url = String(data.jobs.job[i]["url"]).replace('undefined', '미정');
                                    positionlocation = String(data.jobs.job[i].position["location"].name).replace('undefined', '미정');
                                    title = String(data.jobs.job[i].position["title"]).replace('undefined', '미정');
                                    salary = String(data.jobs.job[i]["salary"].name).replace('undefined', '미정');
                                    required_education_level = String(data.jobs.job[i].position["required-education-level"].name).replace('undefined', '미정');
                                    experience_level = String(data.jobs.job[i].position["experience-level"].name).replace('undefined', '미정');
                                    job_type = String(data.jobs.job[i].position["job-type"].name).replace('undefined', '미정');
                                    deadline = new Date((data.jobs.job[i]['expiration-timestamp']) * 1000)
                                    deadline = deadline.toLocaleDateString();
                                    href = String(data.jobs.job[i].company["detail"].href).replace('undefined', '미정');
                                    detailname = String(data.jobs.job[i].company["detail"].name).replace('undefined', '미정');
                                    idxNum = [i];
                                    let htmlfile =
                                        ` <li class="list-group-item-flex contract" style="display:none" id="list-group-items-` + idxNum + `">
                                    <div class="list-title-wrapper-flex">
                                        <div class="list-position-info">
                                            <div class="list-position-info-box list-position-info-title">
                                                <a class="title-link" href="` + url + `">
                                                    <span class="position">` + positionlocation + `</span>
                                                    <span class="project">` + title + `</span>
                                                </a>
                                            </div>
                                            <div class="list-position-info-wrapper">
                                                <div class="list-position-info-box">
                                                    <div class="list-position-info-item">
                                                        <i class="fa fa-krw" aria-hidden="true"></i>
                                                        <target class="salary-name">` + salary + `</target>
                                                    </div>
                                                    <div class="list-position-info-item">
                                                        <i class="fa fa-graduation-cap" aria-hidden="true"></i>
                                                        <target class="required-education-level-name">` + required_education_level + `</target>
                                                    </div>
                                                </div>
                                                <div class="list-position-info-box">
                                                    <div class="list-position-info-item">
                                                        <i class="fa fa-briefcase" aria-hidden="true"></i>
                                                        <target class="experience-level-name">` + experience_level + `</target>
                                                    </div>
                                                    <div class="list-position-info-item">
                                                        <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                        <target class="job-type-name">` + job_type + `</target>
                                                    </div>
                                                </div>
                                                <div class="list-position-info-box">
                                                    <div class="list-position-info-item">
                                                        <i class="fa fa-map-marker" aria-hidden="true"></i>
                                                        <target class="location-name">` + positionlocation + `</target>
                                                    </div>
                                                    <div class="list-position-info-item">
                                                        <i class="fa fa-map-marker" aria-hidden="true"></i>
                                                        <target class="expiration-timestamp">마감일      ` + deadline + `</target>
                                                    </div>
                                                </div>
                                                <div class="list-position-info-box">
                                                   
                                                    <div class="list-position-info-item">
                                                        <i class="fa fa-map-marker" aria-hidden="true"></i>
                                                        <target class="expiration-timestamp">마감일      \` + deadline + \`</target>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="list-company-info">
                                        <a href="` + href + `" class="avatar-photo avatar-company">
                                            <img src="https://file.okky.kr/logo/1500253256111.png">
                                        </a>
                                        <a class="company-nickname nickname" href="` + href + `">` + detailname + `</a>
                                    </div>
                                </li>`;

                                    console.log("경력조건만 선택했을 경우3");

                                    $("div#divParent > ul.list-group").append(htmlfile);

                                } else {
                                    console.log("slgigkklllgdddsfsfff")
                                }
                            }
                            ;
                        }


                        console.log("경력조건만 선택했을 경우");

                        // for (let j = 1; j < 100; j++) {
                        //
                        //     console.log(String(exp_lv_select));
                        //     console.log(String(data.jobs.job[j].position["experience-level"].code));
                        //     if (String(exp_lv_select) === String(data.jobs.job[j].position["experience-level"].code)) {
                        //         appendJobData(data, index, obj);
                        //         console.log("경력조건만 선택했을 경우");
                        //     }
                        //     console.log("경력조건만 선택했을 경우2");
                        // };
                        // console.log("경력조건만 선택했을 경우3");
                    } else if (exp_lv_select == "" && sal_cd_select != "") { //급여조건만 선택했을 경우

                        for (let j = 1; j < 2; j++) {
                            for (let i = 1; i < obj.job.length; i++) {

                                if (data.jobs.job[i]["url"] != null && data.jobs.job[i]["url"] != undefined
                                    && sal_cd_select === String(data.jobs.job[j]["salary"].code)) {
                                    console.log(obj.job.length);
                                    url = String(data.jobs.job[i]["url"]).replace('undefined', '미정');
                                    positionlocation = String(data.jobs.job[i].position["location"].name).replace('undefined', '미정');
                                    title = String(data.jobs.job[i].position["title"]).replace('undefined', '미정');
                                    salary = String(data.jobs.job[i]["salary"].name).replace('undefined', '미정');
                                    required_education_level = String(data.jobs.job[i].position["required-education-level"].name).replace('undefined', '미정');
                                    experience_level = String(data.jobs.job[i].position["experience-level"].name).replace('undefined', '미정');
                                    job_type = String(data.jobs.job[i].position["job-type"].name).replace('undefined', '미정');
                                    deadline = new Date((data.jobs.job[i]['expiration-timestamp']) * 1000)
                                    deadline = deadline.toLocaleDateString();
                                    href = String(data.jobs.job[i].company["detail"].href).replace('undefined', '미정');
                                    detailname = String(data.jobs.job[i].company["detail"].name).replace('undefined', '미정');
                                    idxNum = [i];
                                    let htmlfile =
                                        ` <li class="list-group-item-flex contract" style="display:none" id="list-group-items-` + idxNum + `">
                                    <div class="list-title-wrapper-flex">
                                        <div class="list-position-info">
                                            <div class="list-position-info-box list-position-info-title">
                                                <a class="title-link" href="` + url + `">
                                                    <span class="position">` + positionlocation + `</span>
                                                    <span class="project">` + title + `</span>
                                                </a>
                                            </div>
                                            <div class="list-position-info-wrapper">
                                                <div class="list-position-info-box">
                                                    <div class="list-position-info-item">
                                                        <i class="fa fa-krw" aria-hidden="true"></i>
                                                        <target class="salary-name">` + salary + `</target>
                                                    </div>
                                                    <div class="list-position-info-item">
                                                        <i class="fa fa-graduation-cap" aria-hidden="true"></i>
                                                        <target class="required-education-level-name">` + required_education_level + `</target>
                                                    </div>
                                                </div>
                                                <div class="list-position-info-box">
                                                    <div class="list-position-info-item">
                                                        <i class="fa fa-briefcase" aria-hidden="true"></i>
                                                        <target class="experience-level-name">` + experience_level + `</target>
                                                    </div>
                                                    <div class="list-position-info-item">
                                                        <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                        <target class="job-type-name">` + job_type + `</target>
                                                    </div>
                                                </div>
                                                <div class="list-position-info-box">
                                                    <div class="list-position-info-item">
                                                        <i class="fa fa-map-marker" aria-hidden="true"></i>
                                                        <target class="location-name">` + positionlocation + `</target>
                                                    </div>
                                                    <div class="list-position-info-item">
                                                        <i class="fa fa-calendar-o" aria-hidden="true"></i>
                                                        <target class="expiration-timestamp">마감일      ` + deadline + `</target>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="list-company-info">
                                        <a href="` + href + `" class="avatar-photo avatar-company">
                                            <img src="https://file.okky.kr/logo/1500253256111.png">
                                        </a>
                                        <a class="company-nickname nickname" href="` + href + `">` + detailname + `</a>
                                    </div>
                                </li>`;

                                    console.log("급여조건만 선택했을 경우3");

                                    $("div#divParent > ul.list-group").append(htmlfile);

                                } else {
                                    console.log("급여조건만")
                                }
                                console.log("급여조건만 선택했을 경우2");
                            }
                            ;
                        }
                        ;


                    } else { //경력, 급여 조건 둘다 선택했을 경우
                        for (let j = 1; j < 2; j++) {
                            for (let i = 1; i < obj.job.length; i++) {

                                if (data.jobs.job[i]["url"] != null && data.jobs.job[i]["url"] != undefined
                                    && sal_cd_select === String(data.jobs.job[j]["salary"].code)
                                    && exp_lv_select === String(data.jobs.job[i].position["experience-level"].code)) {
                                    console.log(obj.job.length);
                                    url = String(data.jobs.job[i]["url"]).replace('undefined', '미정');
                                    positionlocation = String(data.jobs.job[i].position["location"].name).replace('undefined', '미정');
                                    title = String(data.jobs.job[i].position["title"]).replace('undefined', '미정');
                                    salary = String(data.jobs.job[i]["salary"].name).replace('undefined', '미정');
                                    required_education_level = String(data.jobs.job[i].position["required-education-level"].name).replace('undefined', '미정');
                                    experience_level = String(data.jobs.job[i].position["experience-level"].name).replace('undefined', '미정');
                                    job_type = String(data.jobs.job[i].position["job-type"].name).replace('undefined', '미정');
                                    deadline = new Date((data.jobs.job[i]['expiration-timestamp']) * 1000)
                                    deadline = deadline.toLocaleDateString();
                                    href = String(data.jobs.job[i].company["detail"].href).replace('undefined', '미정');
                                    detailname = String(data.jobs.job[i].company["detail"].name).replace('undefined', '미정');
                                    idxNum = [i];
                                    let htmlfile =
                                        ` <li class="list-group-item-flex contract" style="display:none" id="list-group-items-` + idxNum + `">
                                    <div class="list-title-wrapper-flex">
                                        <div class="list-position-info">
                                            <div class="list-position-info-box list-position-info-title">
                                                <a class="title-link" href="` + url + `">
                                                    <span class="position">` + positionlocation + `</span>
                                                    <span class="project">` + title + `</span>
                                                </a>
                                            </div>
                                            <div class="list-position-info-wrapper">
                                                <div class="list-position-info-box">
                                                    <div class="list-position-info-item">
                                                        <i class="fa fa-krw" aria-hidden="true"></i>
                                                        <target class="salary-name">` + salary + `</target>
                                                    </div>
                                                    <div class="list-position-info-item">
                                                        <i class="fa fa-graduation-cap" aria-hidden="true"></i>
                                                        <target class="required-education-level-name">` + required_education_level + `</target>
                                                    </div>
                                                </div>
                                                <div class="list-position-info-box">
                                                    <div class="list-position-info-item">
                                                        <i class="fa fa-briefcase" aria-hidden="true"></i>
                                                        <target class="experience-level-name">` + experience_level + `</target>
                                                    </div>
                                                    <div class="list-position-info-item">
                                                        <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                        <target class="job-type-name">` + job_type + `</target>
                                                    </div>
                                                </div>
                                                <div class="list-position-info-box">
                                                    <div class="list-position-info-item">
                                                        <i class="fa fa-map-marker" aria-hidden="true"></i>
                                                        <target class="location-name">` + positionlocation + `</target>
                                                    </div>
                                                    <div class="list-position-info-item">
                                                        <i class="fa fa-calendar-o" aria-hidden="true"></i>
                                                        <target class="expiration-timestamp">마감일      ` + deadline + `</target>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="list-company-info">
                                        <a href="` + href + `" class="avatar-photo avatar-company">
                                            <img src="https://file.okky.kr/logo/1500253256111.png">
                                        </a>
                                        <a class="company-nickname nickname" href="` + href + `">` + detailname + `</a>
                                    </div>
                                </li>`;

                                    console.log("경력, 급여 조건 둘다 선택했을 경우     3");

                                    $("div#divParent > ul.list-group").append(htmlfile);

                                } else {
                                    console.log("경력, 급여 조건 둘다 선택했을 경우     2")
                                }
                                console.log("경력, 급여 조건 둘다 선택했을 경우     1");
                            }
                            ;
                        }
                        ;
                        console.log(" 경력, 급여 조건 둘다 선택했을 경우");
                    }

                } else if (exp_lv_select == '' && sal_cd_select == '') { //경력, 급여 조건 둘다 선택 안했을 경우
                    for (let j = 1; j < 2; j++) {
                        for (let i = 1; i < obj.job.length; i++) {

                            if (data.jobs.job[i]["url"] != null && data.jobs.job[i]["url"] != undefined) {
                                console.log(obj.job.length);
                                url = String(data.jobs.job[i]["url"]).replace('undefined', '미정');
                                positionlocation = String(data.jobs.job[i].position["location"].name).replace('undefined', '미정');
                                title = String(data.jobs.job[i].position["title"]).replace('undefined', '미정');
                                salary = String(data.jobs.job[i]["salary"].name).replace('undefined', '미정');
                                required_education_level = String(data.jobs.job[i].position["required-education-level"].name).replace('undefined', '미정');
                                experience_level = String(data.jobs.job[i].position["experience-level"].name).replace('undefined', '미정');
                                job_type = String(data.jobs.job[i].position["job-type"].name).replace('undefined', '미정');
                                deadline = new Date((data.jobs.job[i]['expiration-timestamp']) * 1000)
                                deadline = deadline.toLocaleDateString();
                                href = String(data.jobs.job[i].company["detail"].href).replace('undefined', '미정');
                                detailname = String(data.jobs.job[i].company["detail"].name).replace('undefined', '미정');
                                idxNum = [i];
                                let htmlfile =
                                    ` <li class="list-group-item-flex contract" style="display:none" id="list-group-items-` + idxNum + `">
                                    <div class="list-title-wrapper-flex">
                                        <div class="list-position-info">
                                            <div class="list-position-info-box list-position-info-title">
                                                <a class="title-link" href="` + url + `">
                                                    <span class="position">` + positionlocation + `</span>
                                                    <span class="project">` + title + `</span>
                                                </a>
                                            </div>
                                            <div class="list-position-info-wrapper">
                                                <div class="list-position-info-box">
                                                    <div class="list-position-info-item">
                                                        <i class="far fa-money-bill-alt" aria-hidden="true"></i>
                                                        <target class="salary-name">` + salary + `</target>
                                                    </div>
                                                    <div class="list-position-info-item">
                                                        <i class="fa fa-graduation-cap" aria-hidden="true"></i>
                                                        <target class="required-education-level-name">` + required_education_level + `</target>
                                                    </div>
                                                </div>
                                                <div class="list-position-info-box">
                                                    <div class="list-position-info-item">
                                                        <i class="fa fa-briefcase" aria-hidden="true"></i>
                                                        <target class="experience-level-name">` + experience_level + `</target>
                                                    </div>
                                                    <div class="list-position-info-item">
                                                        <i class="far fa-pencil" aria-hidden="true"></i>
                                                        <target class="job-type-name">` + job_type + `</target>
                                                    </div>
                                                </div>
                                                <div class="list-position-info-box">
                                                    <div class="list-position-info-item">
                                                        <i class="far fa-map-marker-alt" aria-hidden="true"></i>
                                                        <target class="location-name">` + positionlocation + `</target>
                                                    </div>
                                                    <div class="list-position-info-item">
                                                        <i class="far fa-calendar" aria-hidden="true"></i>
                                                        <target class="expiration-timestamp">마감일      ` + deadline + `</target>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="list-company-info">
                                        <a href="` + href + `" class="avatar-photo avatar-company">
                                            <img src="https://file.okky.kr/logo/1500253256111.png">
                                        </a>
                                        <a class="company-nickname nickname" href="` + href + `">` + detailname + `</a>
                                    </div>
                                </li>`;

                                console.log("경력, 급여 조건 둘다 선택안했을 경우     3");

                                $("div#divParent > ul.list-group").append(htmlfile);

                            } else {
                                console.log("경력, 급여 조건 둘다 선택안했을 경우     2")
                            }
                            console.log("경력, 급여 조건 둘다 선택안했을 경우     1");
                        }
                        ;
                    }
                    ;
                    console.log(" 경력, 급여 조건 둘다 선택안했을 경우");
                }

            });
            //총 road된 게시글 수
            totalData = $('.list-group').children().length;
            if (totalData == '') {
                alert("해당 조건에 조회되는 데이터가 존재하지 않습니다. \n 초기화면으로 돌아갑니다.")
                requestJobSearch('', '', "2", "", "", "");
            }
            console.log(totalData);


            displayData(1, dataPerPage); //1번째페이지, 한페이지에 나타낼 글 수=체크박스 val(기본-all)
            paging(totalData, dataPerPage, pageCount, 1);

            function paging(totalData, dataPerPage, pageCount, currentPage) {//총데이타, 체크박스 val, 페이징수(10), 현재페이지(1)
                console.log("currentPage : " + currentPage);

                // totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수
                totalPage = Math.ceil((totalData / dataPerPage) + ((totalData % dataPerPage) > 0 ? 1 : 0)); //총 페이지 수
                if (totalPage < pageCount) {
                    pageCount = totalPage;
                }
                console.log("totalPage : " + totalPage);
                let pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹
                console.log("pageGroup : " + pageGroup);
                let last = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
                console.log("last : " + last);
                if (last > totalPage) {
                    last = totalPage;
                }

                let first = last - (pageCount - 1); //화면에 보여질 첫번째 페이지 번호
                let next = last + 1;
                let prev = first - 1;

                let pageHtml = "";

                if (prev > 0) {
                    pageHtml += "<li lass='prev disabled'><a href='#' id='prev'> « </a></li>";
                    // pageHtml += "<li><a href='#' id='prev'> 이전 </a></li>";
                }

                //페이징 번호 표시
                for (var i = first; i <= last; i++) {
                    if (currentPage == i) {
                        pageHtml += "<li class='active'><a href='#' id='" + i + "'>" + i + "</a></li>";
                        // pageHtml +="<li class='on'><a href='#' id='" + i + "'>" + i + "</a></li>";
                    } else {
                        pageHtml += "<li><a href='#' id='" + i + "'>" + i + "</a></li>";
                    }
                }

                if (last < totalPage) {
                    pageHtml += "<li class=''><a href='#' id='next'> » </a></li>";
                    // pageHtml += "<li><a href='#' id='next'> 다음 </a></li>";
                }
                console.log($(".pagination.pagination-sm"));
                $(".pagination.pagination-sm").html(pageHtml);
                let displayCount = "";
                // 페이지를 나타냄
                // displayCount = "현재 1 - " + totalPage + " 페이지 / " + totalData + "건";
                // $("#displayCount").text(displayCount);


                //페이징 번호 클릭 이벤트
                $(".pagination.pagination-sm li a").click(function () {
                    let $id = $(this).attr("id");
                    selectedPage = $(this).text();
                    console.log("여기까지왔니");
                    console.log($id);
                    if ($id == "next") selectedPage = next;
                    if ($id == "prev") selectedPage = prev;

                    //전역변수에 선택한 페이지 번호를 담는다...
                    globalCurrentPage = selectedPage;
                    //페이징 표시 재호출
                    paging(totalData, dataPerPage, pageCount, selectedPage);
                    //글 목록 표시 재호출
                    displayData(selectedPage, dataPerPage);
                });
            }

            //현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
            function displayData(currentPage, dataPerPage) {
//모두-> 숫자로 값 변동이 일어난다면 내용 숨기고 몇번째~몇번째 display만 변경한느 형식,
                let chartHtml = "";
                $('.list-group-item-flex.contract').attr('style', ('display:none'));
//Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림..
                currentPage = Number(currentPage);
                dataPerPage = Number(dataPerPage);

                for (
                    var i = (currentPage - 1) * dataPerPage;
                    i < (currentPage - 1) * dataPerPage + dataPerPage;
                    i++
                ) {
                    //$('.list-group-item-flex.contract').attr('style', ('display:none'));

                    // console.log($('.list-group-item-flex.contract:eq(' + i + ')'));
                    // console.log($('.list-group-item-flex.contract:eq(' + i + ')').attr('style'));
                    // chartHtml +=
                    $('.list-group-item-flex.contract:eq(' + i + ')').attr('style', ('display:""'));
                    // console.log($('.list-group-item-flex.contract:eq(' + i + ')').attr('style'));
                    //     "<tr><td>" +
                    //     dataPerPage[i] +
                    //     "</td><td>" +
                    //     dataPerPage[i] +
                    //     "</td><td>" +
                    //     dataPerPage[i] +
                    //     "</td></tr>";
                }

            }

            $("#dataPerPage").change(function () {
                dataPerPage = $("#dataPerPage").val();
                //전역 변수에 담긴 globalCurrent 값을 이용하여 페이지 이동없이 글 표시개수 변경
                paging(totalData, dataPerPage, pageCount, globalCurrentPage);
                displayData(globalCurrentPage, dataPerPage);
            });

        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
            self.close();
        }
    });


}

