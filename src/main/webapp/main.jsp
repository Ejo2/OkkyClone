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

		<!----------------------------------------------------------------------------------------------->
		<%--	<jsp:include page="/WEB-INF/common/okky-main-aside.jsp"/>--%>


		<%--	<div class="layout-container">--%>
		<%--		<div class="main index">--%>

		<div class="sidebar">
				<a href="javascript://" class="sidebar-header">
						<i class="fa fa-bars sidebar-header-icon"></i>
				</a>

				<!--1: 오키로고-->
				<h1>
						<div class="logo">
								<a href="/main.do"><img src="../../assets/img/okjsp_logo.png" alt="OKKY" title="OKKY"></a>
						</div>
				</h1>

				<!--2: 검색로고-->
				<ul id="search-google-icon" class="nav nav-sidebar nav-sidebar-search-wrapper">
						<li class="nav-sidebar-search"><a href="#" class="link" id="search-google"
						                                  data-toggle="popover" data-trigger="click" data-original-title=""
						                                  title=""><i class="fa fa-search"></i></a></li>
				</ul>

				<!--2-1: 반응형으로 작아졌을때 검색창-->
				<form id="search-google-form" name="searchMain" class="nav-sidebar-form" action="https://www.google.com/search">
						<div class="input-group">
								<input type="text" name="qt" class="form-control input-sm" placeholder="Google 검색"/>
								<input type="hidden" name="q"/>
								<span class="input-group-btn">
                            <button class="btn btn-default btn-sm" type="submit"><i class="fa fa-search"></i></button>
                  </span>
						</div>
				</form>

				<!--3: 로그인사진&설정&알람 로고-->
				<div class="nav-user nav-sidebar">
						<!-- 로그아웃 상태일 때  -->
									<c:if test="${empty sessionScope.id}">
										<div class="nav-user nav-sidebar">
											<ul class="nav nav-sidebar">
												<li id="login" data-toggle="tooltip" data-container="body" title="로그인">
													<a href="loginGo.do" class="link"><i class="fa fa-sign-in"></i>
														<span class="nav-sidebar-label">로그인</span></a></li>
												<li id="join" data-toggle="tooltip" data-container="body" title="회원가입">
													<a href="joinGo.do" class="link"><i class="fa fa-user"></i>
														<span class="nav-sidebar-label">회원가입</span></a></li>
											</ul>
										</div>
									</c:if>

						<!--로그인 상태일 때  -->

						<c:if test="${not empty sessionScope.id}">
								<div class="avatar clearfix avatar-medium ">
										<a href="memberDetailGo.do" class="avatar-photo"><img
														src="upload/${sessionScope.photo}"></a>
										<div class="avatar-info">
												<a class="nickname" href="memberDetailGo.do" title="신지혜20">신지혜20</a>
														<%--                              <a class="nickname" href="memberDetailGo.do" title="${sessionScope.nickname}">${sessionScope.nickname}</a>--%>
												<div class="activity block"><span class="fa fa-flash"></span> 0</div>
										</div>
								</div>


								<div class="nav-user-action">
										<!--  톱니바퀴 -->
										<div class="nav-user-func">
												<a data-placement="bottom" data-toggle="popover" data-container="body" type="button"
												   data-html="true" href="#" id="setting" data-original-title="" title=""><i class="fas fa-cog"
												                                                                             style="margin-top: 7px"></i></a>


												<form action="logout.do" method="post" style="display:none;">
														<input type="submit" name="logoutButton"
														       value="logoutButton" id="logoutButton">
												</form>


										</div>


												<%--					<a data-placement="bottom" data-toggle="popover" data-container="body" type="button" &ndash;%&gt;--%>
												<%--						data-html="true" href="#" id="setting" data-original-title="" title=""><i class="fas fa-cog"--%>
												<%--						                                                                          style="margin-top: 7px"></i></a>--%>
												<%--					<div class="popover fade bottom in" style="top: 184px; left: 0px; display: block;">--%>
												<%--						<div class="arrow" style="left: 12.6812%;"></div>--%>
												<%--						<h3 class="popover-title" style="display: none;"></h3>--%>
												<%--						<div class="popover-content">--%>
												<%--							<div class="arrow" style="top : 50%;"></div>--%>
												<%--							<h3 class="popover-title" style="display: none;">설정</h3>--%>
												<%--							<div class="popover-footer clearfix" id="user-func-popover">--%>
												<%--								<label href="logout.do" for="logoutButton" class="popover-btn"><i--%>
												<%--										class="fa fa-sign-out"></i>--%>
												<%--									로그아웃</label>--%>
												<%--								<a href="userInfoChange.do" class="popover-btn"><i class="fa fa-user"></i> 정보수정</a>--%>
												<%--							</div>--%>
												<%--						</div>--%>
												<%--					</div>--%>

										<!--  알림설정 -->

										<div class=nav-user-func">
												<a href="memberDetailGo.do" id="user-notification" data-toggle="popover" data-trigger="click"
												   tabindex="0" data-original-title="" title="">
														<i id="user-notification-icon" class="fa fa-bell"></i>
														<span id="user-notification-count" class="badge notification"
														      style="display:none;">0</span>
												</a>
										</div>

								</div>

								<%--로그아웃--%>
								<%--				<form action="logout.do" method="post" style="display:none;">--%>
								<%--					<input type="submit" name="logoutButton"--%>
								<%--					       value="logoutButton" id="logoutButton">--%>
								<%--				</form>--%>


								<script id="setting-template" type="text/template">
										<div class="popover popover-fixed" role="tooltip">
												<div class="arrow" style="top : 50%;"></div>
												<h3 class="popover-title" style="display: none;">설정</h3>
												<div class="popover-footer clearfix" id="user-func-popover">
														<label href="logout.do" for="logoutButton" class="popover-btn"><i
																		class="fa fa-sign-out"></i>
																로그아웃</label>
														<a href="userInfoChange.do" class="popover-btn"><i class="fa fa-user"></i> 정보수정</a>
												</div>
										</div>
								</script>

								<ul class="list-unstyled">
										<a href="memberDetailGo.do" class="avatar-photo">
										</a>

										<!-- 로그아웃상태일때 보이는 톱니바퀴, 알-->
												<%--					<li><a href="memberDetailGo.do" class="avatar-photo">--%>
												<%--					</a><a data-placement="bottom" data-toggle="popover" data-container="body" type="button"--%>
												<%--					       data-html="true" href="#" id="setting" data-original-title="" title=""><i class="fas fa-cog"--%>
												<%--					                                                                                 style="margin-top: 7px"></i></a>--%>
												<%--					</li>--%>
												<%--					<li>--%>
												<%--						<a data-placement="bottom" data-toggle="popover" data-container="body" type="button"--%>
												<%--						   data-html="true" href="#" id="notification" data-original-title="" title=""><i--%>
												<%--								class="fas fa-bell" style="margin-top: 7px"></i></a>--%>
												<%--					</li>--%>

												<%--					<div id="popover-content" class="hide" role="tooltip">--%>
												<%--						<div class="arrow" style="top : 50%;"></div>--%>
												<%--						<h3 class="popover-title">설정</h3>--%>
												<%--						<div class="popover-footer clearfix" id="user-func-popover">--%>
												<%--							<label href="logout.do" for="logoutButton" class="popover-btn"><i--%>
												<%--									class="fa fa-sign-out"></i>--%>
												<%--								로그아웃</label>--%>
												<%--							<a href="userInfoChange.do" class="popover-btn"><i class="fa fa-user">--%>

												<%--							</i> 정보수정</a>--%>
												<%--						</div>--%>
												<%--					</div>--%>


												<%--					<div id="popover-content2" class="hide" role="tooltip">--%>
												<%--						<div class="arrow" style="top : 50%;"></div>--%>
												<%--						<h3 class="popover-title">알림</h3>--%>
												<%--						<div class="popover-content" id="notification-popover">--%>

												<%--						</div>--%>
												<%--					</div>--%>


								</ul>
						</c:if>


						<%--팝오버 창 start--%>

						<%--알림 기능은 후순위로 미루겠습니다.--%>
						<script id="notification-template" type="text/template">
								<div class="popover popover-fixed" role="tooltip">
										<div class="arrow"></div>
										<h3 class="popover-title"></h3>
										<div class="popover-content" id="notification-popover"></div>
								</div>
						</script>
						<%--팝오버 창 end--%>


						<%--구글 검색 스트립트 나중에 사용 예정입니다.--%>
						<%--            <script id="search-google-template" type="text/template">--%>
						<%--                  <div class="popover popover-fixed" role="tooltip">--%>
						<%--                        <div class="arrow"></div>--%>
						<%--                        <h3 class="popover-title">Google 검색</h3>--%>
						<%--                        <div class="popover-content" id="search-google-popover">--%>
						<%--                              <form id="search-google-form" name="searchMain" class="nav-sidebar-form" action="https://www.google.com/search" onsubmit="searchMain.q.value='site:okky.kr '+searchMain.qt.value;">--%>
						<%--                                    <div class="input-group">--%>
						<%--                                          <input type="text" name="qt" class="form-control input-sm" placeholder="Google 검색"/>--%>
						<%--                                          <input type="hidden" name="q"/>--%>
						<%--                                          <span class="input-group-btn">--%>
						<%--                                    <button class="btn btn-default btn-sm" type="submit"><i class="fa fa-search"></i></button>--%>
						<%--                                </span>--%>
						<%--                                    </div>--%>
						<%--                              </form>--%>
						<%--                        </div>--%>
						<%--                  </div>--%>
						<%--            </script>--%>
				</div>
				<%-- 카테고리 --%>
				<ul class="nav nav-sidebar nav-main">

						<li><a href="QnAContent.qo" class="link"><i class="nav-icon fa fa-database"></i> <span
										class="nav-sidebar-label nav-sidebar-category-label">Q&amp;A</span></a></li>
<%--						<li><a href="#" class="link"><i class="nav-icon fa fa-code"></i> <span--%>
<%--										class="nav-sidebar-label nav-sidebar-category-label">Tech</span></a></li>--%>
						<li><a href="StudyPaging.so?page=1" class="link"><i class="nav-icon fa fa-comments"></i> <span
										class="nav-sidebar-label nav-sidebar-category-label">스터디</span></a></li>
						<li><a href="BoardList.go" class="link"><i class="nav-icon fa fa-quote-left"></i> <span
										class="nav-sidebar-label nav-sidebar-category-label">칼럼</span></a></li>
						<li><a href="job.do?jobType=CONTRACT" class="link"><i
										class="nav-icon fa fa-user-friends"></i> <span
										class="nav-sidebar-label nav-sidebar-category-label">Jobs</span></a></li>
				</ul>

				<%--깃허브 주소 링크 추가함--%>
				<ul class="nav nav-sidebar nav-bottom">
						<li><a href="https://github.com/Ejo2/OkkyClone/issues" class="link" target="_blank"><i
										class="fa fa-github"></i> <span
										class="nav-sidebar-label nav-sidebar-category-label">Github Issues</span></a>
						</li>
				</ul>
		</div>
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