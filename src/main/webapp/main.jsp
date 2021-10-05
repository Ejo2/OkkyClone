<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/common/okky-head.jsp"/>
<style>
    /* map css 추가 추후 css 파일로 뺄 예정*/
    .map_wrap {
        position: relative;
        width: 100%;
        height: 210px;
    }

    .title {
        font-weight: bold;
        display: block;
    }

    .hAddr {
        position: absolute;
        left: 10px;
        top: 10px;
        border-radius: 2px;
        background: #fff;
        background: rgba(255, 255, 255, 0.8);
        z-index: 1;
        padding: 5px;
    }

    #centerAddr {
        display: block;
        margin-top: 2px;
        font-weight: normal;
    }
</style>
<body>
<!-- map -->
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5b0618e62cea1f9413d5a53e1ddbd0d3&libraries=services"></script>

<c:set var="sbl" value="${requestScope.getSBoardList}"/>
<c:set var="bl" value="${requestScope.getBoardList}"/>
<c:set var="blh" value="${requestScope.getBoardListHit}"/>

<div class="main">

  <!----------------------------------------------------------------------------------------------->
  <jsp:include page="/WEB-INF/common/okky-main-aside.jsp"/>


  <%--	<div class="layout-container">--%>
  <%--		<div class="main index">--%>

  <%--		<div class="sidebar">--%>
  <%--				<a href="javascript://" class="sidebar-header">--%>
  <%--						<i class="fa fa-bars sidebar-header-icon"></i>--%>
  <%--				</a>--%>

  <%--				<!--1: 오키로고-->--%>
  <%--				<h1>--%>
  <%--						<div class="logo">--%>
  <%--								<a href="/main.do"><img src="../../assets/img/okjsp_logo.png" alt="OKKY" title="OKKY"></a>--%>
  <%--						</div>--%>
  <%--				</h1>--%>

  <%--				<!--2: 검색로고-->--%>
  <%--				<ul id="search-google-icon" class="nav nav-sidebar nav-sidebar-search-wrapper">--%>
  <%--						<li class="nav-sidebar-search"><a href="#" class="link" id="search-google"--%>
  <%--																																								data-toggle="popover" data-trigger="click" data-original-title=""--%>
  <%--																																								title=""><i class="fa fa-search"></i></a></li>--%>
  <%--				</ul>--%>

  <%--				<!--2-1: 반응형으로 작아졌을때 검색창-->--%>
  <%--				<form id="search-google-form" name="searchMain" class="nav-sidebar-form" action="https://www.google.com/search">--%>
  <%--						<div class="input-group">--%>
  <%--								<input type="text" name="qt" class="form-control input-sm" placeholder="Google 검색"/>--%>
  <%--								<input type="hidden" name="q"/>--%>
  <%--								<span class="input-group-btn">--%>
  <%--                            <button class="btn btn-default btn-sm" type="submit"><i class="fa fa-search"></i></button>--%>
  <%--                  </span>--%>
  <%--						</div>--%>
  <%--				</form>--%>

  <%--				<!--3: 로그인사진&설정&알람 로고-->--%>
  <%--				<div class="nav-user nav-sidebar">--%>
  <%--						<!-- 로그아웃 상태일 때  -->--%>
  <%--						<c:if test="${empty sessionScope.id}">--%>
  <%--								<div class="nav-user nav-sidebar">--%>
  <%--										<ul class="nav nav-sidebar">--%>
  <%--												<li id="login" data-toggle="tooltip" data-container="body" title="로그인">--%>
  <%--														<a href="loginGo.do" class="link"><i class="fa fa-sign-in"></i>--%>
  <%--																<span class="nav-sidebar-label">로그인</span></a></li>--%>
  <%--												<li id="join" data-toggle="tooltip" data-container="body" title="회원가입">--%>
  <%--														<a href="joinGo.do" class="link"><i class="fa fa-user"></i>--%>
  <%--																<span class="nav-sidebar-label">회원가입</span></a></li>--%>
  <%--										</ul>--%>
  <%--								</div>--%>
  <%--						</c:if>--%>

  <%--						<!--로그인 상태일 때  -->--%>

  <%--						<c:if test="${not empty sessionScope.id}">--%>
  <%--								<div class="avatar clearfix avatar-medium ">--%>
  <%--										<a href="memberDetailGo.do" class="avatar-photo"><img--%>
  <%--														src="upload/${sessionScope.photo}"></a>--%>
  <%--										<div class="avatar-info">--%>
  <%--												<a class="nickname" href="memberDetailGo.do" title="${sessionScope.nickname}">${sessionScope.nickname}</a>--%>
  <%--														&lt;%&ndash;                              <a class="nickname" href="memberDetailGo.do" title="${sessionScope.nickname}">${sessionScope.nickname}</a>&ndash;%&gt;--%>
  <%--												<div class="activity block"><span class="fa fa-flash"></span> 0</div>--%>
  <%--										</div>--%>
  <%--								</div>--%>


  <%--								<div class="nav-user-action">--%>
  <%--										<!--  톱니바퀴 -->--%>
  <%--										<div class="nav-user-func">--%>
  <%--												<a data-placement="bottom" data-toggle="popover" data-container="body" type="button"--%>
  <%--															data-html="true" href="#" id="setting" data-original-title="" title=""><i class="fas fa-cog"--%>
  <%--																																																																																									style="margin-top: 7px"></i></a>--%>


  <%--												<form action="logout.do" method="post" style="display:none;">--%>
  <%--														<input type="submit" name="logoutButton"--%>
  <%--																					value="logoutButton" id="logoutButton">--%>
  <%--												</form>--%>


  <%--										</div>--%>


  <%--												&lt;%&ndash;					<a data-placement="bottom" data-toggle="popover" data-container="body" type="button" &ndash;%&gt;&ndash;%&gt;--%>
  <%--												&lt;%&ndash;						data-html="true" href="#" id="setting" data-original-title="" title=""><i class="fas fa-cog"&ndash;%&gt;--%>
  <%--												&lt;%&ndash;						                                                                          style="margin-top: 7px"></i></a>&ndash;%&gt;--%>
  <%--												&lt;%&ndash;					<div class="popover fade bottom in" style="top: 184px; left: 0px; display: block;">&ndash;%&gt;--%>
  <%--												&lt;%&ndash;						<div class="arrow" style="left: 12.6812%;"></div>&ndash;%&gt;--%>
  <%--												&lt;%&ndash;						<h3 class="popover-title" style="display: none;"></h3>&ndash;%&gt;--%>
  <%--												&lt;%&ndash;						<div class="popover-content">&ndash;%&gt;--%>
  <%--												&lt;%&ndash;							<div class="arrow" style="top : 50%;"></div>&ndash;%&gt;--%>
  <%--												&lt;%&ndash;							<h3 class="popover-title" style="display: none;">설정</h3>&ndash;%&gt;--%>
  <%--												&lt;%&ndash;							<div class="popover-footer clearfix" id="user-func-popover">&ndash;%&gt;--%>
  <%--												&lt;%&ndash;								<label href="logout.do" for="logoutButton" class="popover-btn"><i&ndash;%&gt;--%>
  <%--												&lt;%&ndash;										class="fa fa-sign-out"></i>&ndash;%&gt;--%>
  <%--												&lt;%&ndash;									로그아웃</label>&ndash;%&gt;--%>
  <%--												&lt;%&ndash;								<a href="userInfoChange.do" class="popover-btn"><i class="fa fa-user"></i> 정보수정</a>&ndash;%&gt;--%>
  <%--												&lt;%&ndash;							</div>&ndash;%&gt;--%>
  <%--												&lt;%&ndash;						</div>&ndash;%&gt;--%>
  <%--												&lt;%&ndash;					</div>&ndash;%&gt;--%>

  <%--										<!--  알림설정 -->--%>

  <%--										<div class=nav-user-func">--%>
  <%--												<a href="memberDetailGo.do" id="user-notification" data-toggle="popover" data-trigger="click"--%>
  <%--															tabindex="0" data-original-title="" title="">--%>
  <%--														<i id="user-notification-icon" class="fa fa-bell"></i>--%>
  <%--														<span id="user-notification-count" class="badge notification"--%>
  <%--																				style="display:none;">0</span>--%>
  <%--												</a>--%>
  <%--										</div>--%>

  <%--								</div>--%>

  <%--								&lt;%&ndash;로그아웃&ndash;%&gt;--%>
  <%--								&lt;%&ndash;				<form action="logout.do" method="post" style="display:none;">&ndash;%&gt;--%>
  <%--								&lt;%&ndash;					<input type="submit" name="logoutButton"&ndash;%&gt;--%>
  <%--								&lt;%&ndash;					       value="logoutButton" id="logoutButton">&ndash;%&gt;--%>
  <%--								&lt;%&ndash;				</form>&ndash;%&gt;--%>


  <%--								<script id="setting-template" type="text/template">--%>
  <%--										<div class="popover popover-fixed" role="tooltip">--%>
  <%--												<div class="arrow" style="top : 50%;"></div>--%>
  <%--												<h3 class="popover-title" style="display: none;">설정</h3>--%>
  <%--												<div class="popover-footer clearfix" id="user-func-popover">--%>
  <%--														<label href="logout.do" for="logoutButton" class="popover-btn"><i--%>
  <%--																		class="fa fa-sign-out"></i>--%>
  <%--																로그아웃</label>--%>
  <%--														<a href="userInfoChange.do" class="popover-btn"><i class="fa fa-user"></i> 정보수정</a>--%>
  <%--												</div>--%>
  <%--										</div>--%>
  <%--								</script>--%>

  <%--								<ul class="list-unstyled">--%>
  <%--										<a href="memberDetailGo.do" class="avatar-photo">--%>
  <%--										</a>--%>

  <%--										<!-- 로그아웃상태일때 보이는 톱니바퀴, 알-->--%>
  <%--												&lt;%&ndash;					<li><a href="memberDetailGo.do" class="avatar-photo">&ndash;%&gt;--%>
  <%--												&lt;%&ndash;					</a><a data-placement="bottom" data-toggle="popover" data-container="body" type="button"&ndash;%&gt;--%>
  <%--												&lt;%&ndash;					       data-html="true" href="#" id="setting" data-original-title="" title=""><i class="fas fa-cog"&ndash;%&gt;--%>
  <%--												&lt;%&ndash;					                                                                                 style="margin-top: 7px"></i></a>&ndash;%&gt;--%>
  <%--												&lt;%&ndash;					</li>&ndash;%&gt;--%>
  <%--												&lt;%&ndash;					<li>&ndash;%&gt;--%>
  <%--												&lt;%&ndash;						<a data-placement="bottom" data-toggle="popover" data-container="body" type="button"&ndash;%&gt;--%>
  <%--												&lt;%&ndash;						   data-html="true" href="#" id="notification" data-original-title="" title=""><i&ndash;%&gt;--%>
  <%--												&lt;%&ndash;								class="fas fa-bell" style="margin-top: 7px"></i></a>&ndash;%&gt;--%>
  <%--												&lt;%&ndash;					</li>&ndash;%&gt;--%>

  <%--												&lt;%&ndash;					<div id="popover-content" class="hide" role="tooltip">&ndash;%&gt;--%>
  <%--												&lt;%&ndash;						<div class="arrow" style="top : 50%;"></div>&ndash;%&gt;--%>
  <%--												&lt;%&ndash;						<h3 class="popover-title">설정</h3>&ndash;%&gt;--%>
  <%--												&lt;%&ndash;						<div class="popover-footer clearfix" id="user-func-popover">&ndash;%&gt;--%>
  <%--												&lt;%&ndash;							<label href="logout.do" for="logoutButton" class="popover-btn"><i&ndash;%&gt;--%>
  <%--												&lt;%&ndash;									class="fa fa-sign-out"></i>&ndash;%&gt;--%>
  <%--												&lt;%&ndash;								로그아웃</label>&ndash;%&gt;--%>
  <%--												&lt;%&ndash;							<a href="userInfoChange.do" class="popover-btn"><i class="fa fa-user">&ndash;%&gt;--%>

  <%--												&lt;%&ndash;							</i> 정보수정</a>&ndash;%&gt;--%>
  <%--												&lt;%&ndash;						</div>&ndash;%&gt;--%>
  <%--												&lt;%&ndash;					</div>&ndash;%&gt;--%>


  <%--												&lt;%&ndash;					<div id="popover-content2" class="hide" role="tooltip">&ndash;%&gt;--%>
  <%--												&lt;%&ndash;						<div class="arrow" style="top : 50%;"></div>&ndash;%&gt;--%>
  <%--												&lt;%&ndash;						<h3 class="popover-title">알림</h3>&ndash;%&gt;--%>
  <%--												&lt;%&ndash;						<div class="popover-content" id="notification-popover">&ndash;%&gt;--%>

  <%--												&lt;%&ndash;						</div>&ndash;%&gt;--%>
  <%--												&lt;%&ndash;					</div>&ndash;%&gt;--%>


  <%--								</ul>--%>
  <%--						</c:if>--%>


  <%--						&lt;%&ndash;팝오버 창 start&ndash;%&gt;--%>

  <%--						&lt;%&ndash;알림 기능은 후순위로 미루겠습니다.&ndash;%&gt;--%>
  <%--						<script id="notification-template" type="text/template">--%>
  <%--								<div class="popover popover-fixed" role="tooltip">--%>
  <%--										<div class="arrow"></div>--%>
  <%--										<h3 class="popover-title"></h3>--%>
  <%--										<div class="popover-content" id="notification-popover"></div>--%>
  <%--								</div>--%>
  <%--						</script>--%>
  <%--						&lt;%&ndash;팝오버 창 end&ndash;%&gt;--%>


  <%--						&lt;%&ndash;구글 검색 스트립트 나중에 사용 예정입니다.&ndash;%&gt;--%>
  <%--						&lt;%&ndash;            <script id="search-google-template" type="text/template">&ndash;%&gt;--%>
  <%--						&lt;%&ndash;                  <div class="popover popover-fixed" role="tooltip">&ndash;%&gt;--%>
  <%--						&lt;%&ndash;                        <div class="arrow"></div>&ndash;%&gt;--%>
  <%--						&lt;%&ndash;                        <h3 class="popover-title">Google 검색</h3>&ndash;%&gt;--%>
  <%--						&lt;%&ndash;                        <div class="popover-content" id="search-google-popover">&ndash;%&gt;--%>
  <%--						&lt;%&ndash;                              <form id="search-google-form" name="searchMain" class="nav-sidebar-form" action="https://www.google.com/search" onsubmit="searchMain.q.value='site:okky.kr '+searchMain.qt.value;">&ndash;%&gt;--%>
  <%--						&lt;%&ndash;                                    <div class="input-group">&ndash;%&gt;--%>
  <%--						&lt;%&ndash;                                          <input type="text" name="qt" class="form-control input-sm" placeholder="Google 검색"/>&ndash;%&gt;--%>
  <%--						&lt;%&ndash;                                          <input type="hidden" name="q"/>&ndash;%&gt;--%>
  <%--						&lt;%&ndash;                                          <span class="input-group-btn">&ndash;%&gt;--%>
  <%--						&lt;%&ndash;                                    <button class="btn btn-default btn-sm" type="submit"><i class="fa fa-search"></i></button>&ndash;%&gt;--%>
  <%--						&lt;%&ndash;                                </span>&ndash;%&gt;--%>
  <%--						&lt;%&ndash;                                    </div>&ndash;%&gt;--%>
  <%--						&lt;%&ndash;                              </form>&ndash;%&gt;--%>
  <%--						&lt;%&ndash;                        </div>&ndash;%&gt;--%>
  <%--						&lt;%&ndash;                  </div>&ndash;%&gt;--%>
  <%--						&lt;%&ndash;            </script>&ndash;%&gt;--%>
  <%--				</div>--%>
  <%--				&lt;%&ndash; 카테고리 &ndash;%&gt;--%>
  <%--				<ul class="nav nav-sidebar nav-main">--%>

  <%--						<li><a href="QnAList.qo" class="link"><i class="nav-icon fa fa-database"></i> <span--%>
  <%--										class="nav-sidebar-label nav-sidebar-category-label">Q&amp;A</span></a></li>--%>
  <%--						&lt;%&ndash;						<li><a href="#" class="link"><i class="nav-icon fa fa-code"></i> <span&ndash;%&gt;--%>
  <%--						&lt;%&ndash;										class="nav-sidebar-label nav-sidebar-category-label">Tech</span></a></li>&ndash;%&gt;--%>
  <%--						<li><a href="StudyPaging.so?page=1" class="link"><i class="nav-icon fa fa-comments"></i> <span--%>
  <%--										class="nav-sidebar-label nav-sidebar-category-label">스터디</span></a></li>--%>
  <%--						<li><a href="BoardList.go" class="link"><i class="nav-icon fa fa-quote-left"></i> <span--%>
  <%--										class="nav-sidebar-label nav-sidebar-category-label">칼럼</span></a></li>--%>
  <%--						<li><a href="job.do?jobType=CONTRACT" class="link"><i--%>
  <%--										class="nav-icon fa fa-user-friends"></i> <span--%>
  <%--										class="nav-sidebar-label nav-sidebar-category-label">Jobs</span></a></li>--%>
  <%--				</ul>--%>

  <%--				&lt;%&ndash;깃허브 주소 링크 추가함&ndash;%&gt;--%>
  <%--				<ul class="nav nav-sidebar nav-bottom">--%>
  <%--						<li><a href="https://github.com/Ejo2/OkkyClone/issues" class="link" target="_blank"><i--%>
  <%--										class="fa fa-github"></i> <span--%>
  <%--										class="nav-sidebar-label nav-sidebar-category-label">Github Issues</span></a>--%>
  <%--						</li>--%>
  <%--				</ul>--%>
  <%--		</div>--%>
  <!-- ------------------------------------------------------------------------------------------- -->
  <!-- ------------------------------------------------------------------------------------------- -->
  <!-- ------------------------------------------------------------------------------------------- -->
  <div class="main-banner-wrapper">
    <div class="main-banner">
      <img src=assets/img/mainbanner.png>
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
                <div class="list-title-wrapper" data-group-value="${blh.bno}" data-value="${blh.no}">
                  <h5 class="list-group-item-heading">
                    <a href="${blh.no}">${blh.title}</a>
                    <div class="list-group-item-author pull-right clearfix">
                      <div class="avatar clearfix avatar-x-small ">
                        <a href="/user/info/163" class="avatar-photo"><img
                                src="//file.okky.kr/profile/2021/1621274110514.png"></a>
                        <div class="avatar-info">
                          <a class="nickname" href="/user/info/163"
                             title="${blh.nickname}">${blh.nickname}</a>
                          <div class="activity"><i class="fa fa-eye"></i> ${blh.hit}
                          </div>
                          <div class="date-created"><span class="timeago" onload="timeForToday(${blh.writedate})"
                                                          title="${blh.writedate}"></span>
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
        <h4 class="main-header"><i class="fa fa-star"></i> 공채 속보<a href="job.do?jobType=FULLTIME"
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
        <h4 class="main-header"><i class="fa fa-database"></i> Q&amp;A
          <a href="/QnAList.qo"
             class="main-more-btn pull-right"><i
                  class="fa fa-ellipsis-h"></i></a>
        </h4>

        <div class="panel panel-default">
          <ul class="list-group">
            <c:set var="i" value="0"/>
            <c:forEach var="bl" items="${getBoardList}" begin="1" end="100" step="1"
                       varStatus="status">
              <c:if test="${bl.bno == 200 and i < 10}">

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
                            <div class="activity"><i class="fa fa-eye"></i> ${bl.hit}
                            </div>
                            <div class="date-created"><span class="timeago"
                                                            title="${bl.writedate}"></span>
                            </div>
                          </div>
                        </div>
                      </div>
                    </h5>
                  </div>
                </li>
                <c:set var="i" value="${i+1}"/>
              </c:if>
            </c:forEach>
          </ul>
        </div>
      </div>

      <!-- 스터디 -->
      <div class="main-block">
        <h4 class="main-header"><i class="fa fa-comment"></i> 스터디 <a href="/StudyPaging.so?page=1"
                                                                     class="main-more-btn pull-right"><i
                class="fa fa-ellipsis-h"></i></a></h4>
        <div class="panel panel-default">
          <ul class="list-group">
            <c:forEach var="sbl" items="${requestScope.getSBoardList}" begin="1" end="10" step="1"
                       varStatus="status">
              <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                <div class="list-title-wrapper">
                  <h5 class="list-group-item-heading">
                    <a href="/StudyDetail.so?no=${sbl.no}">${sbl.title}</a>
                    <div class="list-group-item-author pull-right clearfix">
                      <div class="avatar clearfix avatar-x-small ">
                        <div class="avatar clearfix avatar-x-small ">
                          <a href="/user/info/123252" class="avatar-photo"><img
                                  src="https://ssl.pstatic.net/static/pwe/address/img_profile.png"></a>
                          <div class="avatar-info">
                            <a class="nickname" href="/user/info/123252"
                               title="${sbl.nickname}">${sbl.nickname}</a>
                            <div class="activity"><i class="fa fa-eye"></i> ${sbl.hit}
                            </div>
                            <div class="date-created"><span class="timeago"
                                                            ttitle="${sbl.writedate}"></span>

                            </div>
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

      <!-- 우측 글 1 (Tech) -->
      <div class="main-block">
        <h4 class="main-header"><i class="fa fa-comment"></i> 접속위치기반 스터디추천<a href="/StudyDetail.so"
                                                                             class="main-more-btn pull-right"><i
                class="fa fa-ellipsis-h"></i></a></h4>
        <div class="panel panel-default">
          <div class="panel-body">
            <c:set var="i" value="0"/>
            <c:forEach var="sbl" items="${requestScope.getSBoardList}" begin="1" end="100" step="1"
                       varStatus="status">
              <c:if test="${sbl.sido ne null}"> <!-- sido 정보가 존재할 때 돈다 -->
                <c:set var="sido" value="${fn:split(sbl.sido, ' ')}"/>
                <div class="article-middle-block clearfix" style="display:none;">
                  <div class="list-tag clearfix" style="">

																				<span class="list-group-item-text item-tag label label-info"
                          id="${i}_sido1">${sido[0]}</span>

                    <span class="list-group-item-text item-tag label label-gray "
                          id="${i}_sido2">${sido[1]}</span>
                    <span class="list-group-item-text item-tag label label-gray "
                          style="background-color: #0a6aa1; float: right; ">${sbl.st_category}</span>

                      <%--																<a href="/articles/tagged/aws"--%>
                      <%--																			class="list-group-item-text item-tag label label-gray "id="sido3-${i}">${sido[2]}</a>--%>
                  </div>

                  <h5>
                    <a href="/StudyDetail.so?no=${sbl.no}">${sbl.title}</a>
                  </h5>

                  <div class="list-group-item-author clearfix">

                    <div class="avatar clearfix avatar-x-small pull-right">
                      <a href="/user/info/50698" class="avatar-photo"><img
                              src="//www.gravatar.com/avatar/1b4378984e52feb7361b0ebf572cb67a?d=identicon&amp;s=10"></a>
                      <div class="avatar-info">
                        <a class="nickname" href="/user/info/50698"
                           title="${sbl.nickname}">${sbl.nickname}</a>
                        <div class="activity"><i class="fa fa-eye"></i> ${sbl.hit}</div>
                        <div class="date-created"><span class="timeago"
                                                        tttitle="${sbl.writedate}"></span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <c:set var="i" value="${i+1}"/>
              </c:if>
            </c:forEach>
          </div>
        </div>
      </div>


      <!-- 우측 글 2 (칼럼) -->
      <div class="main-block">
        <h4 class="main-header"><i class="fa fa-quote-left"></i> 칼럼 <a href="/BoardList.go"
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


      <!----------------------------------------------------------------------------------------------->
    </div>
  </div>
</body>
<jsp:include page="/WEB-INF/common/okky-footer.jsp"/>
<script>
    var contextPath = "";
    var encodedURL = "%2F";
</script>

<script src="/assets/js/application.js" type="text/javascript"></script>
<%--	<script src="/assets/js/apps/search.js" type="text/javascript"></script>--%>
<%--	<script src="/assets/js/apps/notification.js" type="text/javascript"></script>--%>

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
<script src="/assets/js/main.js" type="text/javascript"></script>

</html>