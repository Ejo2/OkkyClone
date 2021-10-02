<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/common/okky-head.jsp"/>
<body>
<div class="main">
	<jsp:include page="/WEB-INF/common/okky-aside.jsp"></jsp:include>
	<!----------------------------------------------------------------------------------------------->
	<%-- jobs의 세부카테고리 표기 nav
		<div class="sidebar-category-nav">
			<h3 class="sub-title">Jobs</h3>
			<ul class="nav">
				<li>
					<a href="/articles/recruit?filter.jobType=CONTRACT">구인 <span
							class="label label-primary label">계약직</span><span class="nav-indicator"><span
							class="nav-selected-dot"></span></span></a>
					<a href="/articles/recruit?filter.jobType=FULLTIME">구인 <span
							class="label label-success label">정규직</span><span class="nav-indicator"><span
							class="nav-selected-dot"></span></span></a>
				</li>
				<li><a href="/articles/resumes" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">구직</span>
					<span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
			</ul>
		</div>--%>
	<div id="list-article" class="content scaffold-list recruit-list" role="main">
		<div class="nav" role="navigation">
			<a class="create btn btn-success btn-wide pull-right" href="/articles/recruit/create">
				<i class="fa fa-pencil"></i> 구인 등록</a>

			<h4>구인</h4>
			<form id="category-filter-form" name="category-filter-form" method="get" action="/articles/recruit">
			</form>
			<div class="job-filter-container">
				<div class="job-filter-btns">
					<div class="job-filter-btn" data-type="position">포지션 및 스킬</div>
					<div class="job-filter-btn" data-type="pay">급여</div>
					<div class="job-filter-btn" data-type="location">지역</div>
					<div class="job-filter-btn" data-type="extra">기타 상세</div>
				</div>
				<div class="job-filter-search">
					<div class="input-group input-group-sm">
						<input type="search" name="query" id="search-field" class="form-control" placeholder="검색어"
						       value=""/>
						<span class="input-group-btn">
						<button class="btn btn-default" id="search-btn"><i class="fa fa-search"></i></button>
					</span>
					</div>
				</div>
			</div>
		</div>

		<!-- 공지사항 start -->
		<div class="okkys-choice">
			<div class="panel panel-default">
				<!-- Table -->
				<ul class="list-group">
					<li class="list-group-item list-group-item-question list-group-has-note clearfix">


						<div class="list-title-wrapper clearfix">
							<div class="list-tag clearfix">
								<span class="list-group-item-text article-id">#524319</span>
								<a href="/articles/notice" class="list-group-item-text item-tag label label-info"><i
										class="fa fa-comments"></i> 공지사항</a>


								<a href="/articles/tagged/OKKY"
								   class="list-group-item-text item-tag label label-gray ">OKKY</a>
								<a href="/articles/tagged/%EA%B5%AC%EC%9D%B8"
								   class="list-group-item-text item-tag label label-gray ">구인</a>
								<a href="/articles/tagged/Jobs"
								   class="list-group-item-text item-tag label label-gray ">Jobs</a>
								<a href="/articles/tagged/%ED%9A%8C%EC%82%AC"
								   class="list-group-item-text item-tag label label-gray ">회사</a>
								<a href="/articles/tagged/%EB%93%B1%EB%A1%9D"
								   class="list-group-item-text item-tag label label-gray ">등록</a>
							</div>

							<h5 class="list-group-item-heading list-group-item-evaluate">
								<a href="/article/524319">
									OKKY 구인 게시물 관련 공지사항
								</a>
							</h5>
						</div>

						<div class="list-summary-wrapper clearfix">
							<div class="list-group-item-summary clearfix">
								<ul>
									<li class=""><i class="item-icon fa fa-comment "></i> 4</li>
									<li class="">
										<i class="item-icon fa fa-thumbs-up"></i> 4
									</li>
									<li class=""><i class="item-icon fa fa-eye"></i> 36k</li>
								</ul>
							</div>

						</div>

						<div class="list-group-item-author clearfix">


							<div class="avatar clearfix avatar-list ">
								<a href="/user/info/45597" class='avatar-photo'><img
										src="//www.gravatar.com/avatar/b66da5ef6099211f5db8f5f7a3b4c36b?d=identicon&s=30"/></a>
								<div class="avatar-info">
									<a class="nickname" href="/user/info/45597" title="OKKY">OKKY</a>
									<div class="activity"><span class="fa fa-flash"></span> 2k</div>
									<div class="date-created"><span class="timeago" title="2018-11-22T14:15:18">2018-11-22 14:15:18</span>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<!-- 공지사항 end -->

		<div class="okkys-choice">
			<div class="panel panel-default recruit-panel">


				<ul class="list-group">
					<!-- Table -->
					<li class="list-group-item-flex contract" id="list-group-items" style="display:none;">
						<div class="list-title-wrapper-flex">
							<div class="list-position-info">
								<div class="list-position-info-box list-position-info-title">
									<a class="title-link" href="/recruit/1055976">
										<span class="position">근무지역 미정</span>
										<span class="project">공고제목</span>
									</a>
								</div>
								<div class="list-position-info-wrapper">
									<div class="list-position-info-box">
										<div class="list-position-info-item">
											<i class="fa fa-krw" aria-hidden="true"></i>
											<target class="salary-name">연봉 미정</target>
										</div>
										<div class="list-position-info-item">
											<i class="fa fa-graduation-cap" aria-hidden="true"></i>
											<target class="required-education-level-name">학력조건 미정</target>
										</div>
									</div>
									<div class="list-position-info-box">
										<div class="list-position-info-item">
											<i class="fa fa-briefcase" aria-hidden="true"></i>
											<target class="experience-level-name">경력조건 미정</target>
										</div>
										<div class="list-position-info-item">
											<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
											<target class="job-type-name">근무형태 미정</target>
										</div>
									</div>
									<div class="list-position-info-box">
										<div class="list-position-info-item">
											<i class="fa fa-map-marker" aria-hidden="true"></i>
											<target class="location-name">근무지역 미정</target>
										</div>
										<div class="list-position-info-item">
											<i class="fa fa-calendar-o" aria-hidden="true"></i>
											<target class="expiration-timestamp">마감일자 미정</target>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="list-company-info">
							<a href="/company/info/173" class="avatar-photo avatar-company">
								<img src="//file.okky.kr/logo/1500253256111.png">
							</a>
							<a class="company-nickname nickname" href="/company/info/173">회사명 비공개</a>
						</div>
					</li>
				</ul>

			</div>

			<div class="text-center">


			</div>
		</div>

		<!-- 모달창 start-->
		<div id="job-filter-modal" class="contract off">
			<div class="job-filter-modal-container">
				<div class="job-filter-modal-top">
					<div class="job-filter-modal-item-title active" data-type="position">포지션 및 스킬</div>
					<div class="job-filter-modal-item-title" data-type="pay">급여</div>
					<div class="job-filter-modal-item-title" data-type="location">지역</div>
					<div class="job-filter-modal-item-title" data-type="extra">기타 상세</div>
				</div>
				<div class="job-filter-modal-body">

					<div class="job-filter-modal-item" data-type="position">
						<div class="filter-item">
							<div class="filter-item-title">포지션</div>
							<div class="filter-item-content">
								<div class="filter-select-wrapper" data-name="group">
									<div class="filter-select active" data-group-id="2">IT개발·데이터</div>
									<div class="filter-select" data-group-id="14">마케팅·홍보·조사</div>
									<div class="filter-select" data-group-id="15">디자인</div>
									<div class="filter-select" data-group-id="16">기획·전략</div>

									<!-- 여기 filter-select은 토글기능X, 선택한 select만 active 추가   -->
								</div>
								<div class="filter-select-wrapper" data-group="2" data-name="jobDuty">
									<div class="filter-select" data-value="2" data-group-value="2">IT개발·데이터 전체</div>
									<div class="filter-select" data-value="84">백엔드/서버개발</div>
									<div class="filter-select" data-value="86">앱개발</div>
									<div class="filter-select" data-value="87">웹개발</div>
									<div class="filter-select" data-value="90">정보보안</div>
									<div class="filter-select" data-value="91">퍼블리셔</div>
									<div class="filter-select" data-value="92">프론트엔드</div>
									<div class="filter-select" data-value="95">DBA</div>
									<div class="filter-select" data-value="99">QA/테스터</div>
									<div class="filter-select" data-value="128">임베디드</div>
									<div class="filter-select" data-value="181">AI(인공지능)</div>
									<div class="filter-select" data-value="40">퍼블리셔</div>
									<div class="filter-select" data-value="7">QA</div>
									<!-- 여기 filter-select은 토글기능o,
										 부모  class="filter-select-wrapper" &
										 data-name="jobDuty"(not null)인 애들만    -->
								</div>
								<div class="filter-select-wrapper off" data-group="14" data-name="jobDuty">
									<div class="filter-select" data-value="14" data-group-value="14">마케팅·홍보·조사 전체</div>
									<div class="filter-select" data-value="1412">마케팅기획</div>
									<div class="filter-select" data-value="1425">디지털마케팅</div>
									<div class="filter-select" data-value="1452">그로스해킹</div>

								</div>
								<div class="filter-select-wrapper off" data-group="15" data-name="jobDuty">
									<div class="filter-select" data-value="15" data-group-value="15">디자인 전체</div>
									<div class="filter-select" data-value="1477">게임디자인</div>
									<div class="filter-select" data-value="1499">앱디자인</div>
									<div class="filter-select" data-value="1502">웹디자인</div>
									<div class="filter-select" data-value="1529">UI/UX디자인</div>
								</div>
								<div class="filter-select-wrapper off" data-group="16" data-name="jobDuty">
									<div class="filter-select" data-value="16" data-group-value="16">기획·전략 전체</div>
									<div class="filter-select" data-value="1624">게임기획</div>
									<div class="filter-select" data-value="1636">앱기획</div>
									<div class="filter-select" data-value="1637">웹기획</div>
									<div class="filter-select" data-value="1649">PM</div>
									<div class="filter-select" data-value="1690">UI/UX</div>
									<div class="filter-select" data-value="1633">사업기획</div>
									<div class="filter-select" data-value="1635">서비스기획</div>
								</div>
							</div>
							<div class="filter-active-tags"></div>
						</div>

						<!--삭제-->
						<%--						<div class="filter-item">--%>
						<%--							<div class="filter-item-title">직책</div>--%>
						<%--							<div class="filter-item-content">--%>
						<%--								<div class="filter-select-wrapper filter-select-minimize" data-name="rank">--%>
						<%--									<div class="filter-select" data-value="0">PM</div>--%>
						<%--									<div class="filter-select" data-value="1">PL</div>--%>
						<%--									<div class="filter-select" data-value="2">팀장</div>--%>
						<%--									<div class="filter-select" data-value="3">팀원</div>--%>
						<%--								</div>--%>
						<%--							</div>--%>
						<%--						</div>--%>
						<div class="filter-item">
							<div class="filter-item-title">스킬</div> <!--가능할지도.. -->
							<div class="filter-item-content">
								<input type="text" name="filter.skill" required="required" value=""
								       placeholder="스킬을 입력해주세요." class="form-control tag-input form-dynamic">
							</div>
						</div>
					</div>
					<!--삭제-->

					<!-- 연봉조건 -->
					<div class="job-filter-modal-item off" data-type="pay">
						<div class="filter-item">
							<div class="filter-item-title">최소연봉</div>
							<div class="filte-item-content flow-wrap">
								<div class="filter-select-wrapper" data-name="minPay" id="minPay">

								</div>
<%--								<div class="filter-input-wrapper">--%>
<%--									<div class="filter-input-line">--%>
<%--		필요없는듯								<input type="checkbox" id="pay-self-checkbox">--%>
<%--										<label for="pay-self-checkbox" style="font-weight: bold">직접입력</label>--%>
<%--									</div>--%>
<%--									<div class="filter-input-line">--%>
<%--										<input type="number" id="pay-self-input" disabled>--%>
<%--										<label>만 이상</label>--%>
<%--									</div>--%>
<%--								</div>--%>
							</div>
						</div>
					</div>

					<!-- 근무지역 -->
					<div class="job-filter-modal-item off" data-type="location">
						<div class="filter-item">
							<div class="filter-item-content">
								<div class="filter-select-wrapper" data-name="city">
									<div class="filter-select" data-value="">전체</div>
								</div>
								<div class="filter-select-wrapper" data-name="district">
									<div class="filter-select" data-city="전체" data-value="">전체</div>
								</div>
							</div>
							<div class="filter-active-tags"></div>
						</div>
					</div>

					<!-- 경력조건 -->
					<div class="job-filter-modal-item off" data-type="extra" >
						<div class="filter-item-wrapper">
							<div class="filter-item">
								<div class="filter-item-title">경력</div>
								<div class="filter-item-content">
									<div class="filter-select-wrapper" data-name="minCareer" data-value="" id="minCareer">

									</div>
								</div>
							</div>

							<!-- 학력조건 -->
							<div class="filter-item">
								<div class="filter-item-title">학력</div>
								<div class="filter-item-content">
									<div class="filter-select-wrapper" data-name="academicBackground" id="academicBackground">

									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
				<div class="job-filter-modal-bottom">
					<div id="job-filter-modal-reset"><i class="fa fa-repeat" aria-hidden="true"></i>&nbsp;선택초기화</div>
					<div id="job-filter-modal-confirm" onclick="search()">검 색</div>
				</div>
				<div class="job-filter-close-btn"><i class="fa fa-times" aria-hidden="true" style="color:#8A8A8A;"></i>
				</div>
			</div>
		</div>

	</div>
	<!----------------------------------------------------------------------------------------------->
	<jsp:include page="/WEB-INF/common/okky-footer.jsp"></jsp:include>
</div>
</body>
<script>
    let contextPath = "";
    let encodedURL = "%2Farticles%2Fquestions";
</script>
<script src="assets/js/application.js" type="text/javascript"></script>
<script src="assets/js/search.js" type="text/javascript"></script>
<script>
    $(function () {
        $('.category-sort-link').click(function (e) {
            $('#category-sort-input').val($(this).data('sort'));
            $('#category-order-input').val($(this).data('order'));
            e.preventDefault();
            $('#category-filter-form')[0].submit();
        });
    });
</script>

<script type="text/javascript">

    requestJobSearch(""); //초기화면 셋팅 //TODO 개발자 cd로 값 셋팅하기
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
                            '<div class="filter-select" data-value="' + data.loc.loc_mcd[i].code + '">' + data.loc.loc_mcd[i].name + '</div>'
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
                    ) { //부모 클래스가 data-name="city" 일때만 //TODO disabled 걸리면 실행 안되게 수정
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
                            '<div class="filter-select" data-value="' + data.jobInfo.salary[i].code + '">' + data.jobInfo.salary[i].name + '</div>'
                        );
                    }
                    ;
                    for (let i = 0; i < data.jobInfo.edu_lv.length; i++) { //학력조건 목록 생성
                        $('div[data-name="academicBackground"]').append( //데이터 삽입
                            '<div class="filter-select" data-value="' + data.jobInfo.edu_lv[i].code + '">' + data.jobInfo.edu_lv[i].name + '</div>'
                        );
                    }
                    ;
                    for (let i = 0; i < data.jobInfo.exp_lv.length; i++) { //경력조건 목록 생성
                        $('div[data-name="minCareer"]').append( //데이터 삽입
                            '<div class="filter-select" data-value="' + data.jobInfo.exp_lv[i].code + '">' + data.jobInfo.exp_lv[i].name + '</div>'
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
            $(this).parent().children().prop('class', 'job-filter-modal-item-title'); //클릭한 div의 동일레벨 div 클래스가 비활성화
            $(this).prop('class', 'job-filter-modal-item-title active');
            $(this).parent().next().children().prop('class', 'job-filter-modal-item off');

            if ($(this).data('type') === 'position') {
                // <div class="job-filter-modal-item" data-type="position">을 class="job-filter-modal-item"로 변경해야하는데
                //class="job-filter-modal-body" 밑의 job-filter-modal-item만 적용해야함
//TODO 이부분 토글클래스 써서 줄여보기-추후
                //.job-filter-modal-body 하위 div 중 data-type="position"인 class명을 'job-filter-modal-item'로 변경해서 활성화 시킨다.
                $('.job-filter-modal-body > div[data-type="position"]').prop('class', 'job-filter-modal-item');
            } else if ($(this).data('type') === 'pay') {
                $('.job-filter-modal-body > div[data-type="pay"]').prop('class', 'job-filter-modal-item');
            } else if ($(this).data('type') === 'location') {
                $('.job-filter-modal-body > div[data-type="location"]').prop('class', 'job-filter-modal-item');
            } else if ($(this).data('type') === 'extra') {
                $('.job-filter-modal-body > div[data-type="extra"]').prop('class', 'job-filter-modal-item');
            }
            ;
        });
//TODO 비활성화 안됨
        //급여항목 직접입력 클릭시 선택목록 비활성화 + 직접입력 input 활성화
        $("#pay-self-checkbox").click(function () {
            $('div[data-name="minPay"]').toggleClass("disabled"); //최소연봉 wrapper 토글
            if ($('#pay-self-input').prop('disabled')) { //#pay-self-input박스에 disabled 속성 토글
                $('#pay-self-input').removeProp('disabled')
            } else {
                $('#pay-self-input').prop('disabled', 'disabled');
            }
            ;
        });


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
                //TODO 다시 클릭하면 tag사라지게, 지역에도 tag추가
                //TODO <span class="filter-pill-delete">X</span></span>' 버튼 클릭시 태그 사라지게
                // $(this).data('value')
                // <span class="filter-pill" data-name="jobDuty" data-value="11">풀스택개발<span class="filter-pill-delete">X</span></span>
//태그를 생성합니다
                let $span;
                let $subSpan = $('<span>', { //TODO wotkdydd
                    class: "filter-pill-delete",
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

                $(this).toggleClass("active");

            }
            ;
        });

    });


    /*   <div class="filter-select-wrapper" data-name="district">
		   <div class="filter-select active" onclick="javascript:test(this)" data-value="103000">광주전체</div>
		   <div class="filter-select active" onclick="javascript:test(this)" data-value="103010">광산구</div>
		   <div class="filter-select active" onclick="javascript:test(this)" data-value="103020">남구</div>
		   <div class="filter-select active" onclick="javascript:test(this)" data-value="103030">동구</div>
		   <div class="filter-select active" onclick="javascript:test(this)" data-value="103040">북구</div>
		   <div class="filter-select active" onclick="javascript:test(this)" data-value="103050">서구</div>
	   </div>*/

    //2차 지역 //클래스명에 active를 토글방식으로 생성제거, tag 생성제거 하는 함수
    function test(obj) {
        //city안의 value 값을 먼저 확인하자.
        let cityData = [];
        // 1. $('div[data-name="city"]') 하위 div들의 value 데이터 수집
        let cityNode = $('div[data-name="city"]').children();

        for (let i = 0; i < cityNode.length; i++) {
            cityData.push($(cityNode[i]).attr('data-value'));
        }
        ;
        // 1. data에  $(obj).data("value") 를 찾아


        //신규태그 생성 및 중복태그의 제거하기위해
        let tagValueData = [];
        let tagGroupData = [];
        // 1. filter-active-tags 하위 태그 데이터 수집

        let data = [];
        // 1. filter-active-tags 하위 태그 데이터 수집
        let locTagNode = $('div[data-type="location"] .filter-active-tags').children();

        for (let i = 0; i < locTagNode.length; i++) { //.반복문 돌며 존재하는 태그들의 value값을 담는다. (없으면 undi-나옴)
            data.push($(locTagNode[i]).attr('data-value'));
        }
        ;

        for (let i = 0; i < locTagNode.length; i++) { //.반복문 돌며 존재하는 태그들의 value값을 담는다. (없으면 undi-나옴)
            tagGroupData.push($(locTagNode[i]).data('group-value'));
        }
        ;

        // 1. data에  $(obj).data("value") 를 찾아
        const check = data.find(element => {
            return $(obj).data("value") == element
        });

// function checkOverlapData(obj) {
//     let overlapData; //현재 담겨있는 태그가 상위도시의 값과 일치한다면 ==
//     for (let i = 0; i < cityData.length; i++) {
//         for (let j = 0; j < obj.length; j++) {
//             if (cityData[i] == obj[j]) {
//                 overlapData = $(cityData[i]);
//             }
//         }
//     }
//     return overlapData;
// }

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
            return overlapData; //null일때는 존재하는 데이터 x == 일치하지않는다
        }

        //신규태그 생성 및 중복태그의 제거
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
        console.log(locTagNode + "야야" + tagGroupData + "야야야야" + data + "qudtsldk" + $(obj).data('group'));

        if (locTagNode != null) { //옵션 태그가 담겨있을 때 다른 1차지역을 선택하면 초기화 //TODO 알림창 띄워주기 2차지역 active있을때 1차지역 클릭시? 아 모른게따~~~
            console.log(locTagNode.children().first().data("group-value"));
            if (checkOverlapData(tagGroupData, $(obj).data('group-value')) == null
                // ||$(obj).data('value') != locTagNode.children().first().data("group-value")
            ) { //선택한 데이터가 기존 태그와 다른 1차지역 분류 값을 갖고있다면
                console.log("d11--0-f-" + checkOverlapData(tagGroupData, $(obj).data('group-value')))
                //$(obj).parent().children().prop('class', 'filter-select'); //클릭한 div의 동일레벨 div 클래스가 비활성화
                $('div[data-type="location"] .filter-active-tags').children().remove(); //태그창 싹 비우고
            }

        }

        $(obj).toggleClass("active"); //클릭시마다 active 토글하며 활/비활성화

        //신규태그 생성 및 중복태그의 제거
        if (check === undefined) {   // 동일한 value값을 가진 태그가 없으면 생성
            $('div[data-type="location"] .filter-active-tags').append(
                ' <span class="filter-pill" data-name="district" data-group-value="' + $(obj).data("group-value") + '" data-value=' + $(obj).data("value") + '>' + $(obj).text() +

                '<span class="filter-pill-delete">X</span></span>'
            )
        } else { // 있으면 제거
            $('div[data-type="location"] .filter-active-tags')
                .children("span[data-name='district'][data-value='" + $(obj).data("value") + "']").remove();
        }

        console.log($('div[data-name="city"]').children());
        console.log($(obj).data("value"));

        //data 배열에 cityData배열에 있는 값 중 중복이 있는지

        //전체가 선택되어있을때 다른 옵션을 선택한다면 <전체>옵션을 비활성화, 태그 제거
        //다른 옵션이 선택되어있을 때 전체옵션을 선택한다면 다른 모든 옵션 비활성화, 태그 제거
        //선택한 옵션이 <전체>를 가르키는 옵션이다 == city 안에 들어있는 div들 중 하나와 같은 value값을 가진다


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
            };
        } else { //전체를 선택했을 때에는 선택한 옵션의 data-group-id="2"만 값으로 넘긴다. (1차직종검색을 위해)
            job_mid_cd_select = jobTagNode.data('group-value'); //TODO
        }
        console.log('job_cd_select= ' + job_cd_select + 'job_mid_cd_select= ' + job_mid_cd_select);

        //지역코드를 담음
        for (let i = 0; i < locTagNode.length; i++) {
            let key = $(locTagNode[i]).attr('data-value'); //태그의 data-value(검색할 값)
            loc_cd_select = loc_cd_select + key + ','; //value 차곡차곡
        };
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
        $("#job-filter-modal").addClass('off'); //검색버튼 클릭하면 모달창 닫기
    };


    //모달 선택한 옵션값을 data.jsp로 넘겨서 검색할 수 있게
    function requestJobSearch(edu_lv, loc_cd, job_mid_cd, job_cd, exp_lv_select, sal_cd_select) { //이거 edu_lv, loc_cd, job_mid_cd, job_cd 다 따로 넘기는게 ㅁ자나? 아니면 변수에 담아서 한번에 옮겨야하나
    //function requestJobSearch(param) { //이거 edu_lv, loc_cd, job_mid_cd, job_cd 다 따로 넘기는게 ㅁ자나? 아니면 변수에 담아서 한번에 옮겨야하나
//        console.log(parameter); //받은 data-value(검색할 값) 확인
     //   console.log(param);
	    //TODO null, undi시 공백 처리
        console.log(edu_lv+ loc_cd+ job_mid_cd+ job_cd);
        let Adata = "job_mid_cd="+job_mid_cd + '&job_cd='+job_cd + "&edu_lv="+edu_lv + "&loc_cd="+loc_cd ;
        console.log('Adata= ' + Adata);
        var allData = { "job_mid_cd": job_mid_cd, "job_cd": job_cd, "edu_lv": edu_lv, "loc_cd": loc_cd };
        var adata = Adata.replace("undefined", "");
        console.log('adata= ' + adata);
        var param = "&count=110&";
	        param += "job_mid_cd="+job_mid_cd;
        param += '&job_cd='+job_cd;
        param += "&edu_lv="+edu_lv;
        param += "&loc_cd="+loc_cd ;
        console.log(Adata)
        $.ajax({
          //  url: 'http://localhost:8090/jobData.do?data=' + edu_lv + loc_cd + job_mid_cd + job_cd, //json데이터에 검색할 param담아서 요청
	      url: 'http://localhost:8090/jobData.do?',  //json데이터에 검색할 param담아서 요청
            type: 'get',
            dataType: 'json',
	       // data: "job_mid_cd="+job_mid_cd + '&job_cd='+job_cd + "&edu_lv="+edu_lv + "&loc_cd="+loc_cd ,
           data: adata,
            success: function (data) {
                //data길이만큼 돌면서 list를 출력하는 함수

	            //TODO 급여, 경력조건은 여기서 필터링
				console.log(exp_lv_select);
				console.log(sal_cd_select);
if (exp_lv_select != null){
	$.each(data, function (index, obj) {
		for (let i = 1; i < obj.job.length; i++) {

			if(data.jobs.job[i]["url"] != null){
				$(".list-group").append($('#list-group-items').attr('style', ('display:""'))); //list 생성
				$('#list-group-items:eq(0)').attr('style', ('display:none')); //첫번째 공고 숨김

				$('.title-link:eq(' + i + ')').attr('href', (data.jobs.job[i]["url"])); //타이틀 링크 변경
				$('.position:eq(' + i + ')').text((data.jobs.job[i].position["location"].name).replace("&gt;", ">")); //지역
				$('.project:eq(' + i + ')').text(data.jobs.job[i].position["title"]); //공고제목
				$('.salary-name:eq(' + i + ')').text(data.jobs.job[i]["salary"].name); //연봉
				$('.required-education-level-name:eq(' + i + ')').text(data.jobs.job[i].position["required-education-level"].name); //학력
				$('.experience-level-name:eq(' + i + ')').text(data.jobs.job[i].position["experience-level"].name); //경력
				$('.location-name:eq(' + i + ')').text((data.jobs.job[i].position["location"].name).replace("&gt;", ">")); //지역
				$('.job-type-name:eq(' + i + ')').text(data.jobs.job[i].position["job-type"].name); //근무형태
				let deadline = new Date((data.jobs.job[i]['expiration-timestamp']) * 1000);
				$('.expiration-timestamp:eq(' + i + ')').text('마감일   ' + deadline.toLocaleDateString()); //마감일
				$('.list-company-info:eq(' + i + ') a').attr('href', (data.jobs.job[i].company["detail"].href)) //회사 링크 변경
				$('.company-nickname:eq(' + i + ')').text((data.jobs.job[i].company["detail"].name)) //회사명 변경
			}

		};
	});

}


            },
            error:function(jqXHR, textStatus, errorThrown){
                alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
                self.close();
            }
        });

    }

</script>


</html>

