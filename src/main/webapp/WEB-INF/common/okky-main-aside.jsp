<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="userInfo" value="${requestScope.userInfo}"/>
<!--마크업09/23 : 사이드바1-->

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
                              <a class="nickname" href="memberDetailGo.do" title="신지혜20">${sessionScope.nickname}</a>
                        </div>
                  </div>
                  
                  
                  <div class="nav-user-action">
                        <!--  톱니바퀴 -->
                        <div id="nextdiv" class="nav-user-func">
                              <a href="userInfoChange.do" style="text-decoration-line:none "><i class="fa fa-user"></i>
                              </a>
                              <br>
                              <a href="logout.do" style="text-decoration-line: none"><i class="fas fa-sign-out-alt" style="color: white"></i> </a>
                        </label>
                        
                        
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
            
            <li><a href="QnAList.qo" class="link"><i class="nav-icon fa fa-database"></i> <span
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
               
               
          });
          
          
     });

</script>
<!--마크업09/23-->





































