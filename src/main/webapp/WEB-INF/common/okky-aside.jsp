<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="userInfo" value="${requestScope.userInfo}"/>
<!--마크업09/23 : 사이드바1-->
<style>
      .container {padding : 20px;}
      
      .form-control {width : 120px;}
      
      .popover {max-width : 400px;}
</style>
<div class="sidebar sidebar-category"> <!--open 으로 만들시 됨!-->
      <a href="javascript://" class="sidebar-header">
            <i class="fa fa-bars sidebar-header-icon"></i>
      </a>
      
      <!--1: 오키로고-->
      <h1>
            <div class="logo">
                  <a href="/main.jsp"><img src="../../assets/img/okjsp_logo.png" alt="OKKY" title="OKKY"></a>
            </div>
      </h1>
      
      <!--2: 검색로고-->
      
      
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
                              <li data-toggle="tooltip" data-container="body" title="로그인">
                                    <a href="loginGo.do" class="link"><i class="fa fa-sign-in"></i>
                                          <span class="nav-sidebar-label">로그인</span></a></li>
                              <li data-toggle="tooltip" data-container="body" title="회원가입">
                                    <a href="joinGo.do" class="link"><i class="fa fa-user"></i>
                                          <span class="nav-sidebar-label">회원가입</span></a></li>
                        </ul>
                  </div>
            </c:if>
            <%--로그인 상태인 경우 프로필 사진과 알림 & 정보수정 (로그아웃) 이동 창을 띄웁니다.--%>
            <c:if test="${not empty sessionScope.id}">
                  <div class="avatar clearfix avatar-medium ">
                        <a href="memberDetailGo.do" class='avatar-photo'><img
                                src="upload/${sessionScope.photo}"/></a>
                  </div>
                  <ul class="list-unstyled">
                        <li>
                              <a data-placement="bottom" data-toggle="popover" data-container="body" data-placement="left" type="button" data-html="true" href="#" id="setting"><span class="glyphicon glyphicon-cog" style="margin:7px 0 0 0"></span></a>
                        </li>
                        <li>
                              <a data-placement="bottom" data-toggle="popover" data-container="body" data-placement="left" type="button" data-html="true" href="#" id="notification"><span class="glyphicon glyphicon-bell" style="margin:7px 0 0 0"></span></a>
                        </li>
                              <%--팝오버 창 start--%>
                        <div id="popover-content" class="hide" role="tooltip">
                              <div class="arrow" style="top : 50%;"></div>
                              <h3 class="popover-title">설정</h3>
                              <div class="popover-footer clearfix" id="user-func-popover">
                                    <label href="logout.do" for="logoutButton" class="popover-btn"><i class="fa fa-sign-out"></i> 로그아웃</label>
                                    <a href="userInfoChange.do" class="popover-btn"><i class="fa fa-user"></i> 정보수정</a>
                              </div>
                        </div>
                              <%--알림 기능은 후순위로 미루겠습니다.--%>
                        <div id="popover-content2" class="hide" role="tooltip">
                              <div class="arrow" style="top : 50%;"></div>
                              <h3 class="popover-title">알림</h3>
                              <div class="popover-content" id="notification-popover">
                              
                              </div>
                        </div>
                              <%--팝오버 창 end--%>
                  
                  </ul>
                  <%--로그아웃--%>
                  <form action="logout.do" method="post" style="display:none;">
                        <input type="submit" name="logoutButton"
                               value="logoutButton" id="logoutButton">
                  </form>
            
            
            </c:if>
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
      
      <ul class="nav nav-sidebar nav-main">
            <!--class="active 설정이 선택된 카테고리 표시. 각자 맡은 게시판 카테고리에 설정해줄것 "-->
            <li  data-toggle="tooltip" data-placement="right" data-container="body" title="Q&A"><a
                    href="/articles/questions" class="link"><i class="nav-icon fa fa-database"></i> <span
                    class="nav-sidebar-label nav-sidebar-category-label">Q&A</span></a></li>
            <li data-toggle="tooltip" data-placement="right" data-container="body" title="Tech"><a
                    href="/articles/tech" class="link"><i class="nav-icon fa fa-code"></i> <span
                    class="nav-sidebar-label nav-sidebar-category-label">Tech</span></a></li>
            <li data-toggle="tooltip" data-placement="right" data-container="body" title="커뮤니티"><a
                    href="/articles/community" class="link"><i class="nav-icon fa fa-comments"></i> <span
                    class="nav-sidebar-label nav-sidebar-category-label">커뮤니티</span></a></li>
            <li data-toggle="tooltip" data-placement="right" data-container="body" title="칼럼"><a
                    href="BoardList.go" class="link"><i class="nav-icon fa fa-quote-left"></i> <span
                    class="nav-sidebar-label nav-sidebar-category-label">칼럼</span></a></li>
            <li data-toggle="tooltip" data-placement="right" data-container="body" title="Jobs"><a
                    href="job.do" class="link"><i
                    class="nav-icon fa fa-group"></i> <span
                    class="nav-sidebar-label nav-sidebar-category-label">Jobs</span></a></li>
      </ul>
      
      <%--깃허브 주소 링크 추가함--%>
      <ul class="nav nav-sidebar nav-bottom">
            <li data-toggle="tooltip" data-placement="right" data-container="body" title="Github Issues"><a
                    href="https://github.com/Ejo2/OkkyClone/issues" class="link" target="_blank"><i
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
            <li><a href="/articles/tech-qna" class="link"><span
                    class="nav-sidebar-label nav-sidebar-category-label">Tech Q&A</span> <span
                    class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
            <li><a href="/articles/blockchain-qna" class="link"><span
                    class="nav-sidebar-label nav-sidebar-category-label">Blockchain Q&A</span> <span
                    class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
      </ul>
      <div class="special-nav">
      </div>
</div>
<script>
     $("#setting").popover({
          html: true,
          content: function() {
               return $('#popover-content').html();
          },
     });
     $('#notification').popover({
          html: true,
          content: function() {
               return $('#popover-content2').html();
          },
     });
     

</script>
<!--마크업09/23-->
