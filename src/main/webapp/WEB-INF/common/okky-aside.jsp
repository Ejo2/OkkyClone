<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="userInfo" value="${requestScope.userInfo}"/>
<!--마크업09/23 : 사이드바1-->
<style>
      /* css 삭제*/
      /*.container {padding : 20px;}*/
      
      /*.form-control {width : 120px;}*/
      
      /*.popover {max-width : 400px;}*/
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
            <%--로그인 상태인 경우 프로필 사진과 알림 & 정보수정 (로그아웃) 이동 창을 띄웁니다.--%>
            <c:if test="${not empty sessionScope.id}">
                  <div class="avatar clearfix avatar-medium ">
                        <a href="memberDetailGo.do" class='avatar-photo'>
<%--   20211003 지혜 : 404 오류 임시   주석        --%>
<%--                <img--%>
<%--                                src="upload/${sessionScope.photo}"/></a>--%>
                  </div>
                  <ul class="list-unstyled">
                        <li>
                              <a data-placement="bottom" data-toggle="popover" data-container="body" data-placement="left" type="button" data-html="true" href="javascript:void(0)" id="setting"><i class="fas fa-cog" style="margin-top: 7px"></i></a>
                        </li>
                        <li>
                              <a data-placement="bottom" data-toggle="popover" data-container="body" data-placement="left" type="button" data-html="true" href="javascript:void(0)" id="notification"><i class="fas fa-bell" style="margin-top: 7px"></i></a>
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
      
      <ul id="activeMenu" class="nav nav-sidebar nav-main">
            <!--class="active 설정이 선택된 카테고리 표시. 각자 맡은 게시판 카테고리에 설정해줄것 "-->
            <li id="qna" data-toggle="tooltip" data-placement="right" data-container="body" title="Q&A"><a
                    href="/QnAList.qo" class="link"><i class="nav-icon fa fa-database"></i> <span
                    class="nav-sidebar-label nav-sidebar-category-label">Q&A</span></a></li>
            <li id="tech" data-toggle="tooltip" data-placement="right" data-container="body" title="Tech"><a
                    href="#" class="link"><i class="nav-icon fa fa-code"></i> <span
                    class="nav-sidebar-label nav-sidebar-category-label">Tech</span></a></li>
            <li id="study" data-toggle="tooltip" data-placement="right" data-container="body" title="스터디"><a
                    href="/StudyPaging.so?page=1" class="link"><i class="nav-icon fa fa-comments"></i> <span
                    class="nav-sidebar-label nav-sidebar-category-label">스터디</span></a></li>
            <li id="column" data-toggle="tooltip" data-placement="right" data-container="body" title="칼럼"><a
                    href="BoardList.go" class="link"><i class="nav-icon fa fa-quote-left"></i> <span
                    class="nav-sidebar-label nav-sidebar-category-label">칼럼</span></a></li>
            <li id="jobs" data-toggle="tooltip" data-placement="right" data-container="body" title="Jobs"><a
                    href="job.do?jobType=CONTRACT" class="link"><i
                    class="nav-icon fa fa-user-friends"></i> <span
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
      <h3 id="sub-title" class="sub-title"></h3>
      <ul id="sub-sub-title" class="nav">
            <!--class ="nav-selected가 선택되고 있다는 표시의 빨간점. 각자 맡은 게시판 카테고리에 설정해줄것"-->
      
      </ul>
      <div class="special-nav">
      </div>
</div>
<!--<script src="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>-->
<script>
     $.noConflict();
     jQuery(document).ready(function() {
          jQuery("#setting").popover({
               html: true,
               content: function() {
                    return $('#popover-content').html();
               },
          });
     
          jQuery('#notification').popover({
               html: true,
               content: function() {
                    return $('#popover-content2').html();
               },
          });
     });
</script>
<script>
   

     
     $(document).ready(function() {
           /*해당 메뉴 클릭시 active 부여 (구버전)*/
           /*console.log($('#activeMenu').children('li').attr("class"));
            $('#activeMenu > li').click(function(e) {
            
            console.log(e.target);
            console.log($('#activeMenu').children('li').children('a'));
            let a = $('#activeMenu').children('li').children('a');
            console.log(a);
            console.log(a[0]);
            console.log('this : ' + $(this).attr("class"));
            
            if ($(this).attr("class") == undefined || $(this).attr("class") == "")
            {
            $('#activeMenu').children('li').attr("class", "");
            $(this).attr("class", "active");
            } else {
            
            }
            
            });*/
           /*게시판 이동시 해당 메뉴에 active 효과 부여 >> 이동 단계에서 url 로 active 주는 방식*/
           /*sub-sub-title에 해당하는 메뉴들을 html 형식으로 추가해주시면 됩니다.*/
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
                    $('#sub-sub-title').html("")
                    
                    
               }
               if (getAr4 != -1) {
                    $("#join").addClass("active");
                    $('#sub-title').html("회원가입");
                    $('#sub-sub-title').html("")
                    
                    
               }
               if (getAr5 != -1) {
                    $("#login").addClass("active");
                    $('#sub-title').html("로그인");
                    $('#sub-sub-title').html("")
                    
                    
               }
               if (getAr6 != -1) {
                    $('#sub-title').html("메인화면");
                    $('#sub-sub-title').html("")
                    
                    
               }
               
               
          });
          
          
          
          
     });

</script>
<!--마크업09/23-->





































