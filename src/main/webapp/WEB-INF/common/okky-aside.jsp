<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

      <!--마크업09/23 : 사이드바1-->
      <div class="sidebar sidebar-category"> <!--open 으로 만들시 됨!-->
            <a href="javascript://" class="sidebar-header">
                  <i class="fa fa-bars sidebar-header-icon"></i>
            </a>
            
            <!--1: 오키로고-->
            <h1>
                  <div class="logo"><a href="/main.jsp"><img src="../../assets/img/okjsp_logo.png" alt="OKKY" title="OKKY"></a>
                  </div>
            </h1>
            
            <!--2: 검색로고-->
            <ul id="search-google-icon" class="nav nav-sidebar nav-sidebar-search-wrapper">
                  <li class="nav-sidebar-search"><a href="javascript://" class="link" id="search-google"
                                                    data-toggle="popover" data-trigger="click"><i class="fa fa-search"></i></a>
                  </li>
            </ul>
            
            <!--2-1: 반응형으로 작아졌을때 검색창-->
            <form id="search-google-form" name="searchMain" class="nav-sidebar-form"
                  action="https://www.google.com/search">
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
                  <c:if test="${empty sessionScope.id}">
                        <div class="nav-user nav-sidebar">
                              <ul class="nav nav-sidebar">
                                    <li data-toggle="tooltip" data-container="body" title="로그인"><a href="loginGo.do" class="link"><i class="fa fa-sign-in"></i> <span class="nav-sidebar-label">로그인</span></a></li>
                                    <li data-toggle="tooltip" data-container="body" title="회원가입"><a href="joinGo.do" class="link"><i class="fa fa-user"></i> <span class="nav-sidebar-label">회원가입</span></a></li>
                              </ul>
                        </div>
                  </c:if>
                  
                  <c:if test="${not empty sessionScope.id}">
                        <div class="avatar clearfix avatar-medium ">
                              <a href="memberDetailGo.do" class='avatar-photo'><img
                                      src="/assets/img/bros_blank.jpg"/></a>
                        </div>
                        <div class="nav-user-action">
                              <div class="nav-user-func">
                                    <a href="javascript://" id="user-func" data-toggle="popover" data-trigger="click"
                                       tabindex="0">
                                          <i id="user-func-icon" class="fa fa-cog"></i>
                                    </a>
                              </div>
                              <div class="nav-user-func">
                                    <a href="javascript://" id="user-notification" data-toggle="popover" data-trigger="click"
                                       tabindex="0">
                                          <i id="user-notification-icon" class="fa fa-bell"></i>
                                          <span id="user-notification-count" class="badge notification"
                                                style="display:none;">1</span>
                                    </a>
                              </div>
                        </div>
                        <form action="logout.do" method="post" style="display:none;">
                              <input type="submit" name="logoutButton"
                                     value="logoutButton" id="logoutButton">
                        </form>
                        
                        <script id="setting-template" type="text/template">
                              <div class="popover popover-fixed" role="tooltip">
                                    <div class="arrow"></div>
                                    <h3 class="popover-title"></h3>
                                    <div class="popover-footer clearfix" id="user-func-popover">
                                          <label href="logout.do" for="logoutButton" class="popover-btn"><i class="fa fa-sign-out"></i> 로그아웃</label>
                                          <a href="/user/edit" class="popover-btn"><i class="fa fa-user"></i> 정보수정</a>
                                    </div>
                              </div>
                        </script>
                        
                        
                        <script id="notification-template" type="text/template">
                              <div class="popover popover-fixed" role="tooltip">
                                    <div class="arrow"></div>
                                    <h3 class="popover-title"></h3>
                                    <div class="popover-content" id="notification-popover"></div>
                              </div>
                        </script>
                  </c:if>
                  
                  <script id="search-google-template" type="text/template">
                        <div class="popover popover-fixed" role="tooltip">
                              <div class="arrow"></div>
                              <h3 class="popover-title">Google 검색</h3>
                              <div class="popover-content" id="search-google-popover">
                                    <form id="search-google-form" name="searchMain" class="nav-sidebar-form" action="https://www.google.com/search" onsubmit="searchMain.q.value='site:okky.kr '+searchMain.qt.value;">
                                          <div class="input-group">
                                                <input type="text" name="qt" class="form-control input-sm" placeholder="Google 검색"/>
                                                <input type="hidden" name="q"/>
                                                <span class="input-group-btn">
                                    <button class="btn btn-default btn-sm" type="submit"><i class="fa fa-search"></i></button>
                                </span>
                                          </div>
                                    </form>
                              </div>
                        </div>
                  </script>
            </div>
            <ul class="nav nav-sidebar nav-main">
                  <!--class="active 설정이 선택된 카테고리 표시. 각자 맡은 게시판 카테고리에 설정해줄것 "-->
                  <li class="active" data-toggle="tooltip" data-placement="right" data-container="body" title="Q&A"><a
                          href="/articles/questions" class="link"><i class="nav-icon fa fa-database"></i> <span
                          class="nav-sidebar-label nav-sidebar-category-label">Q&A</span></a></li>
                  <li data-toggle="tooltip" data-placement="right" data-container="body" title="Tech"><a
                          href="/articles/tech" class="link"><i class="nav-icon fa fa-code"></i> <span
                          class="nav-sidebar-label nav-sidebar-category-label">Tech</span></a></li>
                  <li data-toggle="tooltip" data-placement="right" data-container="body" title="커뮤니티"><a
                          href="/articles/community" class="link"><i class="nav-icon fa fa-comments"></i> <span
                          class="nav-sidebar-label nav-sidebar-category-label">커뮤니티</span></a></li>
                  <li data-toggle="tooltip" data-placement="right" data-container="body" title="칼럼"><a
                          href="/articles/columns" class="link"><i class="nav-icon fa fa-quote-left"></i> <span
                          class="nav-sidebar-label nav-sidebar-category-label">칼럼</span></a></li>
                  <li data-toggle="tooltip" data-placement="right" data-container="body" title="Jobs"><a
                          href="job.do" class="link"><i
                          class="nav-icon fa fa-group"></i> <span
                          class="nav-sidebar-label nav-sidebar-category-label">Jobs</span></a></li>
            </ul>
            
            <ul class="nav nav-sidebar nav-bottom">
                  <li data-toggle="tooltip" data-placement="right" data-container="body" title="Github Issues"><a
                          href="https://github.com/okjsp/okky/issues" class="link" target="_blank"><i
                          class="fa fa-github"></i> <span
                          class="nav-sidebar-label nav-sidebar-category-label">Github Issues</span></a></li>
            </ul>
      </div>
      <!--마크업09/23사이드바2-->
      <div class="sidebar-category-nav">
            <h3 class="sub-title">Q&A</h3>
            <ul class="nav">
                  <!--class ="nav-selected가 선택되고 있다는 표시의 빨간점. 각자 맡은 게시판 카테고리에 설정해줄것"-->
                  <li><a href="/articles/questions" class="link"><span
                          class="nav-sidebar-label nav-sidebar-category-label">All</span> <span
                          class="nav-indicator nav-selected"><span class="nav-selected-dot"></span></span></a>
                  </li>
            </ul>
            <div class="special-nav">
            </div>
      </div>
      
      <!--마크업09/23-->
