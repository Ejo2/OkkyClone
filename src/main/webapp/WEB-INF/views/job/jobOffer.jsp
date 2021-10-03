<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/common/okky-head.jsp"/>
<body>
<div class="main">
	<jsp:include page="/WEB-INF/common/okky-aside.jsp"></jsp:include>
	<!----------------------------------------------------------------------------------------------->
	<%--	jobs의 세부카테고리 표기 nav--%>
	<div class="sidebar-category-nav">
		<h3 class="sub-title">Jobs</h3>
		<ul class="nav">
			<li>
				<a href="/job.do?jobType=CONTRACT">구인 <span
						class="label label-primary label">계약직</span><span class="nav-indicator"><span
						class="nav-selected-dot"></span></span></a>
				<a href="/job.do?jobType=FULLTIME">구인 <span
						class="label label-success label">정규직</span><span class="nav-indicator"><span
						class="nav-selected-dot"></span></span></a>
			</li>
<%--			<li><a href="/articles/resumes" class="link"><span--%>
<%--					class="nav-sidebar-label nav-sidebar-category-label">구직</span>--%>
<%--				<span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>--%>
		</ul>
	</div>
	<style>
        #dataPerPage { /*지혜 페이지사이즈 css 추가*/
            border: 1px solid #dfdfdf;
            padding: 5px 10px;
            font-size: 13px;
        }
	</style>
	<div id="list-article" class="content scaffold-list recruit-list" role="main">
		<div class="nav" role="navigation">
			<a class="create btn btn-success btn-wide pull-right" href="https://www.saramin.co.kr/">
				</i>더 많은 구인정보 확인하기</a>

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
					<select id="dataPerPage">
						<option value="10">10개씩보기</option>
						<option value="15">15개씩보기</option>
						<option value="20">20개씩보기</option>
					</select>
				</div>
			</div>
		</div>

		<!-- 공지사항 start -->
		<div class="okkys-choice">
			<div class="panel panel-default" style="display:none;>
                <!-- Table -->
                <ul class="list-group">
			<%--                    <li class="list-group-item list-group-item-question list-group-has-note clearfix">--%>


			<%--                        <div class="list-title-wrapper clearfix">--%>
			<%--                            <div class="list-tag clearfix">--%>
			<%--                                <span class="list-group-item-text article-id">#524319</span>--%>
			<%--                                <a href="/articles/notice" class="list-group-item-text item-tag label label-info"><i--%>
			<%--                                        class="fa fa-comments"></i> 공지사항</a>--%>


			<%--                                <a href="/articles/tagged/OKKY"--%>
			<%--                                   class="list-group-item-text item-tag label label-gray ">OKKY</a>--%>
			<%--                                <a href="/articles/tagged/%EA%B5%AC%EC%9D%B8"--%>
			<%--                                   class="list-group-item-text item-tag label label-gray ">구인</a>--%>
			<%--                                <a href="/articles/tagged/Jobs"--%>
			<%--                                   class="list-group-item-text item-tag label label-gray ">Jobs</a>--%>
			<%--                                <a href="/articles/tagged/%ED%9A%8C%EC%82%AC"--%>
			<%--                                   class="list-group-item-text item-tag label label-gray ">회사</a>--%>
			<%--                                <a href="/articles/tagged/%EB%93%B1%EB%A1%9D"--%>
			<%--                                   class="list-group-item-text item-tag label label-gray ">등록</a>--%>
			<%--                            </div>--%>

			<%--                            <h5 class="list-group-item-heading list-group-item-evaluate">--%>
			<%--                                <a href="/article/524319">--%>
			<%--                                    OKKY 구인 게시물 관련 공지사항--%>
			<%--                                </a>--%>
			<%--                            </h5>--%>
			<%--                        </div>--%>

			<%--                        <div class="list-summary-wrapper clearfix">--%>
			<%--                            <div class="list-group-item-summary clearfix">--%>
			<%--                                <ul>--%>
			<%--                                    <li class=""><i class="item-icon fa fa-comment "></i> 4</li>--%>
			<%--                                    <li class="">--%>
			<%--                                        <i class="item-icon fa fa-thumbs-up"></i> 4--%>
			<%--                                    </li>--%>
			<%--                                    <li class=""><i class="item-icon fa fa-eye"></i> 36k</li>--%>
			<%--                                </ul>--%>
			<%--                            </div>--%>

			<%--                        </div>--%>

			<%--                        <div class="list-group-item-author clearfix">--%>


			<%--                            <div class="avatar clearfix avatar-list ">--%>
			<%--                                <a href="/user/info/45597" class='avatar-photo'><img--%>
			<%--                                        src="//www.gravatar.com/avatar/b66da5ef6099211f5db8f5f7a3b4c36b?d=identicon&s=30"/></a>--%>
			<%--                                <div class="avatar-info">--%>
			<%--                                    <a class="nickname" href="/user/info/45597" title="OKKY">OKKY</a>--%>
			<%--                                    <div class="activity"><span class="fa fa-flash"></span> 2k</div>--%>
			<%--                                    <div class="date-created"><span class="timeago" title="2018-11-22T14:15:18">2018-11-22 14:15:18</span>--%>
			<%--                                    </div>--%>
			<%--                                </div>--%>
			<%--                            </div>--%>
			<%--                        </div>--%>
			<%--                    </li>--%>
			</ul>
		</div>
	</div>
	<!-- 공지사항 end -->


	<!-- 게시물 start -->
	<div class="okkys-choice">
		<div id="divParent" class="panel panel-default recruit-panel">
			<ul class="list-group" id="list-group-items-list-group">
				<!-- 게시물 1건씩 로드됨 -->
			</ul>
		</div>
		<div class="text-center">
		</div>
	</div>
	<!-- 게시물 end -->

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

<%--					<div class="filter-item">--%>
<%--						<div class="filter-item-title">스킬</div> <!--가능할지도.. -->--%>
<%--						<div class="filter-item-content">--%>
<%--							<input type="text" name="filter.skill" required="required" value=""--%>
<%--							       placeholder="스킬을 입력해주세요." class="form-control tag-input form-dynamic">--%>
<%--						</div>--%>
<%--					</div>--%>
				</div>
				<!--삭제-->

				<!-- 연봉조건 -->
				<div class="job-filter-modal-item off" data-type="pay">
					<div class="filter-item">
						<div class="filter-item-title">최소연봉</div>
						<div class="filte-item-content flow-wrap">
							<div class="filter-select-wrapper" data-name="minPay" id="minPay">

							</div>

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
				<div class="job-filter-modal-item off" data-type="extra">
					<div class="filter-item-wrapper">
						<div class="filter-item">
							<div class="filter-item-title">경력</div>
							<div class="filter-item-content">
								<div class="filter-select-wrapper" data-name="minCareer" data-value=""
								     id="minCareer">

								</div>
							</div>
						</div>

						<!-- 학력조건 -->
						<div class="filter-item">
							<div class="filter-item-title">학력</div>
							<div class="filter-item-content">
								<div class="filter-select-wrapper" data-name="academicBackground"
								     id="academicBackground">

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

			<!-- 페이징처리 -->
			<div class="text-center">
				<ul class="pagination pagination-sm">
				</ul>
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
<script src="../../../assets/js/job.js" type="text/javascript"></script>



</html>

