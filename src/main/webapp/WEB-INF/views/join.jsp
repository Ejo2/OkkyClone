<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/common/okky-head.jsp"/>

<body>
<div class="main">
      
      <jsp:include page="/WEB-INF/common/okky-aside.jsp"></jsp:include>
      
      <!----------------------------------------------------------------------------------------------->
      <div id="create-user" class="container" role="main">
            
            <div class="col-sm-6">
                  <h3 class="content-header" style="text-align: center">회원가입</h3>
                  <div class="panel panel-default">
                        
                        <div class="panel-heading">
                              <h5 class="panel-header">이메일로 가입하기</h5>
                        </div>
                        
                        <form action="join.do" method="post" class="form-signup form-user panel-body" id="loginForm" autocomplete="off">
                              <input type="hidden" name="_csrf" value="7907b04a-3989-4228-83bd-d76781042c9f">
                              <fieldset>
                                    
                                    <input style="width: 100%"  type="text" name="id" class="form-control input-sm" required="" placeholder="아이디" value="" id="id">
                                    <input style="width: 100%" type="text" name="nickname" class="form-control input-sm" required="" placeholder="닉네임" value="" id="nickname">
                                    <input style="width: 100%" type="password" name="pw" class="form-control input-sm" required="" placeholder="비밀번호" value="" id="pw">
                                    <input style="width: 100%"  type="password" name="pw2" class="form-control input-sm" required="" placeholder="비밀번호 확인" value="" id="pw2">
                                    <input  type="text" name="email" style="width:100%;" class="form-control input-sm" required="" placeholder="이메일" value="" id="email">
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