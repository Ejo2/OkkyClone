<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/common/okky-head.jsp"/>
<style>
		/* map css 추가 추후 css 파일로 뺄 예정*/
    .map_wrap {position:relative;width:100%;height:210px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
</style>
<body>
<!-- map -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5b0618e62cea1f9413d5a53e1ddbd0d3&libraries=services"></script>

<c:set var="sbl" value="${requestScope.getSBoardList}"/>
<c:set var="bl" value="${requestScope.getBoardList}"/>
<c:set var="blh" value="${requestScope.getBoardListHit}"/>

<div class="main">
<jsp:include page="WEB-INF/common/okky-main-aside.jsp"/>
		<!----------------------------------------------------------------------------------------------->
		<%--	<jsp:include page="/WEB-INF/common/okky-main-aside.jsp"/>--%>


		<%--	<div class="layout-container">--%>
		<%--		<div class="main index">--%>

		
		<!-- ------------------------------------------------------------------------------------------- -->
		<!-- ------------------------------------------------------------------------------------------- -->
		<!-- ------------------------------------------------------------------------------------------- -->
		<div class="main-banner-wrapper">
				<div class="main-banner">
						<a href="/banner/stats/403" target="_S"><img src="//file.okky.kr/banner/1631772351805.jpg"></a>
				</div>
		</div>

		<div id="index" class="content scaffold-list clearfix" role="main">

				<!-- 누적 조회수별 -->
				<div class="col-sm-6 main-block-left">
						<div class="main-block">
								<h4 class="main-header"><i class="fa fa-flag"></i> Best </h4>
								<div class="panel panel-default"> <!-- 한덩어리 -->
										<ul class="list-group"> <!-- 글 다섯개 묶음 -->
												<!-- 글 1개 -->

												<c:forEach var="blh" items="${getBoardListHit}" begin="1" end="7" step="1"
												           varStatus="status">
														<li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
																<div class="list-title-wrapper">
																		<h5 class="list-group-item-heading">
																				<a href="${blh.no}">${blh.title}</a>
																				<div class="list-group-item-author pull-right clearfix">
																						<div class="avatar clearfix avatar-x-small ">
																								<a href="/user/info/163" class="avatar-photo"><img
																												src="//file.okky.kr/profile/2021/1621274110514.png"></a>
																								<div class="avatar-info">
																										<a class="nickname" href="/user/info/163"
																										   title="${blh.nickname}">${blh.nickname}</a>
																										<div class="activity"><span
																														class="fa fa-flash"></span> ${blh.hit}
																										</div>
																										<div class="date-created"><span class="timeago"
																										                                title="${blh.writedate}">2달 전</span>
																										</div>
																								</div>
																						</div>
																				</div>
																		</h5>
																</div>
														</li>
												</c:forEach>
										</ul>
								</div>
						</div>
				</div>

				<!-- 공채속보-->
				<div class="col-sm-6 main-block-right">
						<div class="main-block">
								<h4 class="main-header"><i class="fa fa-star"></i>공채 속보</h4><a href="/job.do"
								                                                               class="main-more-btn pull-right"><i
										class="fa fa-ellipsis-h"></i></a></h4>
								<div class="panel panel-default">
										<ul class="list-group">
										</ul>
								</div>
						</div>
				</div>


				<!-- 왼쪽 덩어리 -->
				<div class="col-sm-8 main-block-left">

						<!-- QNA -->
						<div class="main-block">
								<h4 class="main-header"><i class="fa fa-database"></i> Q&amp;A </h4>
										<div class="panel panel-default">
												<ul class="list-group">
														<c:forEach var="bl" items="${getBoardList}" begin="1" end="100" step="1"
														           varStatus="status">
																		<c:if test="${bl.bno == 200}">
																				<li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
																						<div class="list-title-wrapper">
																								<h5 class="list-group-item-heading">
																										<a href="/QnAContent.qo?no=${bl.no}">${bl.title}</a>
																										<div class="list-group-item-author pull-right clearfix">


																												<div class="avatar clearfix avatar-x-small ">
																														<a href="/user/info/123252" class="avatar-photo"><img
																																		src="https://ssl.pstatic.net/static/pwe/address/img_profile.png"></a>
																														<div class="avatar-info">
																																<a class="nickname" href="/user/info/123252"
																																   title="${bl.nickname}">${bl.nickname}</a>
																																<div class="activity"><span
																																				class="fa fa-flash"></span> ${bl.hit}
																																</div>
																																<div class="date-created"><span class="timeago"
																																                                title="${bl.writedate}">1시간 전</span>
																																</div>
																														</div>
																												</div>
																										</div>
																								</h5>
																						</div>
																				</li>
																		</c:if>
														</c:forEach>
												</ul>
										</div>
						</div>

						<!-- 스터디 -->
						<div class="main-block">
								<h4 class="main-header"><i class="fa fa-comment"></i> 스터디 <a href="/StudyDetail.so"
								                                                             class="main-more-btn pull-right"><i
												class="fa fa-ellipsis-h"></i></a></h4>
								<div class="panel panel-default">
										<ul class="list-group">
												<c:forEach var="sbl" items="${requestScope.getSBoardList}" begin="1" end="100" step="1"
												           varStatus="status">
														<li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
																<div class="list-title-wrapper">
																		<h5 class="list-group-item-heading">
																				<a href="/StudyDetail.so?no=${sbl.no}">${sbl.title}</a>
																				<div class="list-group-item-author pull-right clearfix">
																						<div class="avatar clearfix avatar-x-small ">
																								<a href="/user/info/126619" class="avatar-photo"><img
																												src="https://lh3.googleusercontent.com/a-/AOh14Gg9kv-OfJfsCMpQrWmpTbk3WGyT272EYyiRT6im=s96-c"></a>
																								<div class="avatar-info">
																										<a class="nickname" href="/user/info/126619"
																										   title="${bl.nickname}">${bl.nickname}</a>
																										<div class="activity"><span class="fa fa-flash"></span> ${bl.hit}
																										</div>
																										<div class="date-created"><span class="timeago"
																										                                title="${bl.writedate}">1시간 전</span>
																										</div>
																								</div>
																						</div>
																				</div>
																		</h5>
																</div>
														</li>
												</c:forEach>
										</ul>
								</div>
						</div>
				</div>

				<!-- 오른쪽 덩어리 -->
				<div class="col-sm-4 main-block-right">

						<!-- Map-->
						<div class="map_wrap">
								<div id="map" style="width:250px;height:200px;position:relative;overflow:hidden;"></div>
								<div class="hAddr">
										<span class="title">접속위치: </span>
										<span id="centerAddr"></span>
								</div>
						</div>

<%--						<div >--%>
<%--								<a href="/banner/stats/402" target="_k"><img src="//file.okky.kr/banner/1631771146668.jpg"></a>--%>
<%--						</div>--%>

						<!-- 우측 글 1 (Tech) -->
						<div class="main-block">
								<h4 class="main-header"><i class="fa fa-code"></i> Tech <a href="/articles/tech"
								                                                           class="main-more-btn pull-right"><i
												class="fa fa-ellipsis-h"></i></a></h4>
								<div class="panel panel-default">
										<div class="panel-body">
												<div class="article-middle-block clearfix">
														<div class="list-tag clearfix" style="">
																<a href="/articles/tips" class="list-group-item-text item-tag label label-info"><i
																				class="fa fa-code"></i> Tips &amp; 강좌</a>


																<a href="/articles/tagged/iam"
																   class="list-group-item-text item-tag label label-gray ">iam</a>
																<a href="/articles/tagged/aws"
																   class="list-group-item-text item-tag label label-gray ">aws</a>
														</div>
														<h5>
																<a href="/article/1063898">AWS IAM 사용자 리전 제한하기</a>
														</h5>
														<div class="list-group-item-author clearfix">


																<div class="avatar clearfix avatar-x-small pull-right">
																		<a href="/user/info/50698" class="avatar-photo"><img
																						src="//www.gravatar.com/avatar/1b4378984e52feb7361b0ebf572cb67a?d=identicon&amp;s=10"></a>
																		<div class="avatar-info">
																				<a class="nickname" href="/user/info/50698" title="Mambo">Mambo</a>
																				<div class="activity"><span class="fa fa-flash"></span> 6k</div>
																				<div class="date-created"><span class="timeago"
																				                                title="2021-10-03 14:34:22">4시간 전</span>
																				</div>
																		</div>
																</div>
														</div>
												</div>
												<div class="article-middle-block clearfix">
														<div class="list-tag clearfix" style="">
																<a href="/articles/tips" class="list-group-item-text item-tag label label-info"><i
																				class="fa fa-code"></i> Tips &amp; 강좌</a>


																<a href="/articles/tagged/s3"
																   class="list-group-item-text item-tag label label-gray ">s3</a>
																<a href="/articles/tagged/ec2"
																   class="list-group-item-text item-tag label label-gray ">ec2</a>
																<a href="/articles/tagged/aws"
																   class="list-group-item-text item-tag label label-gray ">aws</a>
														</div>
														<h5>
																<a href="/article/1063801">EC2 인스턴스에서 S3 버킷 접근하기</a>
														</h5>
														<div class="list-group-item-author clearfix">


																<div class="avatar clearfix avatar-x-small pull-right">
																		<a href="/user/info/50698" class="avatar-photo"><img
																						src="//www.gravatar.com/avatar/1b4378984e52feb7361b0ebf572cb67a?d=identicon&amp;s=10"></a>
																		<div class="avatar-info">
																				<a class="nickname" href="/user/info/50698" title="Mambo">Mambo</a>
																				<div class="activity"><span class="fa fa-flash"></span> 6k</div>
																				<div class="date-created"><span class="timeago"
																				                                title="2021-10-02 21:51:38">21시간 전</span>
																				</div>
																		</div>
																</div>
														</div>
												</div>
												<div class="article-middle-block clearfix">
														<div class="list-tag clearfix" style="">
																<a href="/articles/tips" class="list-group-item-text item-tag label label-info"><i
																				class="fa fa-code"></i> Tips &amp; 강좌</a>


																<a href="/articles/tagged/github"
																   class="list-group-item-text item-tag label label-gray ">github</a>
																<a href="/articles/tagged/password"
																   class="list-group-item-text item-tag label label-gray ">password</a>
																<a href="/articles/tagged/apikey"
																   class="list-group-item-text item-tag label label-gray ">apikey</a>
																<a href="/articles/tagged/remote"
																   class="list-group-item-text item-tag label label-gray ">remote</a>
														</div>
														<h5>
																<a href="/article/1063537">깃허브에 올라간 민감한 정보 대처법</a>
														</h5>
														<div class="list-group-item-author clearfix">


																<div class="avatar clearfix avatar-x-small pull-right">
																		<a href="/user/info/163" class="avatar-photo"><img
																						src="//file.okky.kr/profile/2021/1621274110514.png"></a>
																		<div class="avatar-info">
																				<a class="nickname" href="/user/info/163" title="kenu">kenu</a>
																				<div class="activity"><span class="fa fa-flash"></span> 56k</div>
																				<div class="date-created"><span class="timeago"
																				                                title="2021-10-01 20:41:03">2일 전</span>
																				</div>
																		</div>
																</div>
														</div>
												</div>
										</div>
								</div>
						</div>

						<!-- 우측 글 2 (칼럼) -->
						<div class="main-block">
								<h4 class="main-header"><i class="fa fa-quote-left"></i> 칼럼 <a href="/BoardContent.go"
								                                                               class="main-more-btn pull-right"><i
												class="fa fa-ellipsis-h"></i></a></h4>
								<div class="panel panel-default">
										<div class="panel-body">

												<c:set var="i" value="1"/>
												<c:forEach var="bl" items="${getBoardList}" begin="1" end="100" step="1"
												           varStatus="status">
														<c:if test="${bl.bno eq 100}">
																<c:if test="${i eq 1}">
																		<h5><a href="/BoardContent.go?no=${bl.no}">${bl.title}</a></h5>
																		<p class="main-block-desc">&nbsp;<a href="/BoardContent.go?no=${bl.no}"> ${bl.cont}...</a>
																		</p>
																		<c:set var="i" value="${i+1}"/>
																</c:if>
														</c:if>
												</c:forEach>

										</div>
								</div>
						</div>

						<!-- 우측 글 3 (학원/홍보) -->

				</div>
		</div>
		<div class="right-banner-wrapper">


				<!-- 우측광고 1 이동식-->
				<div class="right-banner">
						<%--			<a href="/banner/stats/405" target="n"><img src="//file.okky.kr/banner/1632646072967.png"--%>
						<%--			                                            style="width:160px;"></a>--%>
				</div>

				<!-- 우측광고 2 이동식-->
				<%--						<div class="google-ad">--%>
				<%--							--%>
				<%--						</div>--%>
		</div>


		<%--	</div>--%>


		<script>
        var contextPath = "";
        var encodedURL = "%2F";
		</script>

		<script src="/assets/js/application.js" type="text/javascript"></script>
		<%--	<script src="/assets/js/apps/search.js" type="text/javascript"></script>--%>
		<%--	<script src="/assets/js/apps/notification.js" type="text/javascript"></script>--%>
		<script>
        $(function () {
            $('.timeago').timeago();
        });


		</script>

		<div id="userPrivacy" class="modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
		     aria-hidden="true">
				<div class="modal-dialog">
						<div class="modal-content">
						</div>
				</div>
		</div>

		<div id="userAgreement" class="modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
		     aria-hidden="true">
				<div class="modal-dialog">
						<div class="modal-content">
						</div>
				</div>
		</div>


		<%--	<ins class="adsbygoogle adsbygoogle-noablate" data-adsbygoogle-status="done" style="display: none !important;"--%>
		<%--	     data-ad-status="unfilled">--%>
		<%--		<ins id="aswift_1_expand" tabindex="0" title="Advertisement" aria-label="Advertisement"--%>
		<%--		     style="border: none; height: 0px; width: 0px; margin: 0px; padding: 0px; position: relative; visibility: visible; background-color: transparent; display: inline-table;">--%>
		<%--			<ins id="aswift_1_anchor"--%>
		<%--			     style="border: none; height: 0px; width: 0px; margin: 0px; padding: 0px; position: relative; visibility: visible; background-color: transparent; display: block;">--%>
		<%--				<iframe id="aswift_1" name="aswift_1"--%>
		<%--				        style="left:0;position:absolute;top:0;border:0;width:undefinedpx;height:undefinedpx;"--%>
		<%--				        sandbox="allow-forms allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation"--%>
		<%--				        frameborder="0"--%>
		<%--				        src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-8103607814406874&amp;output=html&amp;adk=1812271804&amp;adf=3025194257&amp;lmt=1633249980&amp;plat=1%3A16777216%2C2%3A16777216%2C3%3A32%2C4%3A32%2C9%3A32776%2C16%3A8388608%2C17%3A32%2C24%3A32%2C25%3A32%2C30%3A1048576%2C32%3A32&amp;format=0x0&amp;url=https%3A%2F%2Fokky.kr%2F&amp;ea=0&amp;flash=0&amp;pra=7&amp;wgl=1&amp;uach=WyJXaW5kb3dzIiwiMTAuMC4wIiwieDg2IiwiIiwiOTQuMC40NjA2LjYxIixbXSxudWxsLG51bGwsIjY0Il0.&amp;tt_state=W3siaXNzdWVyT3JpZ2luIjoiaHR0cHM6Ly9hdHRlc3RhdGlvbi5hbmRyb2lkLmNvbSIsInN0YXRlIjo3fV0.&amp;dt=1633249980356&amp;bpp=1&amp;bdt=787&amp;idt=53&amp;shv=r20210928&amp;mjsv=m202109270101&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3D4278784cc95a1242-220cc21851ca00cf%3AT%3D1626325905%3ART%3D1626325905%3AS%3DALNI_MYt1Kn6iAUZgpu7SiLxBkWy36P81A&amp;prev_fmts=160x500&amp;nras=1&amp;correlator=4931479792519&amp;frm=20&amp;pv=1&amp;ga_vid=101483533.1626325906&amp;ga_sid=1633249980&amp;ga_hid=318252170&amp;ga_fc=0&amp;u_tz=540&amp;u_his=10&amp;u_h=1080&amp;u_w=1920&amp;u_ah=1040&amp;u_aw=1920&amp;u_cd=24&amp;u_java=0&amp;u_nplug=5&amp;u_nmime=2&amp;adx=-12245933&amp;ady=-12245933&amp;biw=1054&amp;bih=782&amp;scr_x=0&amp;scr_y=0&amp;eid=31062937%2C21067496&amp;oid=2&amp;pvsid=1479478429246862&amp;pem=877&amp;eae=2&amp;fc=896&amp;brdim=311%2C92%2C311%2C92%2C1920%2C0%2C1087%2C919%2C1071%2C799&amp;vis=1&amp;rsz=%7C%7Cs%7C&amp;abl=NS&amp;fu=33792&amp;bc=31&amp;ifi=2&amp;uci=a!2&amp;fsb=1&amp;dtd=59"--%>
		<%--				        marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no"--%>
		<%--				        allowfullscreen="true" data-google-container-id="a!2" data-load-complete="true"></iframe>--%>
		<%--			</ins>--%>
		<%--		</ins>--%>
		<%--	</ins>--%>
		<iframe src="https://www.google.com/recaptcha/api2/aframe" width="0" height="0" style="display: none;"></iframe>


		<jsp:include page="/WEB-INF/common/okky-footer.jsp"/>

		<!----------------------------------------------------------------------------------------------->
</div>
</body>

<script>
    var contextPath = "";
    var encodedURL = "%2Farticles%2Fquestions";
</script>

<script src="assets/js/application.js" type="text/javascript"></script>
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

<script>

		let allData = "job_type=1&job_mid_cd=2&job_cd=&edu_lv=&loc_cd=";

		$.ajax({
    url: 'http://localhost:8090/jobData.do?',  //json데이터에 검색할 param담아서 요청
    type: 'get',
    dataType: 'json',
    // data: "job_mid_cd="+job_mid_cd + '&job_cd='+job_cd + "&edu_lv="+edu_lv + "&loc_cd="+loc_cd ,
    data: allData,
    success: function (data) {
        $.each(data, function (index, obj) {
            for (let i = 0; i < 6; i++) {
                let url = String(data.jobs.job[i]["url"]);
                let title = String(data.jobs.job[i].position["title"]);
		            let detailname = String(data.jobs.job[i].company["detail"].name);
		            let href = String(data.jobs.job[i].company["detail"].href);
                let deadline = new Date((data.jobs.job[i]['expiration-timestamp']) * 1000)
                deadline = deadline.toLocaleDateString();

                let jobArticle = `
										<li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
												<div class="list-title-wrapper">
														<h5 class="list-group-item-heading">
																<a href="`+ url +`">`+ title +`</a>
																<div class="list-group-item-author pull-right clearfix">


																		<div class="avatar clearfix avatar-x-small ">
																				<a href="`+ href +`" class="avatar-photo"></a>
																				<div class="avatar-info">
<!--																						<a class="nickname" href="`+ href +`" title="`+ detailname +`">`+ detailname +`</a>-->
																						<div class="activity"><span class="fa fa-flash"></span></div>
																						<div class="date-created"><span class="timeago"
																						                                title="`+ deadline +`">마감  `+ deadline +`</span>
																						</div>
																				</div>
																		</div>
																</div>
														</h5>
												</div>
										</li>
										`
		            $('.col-sm-6.main-block-right .list-group').append(jobArticle);
            }
        });
    }
});


</script>

<script>

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
        navigator.geolocation.getCurrentPosition(function(position) {

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

// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
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
            }
        }

    }


</script>

</html>