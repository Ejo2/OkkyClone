<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/common/okky-head.jsp"/>

<body>
<div class="main">
      <jsp:include page="/WEB-INF/common/okky-aside.jsp"></jsp:include>
      <!----------------------------------------------------------------------------------------------->
      <div class="container">
            <h3 class="content-header">로그인</h3>
            <div class="col-md-6 main-block-left">
                  <div class="panel panel-default">
                        <div class="panel-heading">
                              <h5 class="panel-header">아이디 로그인</h5>
                        </div>
                        
                        <form action='login.do' class="form-signin form-user panel-body panel-margin" method='POST' id='loginForm' autocomplete='off'>
                              <input type="text" name="id" autocorrect="off" autocapitalize="off" id="id" class="username form-control input-sm" placeholder="아이디" required autofocus>
                              <input type="password" name='pw' class="password form-control input-sm" placeholder="비밀번호" required>
                              <div class="checkbox">
                                    <label>
                                          <input type="checkbox" name="remember_me" id="remember_me"> 로그인 유지
                                    </label>
                              </div>
                              <!-- AutoPassword 추가 -->
                              <div class="APW-login">
                                    <span>AutoPassword&trade;</span>
                                    <label class="switch">
                                          <input type="checkbox" id="btnAutoPW">
                                          <span class="slider round"></span>
                                    </label>
                              </div>
                              
                              <!--button class="btn btn-primary btn-block" type="submit"><g:message code="springSecurity.login.button"/></button-->
                              
                              <div id="divUserLogin">
                                    <button class="btn btn-primary btn-block" type="submit" id="btnUserLogin">로그인</button>
                              </div>
                              
                              <div class="signup-block">
                                    <a href="/find/user/index">계정 찾기</a>
                                    <span class="inline-saperator">/</span>
                                    <a href="joinGo.do">회원 가입</a>
                              </div>
                        </form>
                  </div>
            </div>
            
      </div>
      
      <!----------------------------------------------------------------------------------------------->
      <jsp:include page="/WEB-INF/common/okky-footer.jsp"></jsp:include>
</div>
</body>
<script>
     var contextPath = "";
     var encodedURL = "%2Farticles%2Fquestions";
</script>

<script src="assets/js/application.js" type="text/javascript"></script>
<script src="assets/js/search.js" type="text/javascript"></script>
<script>
     $(function() {
          $('.category-sort-link').click(function(e) {
               $('#category-sort-input').val($(this).data('sort'));
               $('#category-order-input').val($(this).data('order'));
               e.preventDefault();
               $('#category-filter-form')[0].submit();
          });
     });
</script>
</html>
