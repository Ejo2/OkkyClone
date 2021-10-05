<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/common/okky-head.jsp"/>
<body>


<%--<c:set var="userInfo" value="${requestScope.userInfo}"/>--%>
<%--<c:set var="userInfo" value="${requestScope.totalReplyCount}"/>--%>

<div class="main">
      메인
      <%--	<c:choose>--%>
      <%--		<c:when test="${sessionScope.id !=null}">--%>
      <%--			<a class="create btn btn-success btn-wide pull-right" href="${pageContext.request.contextPath}/BoardWrite.go">--%>
      <%--				<i class="fa fa-pencil"></i> 나오냐구ㅗ</a>--%>
      <%--		</c:when>--%>
      <%--		<c:otherwise>--%>
      <%--			<a class="create btn btn-success btn-wide pull-right" href="/login.do">--%>
      <%--				<i class="fa fa-pencil"></i> ㅇ나녀오삼냐고</a>--%>
      <%--		</c:otherwise>--%>
      <%--	</c:choose>--%>
      
      <!-- 실례합니다 테스트 좀 해볼게요-->
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
                  <%--			<c:if test="${empty sessionScope.id}">--%>
                  <%--				<div class="nav-user nav-sidebar">--%>
                  <%--					<ul class="nav nav-sidebar">--%>
                  <%--						<li id="login" data-toggle="tooltip" data-container="body" title="로그인">--%>
                  <%--							<a href="loginGo.do" class="link"><i class="fa fa-sign-in"></i>--%>
                  <%--								<span class="nav-sidebar-label">로그인</span></a></li>--%>
                  <%--						<li id="join" data-toggle="tooltip" data-container="body" title="회원가입">--%>
                  <%--							<a href="joinGo.do" class="link"><i class="fa fa-user"></i>--%>
                  <%--								<span class="nav-sidebar-label">회원가입</span></a></li>--%>
                  <%--					</ul>--%>
                  <%--				</div>--%>
                  <%--			</c:if>--%>
                  
                  <!--로그인 상태일 때  -->
                  <c:if test="${not empty sessionScope.id}">
                  <div class="avatar clearfix avatar-medium ">
                        <a href="memberDetailGo.do" class="avatar-photo"><img
                                src=upload/${sessionScope.photo}"></a>
                        <div class="avatar-info">
                              <a class="nickname" href="memberDetailGo.do" title="${sessionScope.nickname}>${sessionScope.nickname}</a>
							<%--                              <a class="nickname" href="memberDetailGo.do" title="${sessionScope.nickname}">${sessionScope.nickname}</a>--%>
						<div class=" activity block"><span class="fa fa-flash"></span> 0
                        </div>
                  </div>
            </div>
            
            
            <div class="nav-user-action">
                  <!--  톱니바퀴 -->
                  <div class="nav-user-func">
                       <li id="nextli">
                       
                       </li>
                  
                  
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
            
            <li><a href="#" class="link"><i class="nav-icon fa fa-database"></i> <span
                    class="nav-sidebar-label nav-sidebar-category-label">Q&amp;A</span></a></li>
            <li><a href="#" class="link"><i class="nav-icon fa fa-code"></i> <span
                    class="nav-sidebar-label nav-sidebar-category-label">Tech</span></a></li>
            <li><a href="StudyPaging.so?page=1" class="link"><i class="nav-icon fa fa-comments"></i> <span
                    class="nav-sidebar-label nav-sidebar-category-label">스터디</span></a></li>
            <li><a href="BoardList.go" class="link"><i class="nav-icon fa fa-quote-left"></i> <span
                    class="nav-sidebar-label nav-sidebar-category-label">칼럼</span></a></li>
            <li><a href="job.do?jobType=CONTRACT" class="link"><i
                    class="nav-icon fa fa-group"></i> <span
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
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1009638">자바 웹 개발자를 위한 개발 가이드</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/163" class="avatar-photo"><img
                                                                    src="//file.okky.kr/profile/2021/1621274110514.png"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/163" title="kenu">kenu</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 56k
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-07-28 03:42:40">2달 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/890592">신입 개발자를 위한 간단한 포트폴리오 작성 팁</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/5322" class="avatar-photo"><img
                                                                    src="//www.gravatar.com/avatar/307d31079ac2364a12f843e2634b23ef?d=identicon&amp;s=10"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/5322"
                                                                     title="fender">fender</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 23k
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-03-18 12:00:37">7달 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/861866">2년차 개발자가 이직을 하면서 배우고 느낀점</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/74578" class="avatar-photo"><img
                                                                    src="//www.gravatar.com/avatar/9c98c9bdd79e83d114b61d4a85d089a7?d=identicon&amp;s=10"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/74578" title="salsal">salsal</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 1k
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-01-30 01:52:15">8달 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/856384">국비의 전체적인 문제점</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/109035" class="avatar-photo"><img
                                                                    src="//file.okky.kr/profile/2021/1614597352600.jpg"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/109035"
                                                                     title="Ormus">Ormus</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 1k
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-01-20 21:04:54">9달 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/855409">개발자로 첫 취업할 때 참고하시면 좋을 점들 (주관적)</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/44683" class="avatar-photo"><img
                                                                    src="//www.gravatar.com/avatar/d219a5d14efc8a115511cbe2c1b47b60?d=identicon&amp;s=10"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/44683"
                                                                     title="카루시아">카루시아</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 635
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-01-19 17:14:50">9달 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                        </ul>
                  </div>
            </div>
      </div>
      
      <!-- 공채속보-->
      <div class="col-sm-6 main-block-right">
            <div class="main-block">
                  <h4 class="main-header"><i class="fa fa-star"></i>공채 속보</h4>
                  <div class="panel panel-default">
                        <ul class="list-group">
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1058751">상사에게 혼난 썰 - 2</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/126889" class="avatar-photo"><img
                                                                    src="//www.gravatar.com/avatar/5004a8582d0ca1ce4bb979aa0a788662?d=identicon&amp;s=10"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/126889" title="zenitsu">zenitsu</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 44
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-09-27 13:51:31">6일 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1059946">복권.......</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/121085" class="avatar-photo"><img
                                                                    src="//www.gravatar.com/avatar/956a09b2eaeaa269776e6758e8f7a4bc?d=identicon&amp;s=10"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/121085"
                                                                     title="return null;">return null;</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 311
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-09-28 14:37:29">5일 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1061063">내일 프로젝트 철수를 합니다</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/122621" class="avatar-photo"><img
                                                                    src="//www.gravatar.com/avatar/d6726dbecf8747d2f44967da8604b4f5?d=identicon&amp;s=10"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/122621" title="jjun's">jjun's</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 46
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-09-29 14:17:34">4일 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1058315">퍼블리셔로 취업했는데 프론트 일을 시킵니다</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/128163" class="avatar-photo"><img
                                                                    src="//www.gravatar.com/avatar/4b3371dc6e50eab8969f32fc5241e9f6?d=identicon&amp;s=10"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/128163" title="비전공신입퍼블">비전공신입퍼블</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 21
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-09-27 08:39:22">6일 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1062791">퇴사 후 이직을 고민중인데 지금 상황에서 어떤 선택이 나은건지 모르겠네요</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/127985" class="avatar-photo"><img
                                                                    src="https://lh3.googleusercontent.com/a/AATXAJy9Hxp0LeAWaYNqxGqAvp77GfewR8caIm3DntnP=s96-c"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/127985" title="Jun Zio">Jun
                                                                        Zio</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 25
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-01 10:06:44">2일 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                        </ul>
                  </div>
            </div>
      </div>
      
      
      <!-- 왼쪽 덩어리 -->
      <div class="col-sm-8 main-block-left">
            
            <!-- QNA -->
            <div class="main-block">
                  <h4 class="main-header"><i class="fa fa-database"></i> Q&amp;A <a href="/articles/questions"
                                                                                    class="main-more-btn pull-right"><i
                          class="fa fa-ellipsis-h"></i></a></h4>
                  <div class="panel panel-default">
                        <ul class="list-group">
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063923">c언어 함수를 매개변수로</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/123252" class="avatar-photo"><img
                                                                    src="https://ssl.pstatic.net/static/pwe/address/img_profile.png"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/123252"
                                                                     title="웹만들래">웹만들래</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 20
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-03 17:29:29">1시간 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063922">힙정렬 알고리즘 질문입니다.</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/127777" class="avatar-photo"><img
                                                                    src="https://avatars.githubusercontent.com/u/87416787?v=4"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/127777"
                                                                     title="O1a4">O1a4</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 30
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-03 17:26:35">1시간 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063919">react에서 특정 응답에만 반응해서? 원하는 로직을 실행할 수 있나요</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/125943" class="avatar-photo"><img
                                                                    src="//www.gravatar.com/avatar/a3397181e740277e5bcd68b0736f8451?d=identicon&amp;s=10"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/125943"
                                                                     title="빡친신입">빡친신입</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 70
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-03 17:06:46">2시간 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063910">현업에서 navigator.geolocation 많이 사용하나요?</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/126561" class="avatar-photo"><img
                                                                    src="https://ssl.pstatic.net/static/pwe/address/img_profile.png"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/126561" title="novb****">novb****</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 115
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-03 16:31:53">2시간 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063908">xml 파싱인데 while문이 안돌아가는거같아요?</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/127354" class="avatar-photo"><img
                                                                    src="http://k.kakaocdn.net/dn/kuoyo/btqE0lFriSY/HITuc0iEmNKClPVc1qrQUk/img_110x110.jpg"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/127354" title="야무토">야무토</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 100
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-03 16:08:27">3시간 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063860">python pyqt5 실행시 no Qt platform plugin could be
                                                      initialized</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/128520" class="avatar-photo"><img
                                                                    src="https://lh3.googleusercontent.com/a/AATXAJyOve7g_t2ZNre621jAHBAiXSElLkU6W9TjxhdP=s96-c"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/128520"
                                                                     title="참피디피">참피디피</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 10
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-03 12:21:52">6시간 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063848">sql developer 실행</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/119077" class="avatar-photo"><img
                                                                    src="//www.gravatar.com/avatar/74ee40a0c31d5580e63780a54f5290bb?d=identicon&amp;s=10"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/119077" title="뿡빵뺑">뿡빵뺑</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 40
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-03 11:30:00">7시간 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063843">자바스크립트에서 반복문으로 window.open 여러개 실행하기</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/103989" class="avatar-photo"><img
                                                                    src="//www.gravatar.com/avatar/e4a2bf4b6d5ff8917d39af92eb010168?d=identicon&amp;s=10"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/103989"
                                                                     title="히이이익">히이이익</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 100
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-03 10:33:21">8시간 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063842">Javascript clearInterval 작동되지않는 문제 ㅠㅠ</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/124850" class="avatar-photo"><img
                                                                    src="https://phinf.pstatic.net/contact/30/2014/3/10/asrs02041_1394457337757.jpeg"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/124850"
                                                                     title="헤롱헤롱">헤롱헤롱</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 156
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-03 10:26:51">8시간 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063840">안드로이드 구글맵 동선 구현 코드 좀 봐주세요</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/128494" class="avatar-photo"><img
                                                                    src="//www.gravatar.com/avatar/3aa6cbf7884ef9e5cb0dae6a8c301ea1?d=identicon&amp;s=10"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/128494" title="어플개발공부하자">어플개발공부하자</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 50
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-03 05:31:07">13시간 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                        </ul>
                  </div>
            </div>
            
            <!-- 스터디 -->
            <div class="main-block">
                  <h4 class="main-header"><i class="fa fa-comment"></i> 커뮤니티 <a href="/articles/community"
                                                                                class="main-more-btn pull-right"><i
                          class="fa fa-ellipsis-h"></i></a></h4>
                  <div class="panel panel-default">
                        <ul class="list-group">
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063921">플러터 스터디 원 구합니다</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/126619" class="avatar-photo"><img
                                                                    src="https://lh3.googleusercontent.com/a-/AOh14Gg9kv-OfJfsCMpQrWmpTbk3WGyT272EYyiRT6im=s96-c"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/126619"
                                                                     title="모두화이팅">모두화이팅</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 138
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-03 17:22:00">1시간 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063920">토이프로젝트중에 프론트에게 api제공</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/120309" class="avatar-photo"><img
                                                                    src="https://phinf.pstatic.net/contact/20200821_152/1597982789953DTtv2_PNG/%C4%B8%C3%B3.PNG"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/120309" title="밍기이">밍기이</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 126
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-03 17:11:03">2시간 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063918">플랫폼 기반 창업을 하고 싶은데 생각이 맞는 대학생 개발자를 찾는건 불가능한
                                                      일일까요?</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/128531" class="avatar-photo"><img
                                                                    src="https://ssl.pstatic.net/static/pwe/address/img_profile.png"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/128531"
                                                                     title="창업을 하고싶은 사람">창업을 하고싶은 사람</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 10
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-03 17:02:50">2시간 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063917">밑에 학벌 글 나와서 쓰는 학벌 글</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/101046" class="avatar-photo"><img
                                                                    src="//www.gravatar.com/avatar/eb4694e3aeab19bbee57874535e11541?d=identicon&amp;s=10"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/101046" title="dlalskwk2">dlalskwk2</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 943
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-03 17:02:29">2시간 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063916">온라인 줌 기반 스프링 스터디 모임 충원</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/16774" class="avatar-photo"><img
                                                                    src="//www.gravatar.com/avatar/35fcee1bc63df32b6d44fc9881d56c1d?d=identicon&amp;s=10"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/16774" title="장플">장플</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 3k
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-03 16:56:48">2시간 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063915">취준생 방향을 잃었습니다</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/128529" class="avatar-photo"><img
                                                                    src="https://phinf.pstatic.net/contact/20180601_297/1527838446008BIEFJ_PNG/avatar_profile.png"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/128529" title="릴루">릴루</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 10
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-03 16:55:15">2시간 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063913">토이프로젝트 화면 디자인해주실 디자이너 구합니다! 연락 주시면 상세히
                                                      설명해드릴께요!!</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/121019" class="avatar-photo"><img
                                                                    src="//www.gravatar.com/avatar/8c1631e9a1091480217710cd54eaf30f?d=identicon&amp;s=10"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/121019"
                                                                     title="JIVI">JIVI</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 22
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-03 16:47:11">2시간 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063911">컴공가려고 군대에서 수능준비하는 것에 대해서</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/128528" class="avatar-photo"><img
                                                                    src="http://k.kakaocdn.net/dn/RJOAH/btrfnHl2jev/btLtePqRZwxJEqpa5i37W0/p1.jpg"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/128528"
                                                                     title="Blackchamber">Blackchamber</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 10
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-03 16:37:56">2시간 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063909">솔루션 기업 신입 첫출근</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/109048" class="avatar-photo"><img
                                                                    src="//www.gravatar.com/avatar/8445EA44F0F589128A1A748FC638ED98?d=identicon&amp;s=10"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/109048" title="포로롤">포로롤</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 225
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-03 16:26:59">2시간 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063907">퍼블리싱 스터디원 모집합니다.</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/73955" class="avatar-photo"><img
                                                                    src="//www.gravatar.com/avatar/c46b4d07dab7d21004e99839b81d951b?d=identicon&amp;s=10"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/73955" title="하루방">하루방</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 76
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-03 16:04:17">3시간 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063903">이제 막 입사했는데 자기계발로 뭘 하면 좋을까요?</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/112178" class="avatar-photo"><img
                                                                    src="//www.gravatar.com/avatar/A588F44FB5FF8CCD2473C92CA519F15B?d=identicon&amp;s=10"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/112178"
                                                                     title="닉넴이용">닉넴이용</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 331
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-03 15:44:01">3시간 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063901">공기업 전산직 스터디원 구합니다. (구의/건대입구) _ SQLD / 정처기 /코테</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/128525" class="avatar-photo"><img
                                                                    src="//www.gravatar.com/avatar/e132c6c71fa218c9b8310afadd6d6bb3?d=identicon&amp;s=10"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/128525" title="가자">가자</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 10
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-03 15:33:02">3시간 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063897">고졸 후 학점은행 다니고 있는데 진로 고민 남깁니다.</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/128522" class="avatar-photo"><img
                                                                    src="https://phinf.pstatic.net/contact/20210623_183/1624420269306pVkgy_PNG/avatar_profile.png"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/128522"
                                                                     title="JAECH">JAECH</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 10
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-03 14:21:42">4시간 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063882">개발자는 효능감을 느낄 수 있는 직업인가요?</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/125878" class="avatar-photo"><img
                                                                    src="https://lh3.googleusercontent.com/a-/AOh14GiiI6H9zCA9lxVzy2-N8E1NPnsjZjjMATrtLtD3vg=s96-c"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/125878"
                                                                     title="아무러케나">아무러케나</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 12
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-03 13:53:26">5시간 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063864">히스토리를 권력으로 아는 개발자들, 어떻게 대처하고 계시나요?</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/111870" class="avatar-photo"><img
                                                                    src="//www.gravatar.com/avatar/E32C5C137CAA90984C33CB164BAD751C?d=identicon&amp;s=10"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/111870" title="zerosugar">zerosugar</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 355
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-03 13:34:13">5시간 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063863">전공자인데 프론트엔드이신분 있나요??</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/72407" class="avatar-photo"><img
                                                                    src="//www.gravatar.com/avatar/fb18b43b9a64a48f52486c01e431084f?d=identicon&amp;s=10"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/72407"
                                                                     title="jaaa">jaaa</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 148
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-03 13:32:55">5시간 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063862">메뉴얼 만드신 분들께선 무얼로 만드셨나요?</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/126258" class="avatar-photo"><img
                                                                    src="//www.gravatar.com/avatar/b57375b33cee08e58efc84730e7445be?d=identicon&amp;s=10"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/126258" title="대마왕개발자">대마왕개발자</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 120
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-03 13:20:10">5시간 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063849">개인 블로그를 만들어보고 싶은데요</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/128331" class="avatar-photo"><img
                                                                    src="//www.gravatar.com/avatar/2772aa8b65d199428ffbf55197626969?d=identicon&amp;s=10"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/128331"
                                                                     title="dev강">dev강</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 15
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-03 11:32:26">7시간 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063841">신입으로 지원하기 위해 포트폴리오 호스팅했는데 봐주실 수 있을까요..?</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/128518" class="avatar-photo"><img
                                                                    src="https://ssl.pstatic.net/static/pwe/address/img_profile.png"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/128518"
                                                                     title="그냥sa">그냥sa</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 10
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-03 05:38:53">13시간 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063838">프로그래밍 처음 배우는 학생의 C언어 강의 수강 후기 (홍정모의 따배씨, 따라하며 배우는
                                                      C언어)</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/119813" class="avatar-photo"><img
                                                                    src="//www.gravatar.com/avatar/424434810bc97f54bd38c808cb5b3f37?d=identicon&amp;s=10"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/119813" title="sousou">sousou</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 16
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-03 03:37:47">15시간 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                        </ul>
                  </div>
            </div>
      </div>
      
      <!-- 오른쪽 덩어리 -->
      <div class="col-sm-4 main-block-right">
            
            <!-- 우측 상단 광고 배너 -->
            <div class="main-block main-block-banner">
                  <a href="/banner/stats/402" target="_k"><img src="//file.okky.kr/banner/1631771146668.jpg"></a>
            </div>
            
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
                  <h4 class="main-header"><i class="fa fa-quote-left"></i> 칼럼 <a href="/articles/columns"
                                                                                 class="main-more-btn pull-right"><i
                          class="fa fa-ellipsis-h"></i></a></h4>
                  <div class="panel panel-default">
                        <div class="panel-body">
                              <h5><a href="/article/1061602">좋은 멘토의 모습</a></h5>
                              <p class="main-block-desc">&nbsp;<a href="/article/1061602"> 안녕하세요. 좋은 개발자 부족현상이 계속되면서
                                    개발자 교육과 멘토링에 대한 관심도 커지고 있습니다. 이에 따라 개인적으로 생각하는 좋은 멘토의 모습에 대해 정리해...</a></p>
                        </div>
                  </div>
            </div>
            
            <!-- 우측 글 3 (학원/홍보) -->
            <div class="main-block">
                  <h4 class="main-header"><i class="fa fa-book"></i> 학원/홍보 <a href="/articles/promote"
                                                                              class="main-more-btn pull-right"><i
                          class="fa fa-ellipsis-h"></i></a></h4>
                  <div class="panel panel-default">
                        <ul class="list-group">
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063291">[★고용노동부 5년인증 우수훈련기관] 전액국비지원 IT 전문가 양성 모집</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/33554" class="avatar-photo"><img
                                                                    src="//www.gravatar.com/avatar/a42c146697e0b9b1dc42636192f4a2ea?d=identicon&amp;s=10"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/33554" title="아이티윌 부산교육센터">아이티윌
                                                                        부산교육센터</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 6k
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-01 15:00:27">2일 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063397">남가좌 영어과외 북가좌 초등학생 중학생 고등학생 일대일 국어과외 수학 과학 이과 문과
                                                      성적 입시관리</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/125666" class="avatar-photo"><img
                                                                    src="https://phinf.pstatic.net/contact/20210518_52/162132695594910R1y_PNG/%C4%B8%C3%B31.PNG"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/125666" title="winandwin">winandwin</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 450
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-01 16:44:48">2일 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                              <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                    <div class="list-title-wrapper">
                                          <h5 class="list-group-item-heading">
                                                <a href="/article/1063315">[국방오픈소스아카데미] 신규회원 가입 이벤트 안내</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <a href="/user/info/125235" class="avatar-photo"><img
                                                                    src="https://lh3.googleusercontent.com/a-/AOh14GhQhNnvZY1YljZj3n4mFyqGszGldovOG2t5KjNS=s96-c"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/125235" title="KOSSA_7782">KOSSA_7782</a>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 20
                                                                  </div>
                                                                  <div class="date-created"><span class="timeago"
                                                                                                  title="2021-10-01 15:30:09">2일 전</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                        </ul>
                  </div>
            </div>
      </div>
</div>
<div class="right-banner-wrapper">
      
      
      <!-- 우측광고 1 이동식-->
      <div class="right-banner">
            <%--			<a href="/banner/stats/405" target="n"><img src="//file.okky.kr/banner/1632646072967.png"--%>
            <%--			                                            style="width:160px;"></a>--%>
      </div>
      
      <!-- 우측광고 2 이동식-->
      <%--		<div class="google-ad">--%>
      <%--			<script async="" src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>--%>
      <%--			<!-- okjspad_160x500 -->--%>
      <%--			<ins class="adsbygoogle" style="display:inline-block;width:160px;height:500px"--%>
      <%--			     data-ad-client="ca-pub-8103607814406874" data-ad-slot="6573675943"--%>
      <%--			     data-adsbygoogle-status="done" data-ad-status="filled">--%>
      <%--				<ins id="aswift_0_expand" tabindex="0" title="Advertisement" aria-label="Advertisement"--%>
      <%--				     style="border: none; height: 500px; width: 160px; margin: 0px; padding: 0px; position: relative; visibility: visible; background-color: transparent; display: inline-table;">--%>
      <%--					<ins id="aswift_0_anchor"--%>
      <%--					     style="border: none; height: 500px; width: 160px; margin: 0px; padding: 0px; position: relative; visibility: visible; background-color: transparent; display: block;">--%>
      <%--						<iframe id="aswift_0" name="aswift_0"--%>
      <%--						        style="left:0;position:absolute;top:0;border:0;width:160px;height:500px;"--%>
      <%--						        sandbox="allow-forms allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation"--%>
      <%--						        width="160" height="500" frameborder="0"--%>
      <%--						        src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-8103607814406874&amp;output=html&amp;h=500&amp;slotname=6573675943&amp;adk=4104151020&amp;adf=3465364859&amp;pi=t.ma~as.6573675943&amp;w=160&amp;lmt=1633249980&amp;psa=1&amp;format=160x500&amp;url=https%3A%2F%2Fokky.kr%2F&amp;flash=0&amp;wgl=1&amp;uach=WyJXaW5kb3dzIiwiMTAuMC4wIiwieDg2IiwiIiwiOTQuMC40NjA2LjYxIixbXSxudWxsLG51bGwsIjY0Il0.&amp;tt_state=W3siaXNzdWVyT3JpZ2luIjoiaHR0cHM6Ly9hdHRlc3RhdGlvbi5hbmRyb2lkLmNvbSIsInN0YXRlIjo3fV0.&amp;dt=1633249980344&amp;bpp=9&amp;bdt=775&amp;idt=50&amp;shv=r20210928&amp;mjsv=m202109270101&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3D4278784cc95a1242-220cc21851ca00cf%3AT%3D1626325905%3ART%3D1626325905%3AS%3DALNI_MYt1Kn6iAUZgpu7SiLxBkWy36P81A&amp;correlator=4931479792519&amp;frm=20&amp;pv=2&amp;ga_vid=101483533.1626325906&amp;ga_sid=1633249980&amp;ga_hid=318252170&amp;ga_fc=1&amp;u_tz=540&amp;u_his=10&amp;u_h=1080&amp;u_w=1920&amp;u_ah=1040&amp;u_aw=1920&amp;u_cd=24&amp;u_java=0&amp;u_nplug=5&amp;u_nmime=2&amp;adx=1080&amp;ady=330&amp;biw=1054&amp;bih=782&amp;scr_x=0&amp;scr_y=0&amp;eid=31062937%2C21067496&amp;oid=2&amp;pvsid=1479478429246862&amp;pem=877&amp;eae=0&amp;fc=896&amp;brdim=311%2C92%2C311%2C92%2C1920%2C0%2C1087%2C919%2C1071%2C799&amp;vis=1&amp;rsz=%7C%7CfeE%7C&amp;abl=CF&amp;pfx=0&amp;fu=1024&amp;bc=31&amp;ifi=1&amp;uci=a!1&amp;fsb=1&amp;xpc=GsLMU8Fwwc&amp;p=https%3A//okky.kr&amp;dtd=61"--%>
      <%--						        marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true"--%>
      <%--						        scrolling="no" allowfullscreen="true" data-google-container-id="a!1"--%>
      <%--						        data-google-query-id="CPev2KfqrfMCFSiASwUdnM4ABg"--%>
      <%--						        data-load-complete="true"></iframe>--%>
      <%--					</ins>--%>
      <%--				</ins>--%>
      <%--			</ins>--%>
      <%--			<script>--%>
      <%--                (adsbygoogle = window.adsbygoogle || []).push({});--%>
      <%--			</script>--%>
      <%--		</div>--%>
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
     $(function() {
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
     $(function() {
          $('.category-sort-link').click(function(e) {
               $('#category-sort-input').val($(this).data('sort'));
               $('#category-order-input').val($(this).data('order'));
               e.preventDefault();
               $('#category-filter-form')[0].submit();
          });
     });
     $(function() {
          let url = location.href;
          let getAr0 = url.indexOf("QnA");
          let getAr1 = url.indexOf("Study");
          let getAr2 = url.indexOf("BoardList");
          let getAr3 = url.indexOf("job");
          let getAr4 = url.indexOf("join");
          let getAr5 = url.indexOf("login");
          let getAr6 = url.indexOf("main");
          
          if (getAr0 != -1) {
               $('#qna').attr("class", "active");
               $('#sub-title').html("Q&A");
          }
          if (getAr1 != -1) {
               $("#study").addClass("active");
               $('#sub-title').html("스터디");
               
          }
          if (getAr2 != -1) {
               $("#column").addClass("active");
               $('#sub-title').html("칼럼");
               
          }
          if (getAr3 != -1) {
               $("#jobs").addClass("active");
               $('#sub-title').html("JOBS");
               $('#sub-sub-title').html("");
               
               
          }
          if (getAr4 != -1) {
               $("#join").addClass("active");
               $('#sub-title').html("회원가입");
               $('#sub-sub-title').html("");
               
               
          }
          if (getAr5 != -1) {
               $("#login").addClass("active");
               $('#sub-title').html("로그인");
               $('#sub-sub-title').html("");
          }
          if (getAr6 != -1) {
               let infoChange = '<a href="userInfoChange.do" style="text-decoration-line:none "><i class="fa fa-user"></i> </a>';
               let logout = '<label href="logout.do" for="logoutButton"><i class="fas fa-sign-out-alt" style="color: white"></i> </label>';
               $('#sub-title').html("회원정보 수정").css("font-size", "17px");
               $('#sub-sub-title').html("");
               $("#setting").addClass("hide");
               $("#nextli").append(infoChange);
               $("#nextli").append(logout);
               
               
          }
          
          
     });
</script>


</html>