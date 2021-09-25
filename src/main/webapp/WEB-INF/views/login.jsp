<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>


<!DOCTYPE html >
<!--[if lt IE 7 ]> <html lang="ko" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]> <html lang="ko" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]> <html lang="ko" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]> <html lang="ko" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="ko" class="no-js"><!--<![endif]-->
<head>
      <meta charset="utf-8">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
      <title>OKKY - All That Developer</title>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta name="_csrf_parameter" content="_csrf"/>
      <meta name="_csrf_header" content="X-CSRF-TOKEN"/>
      <meta name="_csrf" content="912b72dc-a23d-4297-b034-b86be004b5ac"/>
      <link rel="shortcut icon" href="/assets/images/favicon.ico" type="image/x-icon">
      <link rel="apple-touch-icon" href="/assets/images/icon_57x57.png">
      <link rel="apple-touch-icon" sizes="114x114" href="/images/icon_114x114.png">
      <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
      <meta property="og:image" content="https://okky.kr/assets/images/okky_logo_fb.png">
      
      <link rel="stylesheet" href="/assets/css/application.css">
      <script>(function(w, d, s, l, i) {
           w[l] = w[l] || [];
           w[l].push({
                'gtm.start':
                     new Date().getTime(), event: 'gtm.js'
           });
           var f = d.getElementsByTagName(s)[0],
                j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : '';
           j.async = true;
           j.src =
                'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
           f.parentNode.insertBefore(j, f);
      })(window, document, 'script', 'dataLayer', 'GTM-M52CW55');
      
      
      </script>
      
      <!--[if lt IE 9]>
      <script src="/js/libs/html5.js"></script>
      <script src="/assets/libs/respond.src.js"></script>
      <script src="/assets/libs/html5.js"></script>
      <![endif]-->
      
      <link rel="stylesheet" href="/assets/css/APW-style.css">

</head>
<body>
<div class="layout-container">
      <div class="main ">
            <div class="sidebar ">
                  <a href="javascript://" class="sidebar-header">
                        <i class="fa fa-bars sidebar-header-icon"></i>
                  </a>
                  
                  <h1>
                        <div class="logo"><a href="/"><img src="/assets/images/okjsp_logo.png" alt="OKKY" title="OKKY"></a>
                        </div>
                  </h1>
                  
                  <ul id="search-google-icon" class="nav nav-sidebar nav-sidebar-search-wrapper">
                        <li class="nav-sidebar-search">
                              <a href="javascript://" class="link" id="search-google" data-toggle="popover" data-trigger="click"><i class="fa fa-search"></i></a>
                        </li>
                  </ul>
                  
                  <form id="search-google-form" name="searchMain" class="nav-sidebar-form" action="https://www.google.com/search">
                        <div class="input-group">
                              <input type="text" name="qt" class="form-control input-sm" placeholder="Google 검색"/>
                              <input type="hidden" name="q"/>
                              <span class="input-group-btn">
                <button class="btn btn-default btn-sm" type="submit"><i class="fa fa-search"></i></button>
                              </span>
                        </div>
                  </form>
                  
                  <div class="nav-user nav-sidebar">
                        <ul class="nav nav-sidebar">
                              <li>
                                    <a href="/login/auth?redirectUrl=%2Flogin%2Fauth" class="link"><i class="fa fa-sign-in"></i>
                                          <span class="nav-sidebar-label">로그인</span></a></li>
                              <li><a href="/user/register" class="link"><i class="fa fa-user"></i>
                                    <span class="nav-sidebar-label">회원가입</span></a></li>
                        </ul>
                  </div>
                  
                  <ul class="nav nav-sidebar nav-main">
                        
                        <li><a href="/articles/questions" class="link"><i class="nav-icon fa fa-database"></i>
                              <span class="nav-sidebar-label nav-sidebar-category-label">Q&A</span></a></li>
                        <li><a href="/articles/tech" class="link"><i class="nav-icon fa fa-code"></i>
                              <span class="nav-sidebar-label nav-sidebar-category-label">Tech</span></a></li>
                        <li><a href="/articles/community" class="link"><i class="nav-icon fa fa-comments"></i>
                              <span class="nav-sidebar-label nav-sidebar-category-label">커뮤니티</span></a></li>
                        <li><a href="/articles/columns" class="link"><i class="nav-icon fa fa-quote-left"></i>
                              <span class="nav-sidebar-label nav-sidebar-category-label">칼럼</span></a></li>
                        <li>
                              <a href="/articles/recruit?filter.jobType=CONTRACT" class="link"><i class="nav-icon fa fa-group"></i>
                                    <span class="nav-sidebar-label nav-sidebar-category-label">Jobs</span></a></li>
                  </ul>
                  
                  <ul class="nav nav-sidebar nav-bottom">
                        <li>
                              <a href="https://github.com/okjsp/okky/issues" class="link" target="_blank"><i class="fa fa-github"></i>
                                    <span class="nav-sidebar-label nav-sidebar-category-label">Github Issues</span></a>
                        </li>
                  </ul>
            </div>
            
            <div id="edit-user" class="content" role="main">
                  <h3 class="content-header">로그인</h3>
                  <div class="col-md-6 main-block-left">
                        <div class="panel panel-default">
                              <div class="panel-heading">
                                    <h5 class="panel-header">아이디 로그인</h5>
                              </div>
                              
                              <form action='/login/auth' class="form-signin form-user panel-body panel-margin" method='POST' id='loginForm' autocomplete='off'>
                                    <input type="text" name="username" autocorrect="off" autocapitalize="off" id="username" class="username form-control input-sm" placeholder="아이디" required autofocus>
                                    <input type="password" name='password' class="password form-control input-sm" placeholder="비밀번호" required>
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
                                    <div id="divOTPLogin">
                                          <button class="btn btn-primary btn-block" type="button" id="btnOTPLogin">AutoPassword™ 로그인</button>
                                          <div class="btn btn-primary btn-block APW-login-cancel" id="btnOTPCancel">
                                                <a href="#;">취소</a>
                                          </div>
                                    </div>
                                    <div class="signup-block">
                                          <a href="/find/user/index">계정 찾기</a>
                                          <span class="inline-saperator">/</span>
                                          <a href="/user/register">회원 가입</a>
                                    </div>
                              </form>
                        </div>
                  </div>
                  <div class="col-md-6 main-block-right">
                        <div class="panel panel-default">
                              <div class="panel-heading">
                                    <h5 class="panel-header">SNS 로그인</h5>
                              </div>
                              <div class="panel-body panel-margin sns-buttons">
                                    <a onclick="kakaoLogin()" href="#" id="github-connect-link" class="btn btn-github btn-block">
                                          <span class="icon-social icon-github"></span>Login with GitHub</a>
                                    <a href="/oauth2/authorization/google" id="google-connect-link" class="btn btn-google btn-block">
                                          <span class="icon-social icon-google"></span>Login with Google</a>
                                    <a href="/oauth2/authorization/facebook" id="facebook-connect-link" class="btn btn-facebook btn-block">
                                          <span class="icon-social icon-facebook"></span>Login with Facebook</a>
                                    <a href="javascript:kakaoLogin();"><img src="https://developers.kakao.com/tool/resource/static/img/button/login/full/ko/kakao_login_medium_narrow.png"/></a>
                                    <a href="/oauth2/authorization/naver" id="naver-connect-link" class="btn btn-naver btn-block">
                                          <span class="icon-social icon-naver"></span>Login with NAVER</a>
                              </div>
                        </div>
                  </div>
            
            </div>
            <div class="right-banner-wrapper">
            </div>
            <div id="footer" class="footer" role="contentinfo">
                  <div class="row">
                        <div class="col-sm-9">
                              <div style="float: left;margin-right: 10px;height:100px;">
                                    <img src="/assets/images/okky_logo_footer.png" alt="footer">
                              </div>
                              <div>
                                    <a href="/intro/about">About OKKY</a>
                                    | <a href="/user/privacy" data-toggle="modal" data-target="#userPrivacy">개인정보보호</a>
                                    | <a href="/intro/ad">광고문의</a>
                                    | <a href="mailto:info@okky.kr">Contact</a>
                                    | <a href="https://www.facebook.com/okky.sns" target="_blank">Facebook</a>
                                    | <a href="https://github.com/okjsp/okky" target="_blank">Github</a> v1.5.4
                                    <hr style="margin: 8px 0;"/>
                                    <strong>상호명</strong> : 이브레인 | <strong>대표명</strong> : 노상범 |
                                    <strong>사업자등록번호</strong> : 144-81-32887 | <strong>문의</strong> : info@okky.kr
                                    <br/> <strong>주소</strong> : 서울 강남구 봉은사로 303 TGL경복빌딩 502호 (06103)
                                    <br/> @ 2021 <a href="http://www.ebrain.kr" target="_blank">eBrain Management</a>
                              </div>
                        </div>
                        <div class="sponsor-banner col-sm-3">
                              <div class="sponsor-banner-head">Sponsored by</div>
                              <div class="sponsor-banner-images">
                                    <a href="https://www.inames.co.kr" target="_blank"><img src="/assets/images/spb_inames.png" alt="아이네임즈"></a>
                                    <a href="https://www.toast.com/" target="_blank"><img src="/assets/images/spb_nhncloud.png" alt="NHN Cloud"></a>
                              </div>
                        </div>
                  </div>
            </div>
      </div>
</div>
<script>
     var contextPath = "";
     var encodedURL = "%2Flogin%2Fauth";
</script>

<script src="/assets/js/application.js" type="text/javascript"></script>
<script src="/assets/js/apps/search.js" type="text/javascript"></script>
<script src="/assets/js/libs/jquery.progressTimer.js" type="text/javascript"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>


<script type='text/javascript'>
     Kakao.init('6ce319634eee8d2d2756b025582042a4');
     Kakao.isInitialized();
     
     console.log("Kakao.isInitialized()", Kakao.isInitialized());
     
     function kakaoLogin() {
          window.Kakao.Auth.login({
               scope: 'profile_image,profile_nickname,account_email,gender',
               success:function(authObj){
                    console.log(authObj);
                    window.Kakao.API.request({
                         url: '/v2/user/me',
                         success: res => {
                              const kakao_account = res.kakao_account;
                              console.log(kakao_account);
                              
                         },
                    });
               }
          });
     }
     
     (function() {
          document.forms['loginForm'].elements['username'].focus();
          
          $("[name=j_password]").show();
          $(".AutoPassword-bar").hide();
          $("[id=divUserLogin]").show();
          $("[id=divOTPLogin]").hide();
          $("[id=btnOTPLogin]").hide();
          $("[id=btnOTPCancel]").hide();
          
          
          //이벤트 function
          $("[id=btnAutoPW]").click(function(e) {
               if ($(this).is(":checked") == true) {
                    $("[name=password]").hide();
                    $(".AutoPassword-bar").show();
                    $("[id=divUserLogin]").hide();
                    $("[id=divOTPLogin]").show();
                    $("[id=btnOTPLogin]").show();
                    $("[id=btnOTPCancel]").hide();
               } else {
                    $("[name=password]").show();
                    $(".AutoPassword-bar").hide();
                    $("[id=divUserLogin]").show();
                    $("[id=divOTPLogin]").hide();
                    $("[id=btnOTPLogin]").hide();
                    $("[id=btnOTPCancel]").hide();
               }
          });
          
          $("[id=btnAdd]").click(function(e) {
               location.href = "./joinStep.jsp";
          });
          
          // * AutoPassword 관련 script 시작 ##########################################
          var popMode = "1"; //default
          var agent = navigator.userAgent;
          if (/ipad/i.test(agent) || /iphone/i.test(agent) || /Android/i.test(agent)) { //팝업사용처리
               popMode = "0";
          }
          $("#btnOTPLogin").click(function(e) {	//버튼의 ID
               $.ajax({
                    url: "/autoPassword/loginUrl?redirectUrl=&popMode=" + popMode + "&userId=" + $("#username").val(),  //reqtoken 생성 URL. popMode.
                    cache: false,
                    success: function(data) {
                         var url = $.trim(data);
                         if ("0" == popMode) {
                              location.href = url;
                         } else {
                              var name = "Lifein 오토패스워드 로그인";
                              var option = "width = 500, height = 800, top = 100, left = 200, location = no";
                              window.open(url, name, option);
                         }
                    },
                    fail: function(e) {
                         alert("에러:" + e.message);
                    }
               });
          });
     })();
</script>

<div id="userPrivacy" class="modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
      <div class="modal-dialog">
            <div class="modal-content">
            </div>
      </div>
</div>

<div id="userAgreement" class="modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
      <div class="modal-dialog">
            <div class="modal-content">
            </div>
      </div>
</div>

</body>
</html>
