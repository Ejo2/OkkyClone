<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/common/okky-head.jsp"/>
<body>
<div class="main">
      <jsp:include page="/WEB-INF/common/okky-aside.jsp"></jsp:include>
      <div id="create-user" class="content" role="main">
            <h3 class="content-header">비밀번호 변경</h3>
            <form action="/user/updatePasswordChange" method="post">
                  <input type="hidden" name="_csrf" value="458144dc-f920-4d65-adfa-43db6a424027">
                  <div class="col-sm-8 col-sm-offset-2">
                        <div class="panel panel-default panel-margin-10">
                              <div class="panel-body panel-body-content text-center">
                                    <p class="lead">변경하실 비밀번호를 입력해 주세요.</p>
                                    <div class="form-group">
                                          <input type="password" name="password" class="form-control form-control-inline text-center" placeholder="현재 비밀번호">
                                    </div>
                                    <div class="form-group">
                                          <input type="password" name="newPassword" class="form-control form-control-inline text-center" placeholder="새 비밀번호">
                                    </div>
                                    <div class="form-group">
                                          <input type="password" name="passwordConfirm" class="form-control form-control-inline text-center" placeholder="새 비밀번호 확인">
                                    </div>
                                    <button type="submit" class="btn btn-primary">비밀번호 변경</button> <a href="/" class="btn btn-default">취소</a>
                              </div>
                        </div>
                  </div>
            </form>
      </div>
      
      <!----------------------------------------------------------------------------------------------->
      <jsp:include page="/WEB-INF/common/okky-footer.jsp"></jsp:include>
</div>
</body>
<script>
     function email_check(email) {
          
          var regex = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
          return (email != '' && email != 'undefined' && regex.test(email));
          
     }
     
     $("input[type=email]").blur(function() {
          var email = $(this).val();
          if (email == '' || email == 'undefined') return;
          if (!email_check(email)) {
               $('#verify-email-btn').attr(`disabled`, `disabled`);
               $('#verify-email-retry-btn').attr(`disabled`, `disabled`);
               $('.result-email').text('이메일 틀림 ');
               $(this).focus();
               return false;
          } else {
               $('#verify-email-btn').removeAttr('disabled');
               $('#verify-email-retry-btn').removeAttr('disabled');
               $(".result-email").text('');
          }
     });

     
     
     
    

</script>
<script src="assets/js/application.js" type="text/javascript"></script>
<script src="assets/js/search.js" type="text/javascript"></script>

<%!
      public int getRandom(){
            int random = 0;
            random = (int) Math.floor((Math.random() * (99999 - 10000 + 1))) + 10000;
            return random;
      }

%>

</html>
