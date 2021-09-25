<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <title>OKKY - Q&A</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="_csrf_parameter" content="_csrf" />
    <meta name="_csrf_header" content="X-CSRF-TOKEN" />
    <meta name="_csrf" content="368a9bd7-0fda-417f-9f6e-153972649271" />
    <link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="assets/img/icon_57x57.png">
    <link rel="apple-touch-icon" sizes="114x114" href="assets/img/icon_57x57.png">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <meta property="og:image" content="https://okky.kr/assets/images/okky_logo_fb.png">
    <link rel="stylesheet" href="assets/css/asset.css">
</head>
<body>
	<jsp:include page="/WEB-INF/common/okky-aside.jsp"></jsp:include>
    <!----------------------------------------------------------------------------------------------->
    <div id="create-user" class="content" role="main">
        <div class="col-md-6 main-block-left">
            <h3 class="content-header" style="text-align: center">회원가입</h3>
            <div class="panel panel-default">
                
                <div class="panel-heading">
                    <h5 class="panel-header">이메일로 가입하기</h5>
                </div>
                
                <form action="join.do" method="post" class="form-signup form-user panel-body" id="loginForm" autocomplete="off">
                    <input type="hidden" name="_csrf" value="7907b04a-3989-4228-83bd-d76781042c9f">
                    <fieldset>
                        
                        <input type="text" name="id" class="form-control input-sm" required="" placeholder="아이디" value="" id="id">
                        <input type="text" name="nickname" class="form-control input-sm" required="" placeholder="닉네임" value="" id="nickname">
                        <input type="password" name="pw" class="form-control input-sm" required="" placeholder="비밀번호" value="" id="pw">
                        <input type="password" name="pw2" class="form-control input-sm" required="" placeholder="비밀번호 확인" value="" id="pw2">
                        <input type="text" name="email" style="width:100%;" class="form-control input-sm" required="" placeholder="이메일" value="" id="email">
                        <input type="file" name="photo" id="photo" value="파일선택" accept="image/*">
                        <%--프로필사진은 일단은 기본 이미지로 대체합니다.
                        이후 회원정보에서 프로필 사진 업로드합니다.
                        여기서는 photo에 null값으로 들어갈 예정입니다.--%>
                        
                        <div class="checkbox">
                            
                            <label>
                                <input type="checkbox" name="person.dmAllow" value="true" checked="checked">이메일 수신 동의
                            </label>
                        
                        </div>
                    
                    </fieldset>
                    
                    <div class="recaptcha-wrapper">
                        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
                        <div class="g-recaptcha" data-sitekey="6Lcvw_gSAAAAAH3zOofJBJOFLpmjx7Vq3hxnYIRw"></div>
                    </div>
                    
                    <button class="btn btn-primary btn-block" type="submit">아래 약관을 동의하며 계정 생성</button>
                    
                    <div class="signup-block">
                        <a href="/user/agreement" data-toggle="modal" data-target="#userAgreement">회원가입약관</a>
                        <span class="inline-saperator">/</span>
                        <a href="/user/privacy" data-toggle="modal" data-target="#userPrivacy">개인정보취급방침</a>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-6 main-block-right">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h5 class="panel-header">SNS로 가입하기</h5>
                </div>
                <div class="panel-body panel-margin sns-buttons">
                    <a href="/oauth2/authorization/github" id="github-connect-link" class="btn btn-github btn-block">
                        <span class="icon-social icon-github"></span>Sign in with GitHub</a>
                    <a href="/oauth2/authorization/google" id="google-connect-link" class="btn btn-google btn-block">
                        <span class="icon-social icon-google"></span>Sign in with Google</a>
                    <a href="/oauth2/authorization/facebook" id="facebook-connect-link" class="btn btn-facebook btn-block">
                        <span class="icon-social icon-facebook"></span>Sign in with Facebook</a>
                    <a href="/oauth2/authorization/kakao" id="kakao-connect-link" class="btn btn-kakao btn-block">
                        <span class="icon-social icon-kakao"></span>Sign in with Kakao</a>
                    <a href="/oauth2/authorization/naver" id="naver-connect-link" class="btn btn-naver btn-block">
                        <span class="icon-social icon-naver"></span>Sign in with NAVER</a>
                </div>
            </div>
        </div>
    
    </div>
    
	
    <!----------------------------------------------------------------------------------------------->
    <jsp:include page="/WEB-INF/common/okky-footer.jsp"></jsp:include>
</body>
<script>
    var contextPath = "";
    var encodedURL = "%2Farticles%2Fquestions";
</script>

<script src="assets/js/application.js" type="text/javascript"></script>
<script src="assets/js/search.js" type="text/javascript"></script>
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
</html>