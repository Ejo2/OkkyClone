<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/common/okky-head.jsp"/>
<body>
<div class="main">
      <c:set var="myPwd" value="${requestScope.myPwd}"/>
      <jsp:include page="/WEB-INF/common/okky-aside.jsp"></jsp:include>
      <div id="create-user" class="content" role="main">
            <h3 class="content-header">비밀번호 변경</h3>
            <form id="changeForm" action="" method="post">
                  <input type="hidden" name="_csrf" value="458144dc-f920-4d65-adfa-43db6a424027">
                  <div class="col-sm-8 col-sm-offset-2">
                        <div class="panel panel-default panel-margin-10">
                              <div class="panel-body panel-body-content text-center">
                                    <p class="lead">변경하실 비밀번호를 입력해 주세요.</p>
                                    <div class="form-group">
                                          <input style="width: 100%;" type="password" name="password" class="form-control form-control-inline text-center" placeholder="현재 비밀번호">
                                    </div>
                                    <div class="form-group">
                                          <input style="width: 100%;"  id="pw" type="password" value="" name="newPassword" class="form-control form-control-inline text-center" placeholder="새 비밀번호 : 대 소문자 특수문자 포함 8 ~16">
                                    </div>
                                    <div class="form-group">
                                          <input style="width: 100%;" id="pw2" type="password" value="" name="passwordConfirm" class="form-control form-control-inline text-center" placeholder="새 비밀번호 확인">
                                          <font name="checkpw"></font>
                                    </div>
                                    <button id="changeSubmit" type="submit" class="btn btn-primary">비밀번호 변경</button>
                                    <a href="javascript:history.back()" class="btn btn-default">취소</a>
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
     let myPwd = "${myPwd}";
     console.log(myPwd);
     $(function() {
          $('#changeForm').removeAttr("action");
          $('#changeSubmit').click(function() {
               if ($('input[name=password]').val() == '') {
                    alert('현재 비밀번호를 입력해주세요');
               } else if ($('input[name=newPassword]').val() == '' || $('input[name=passwordConfirm]').val() == '') {
                    alert('변경할 비밀번호를 입력해주세요');
               } else {
                    $('#changeForm').attr("action","updatePwd.do");
     
               }
               
               
          
          });
          
          $(`input[name=password]`).blur(function() {
               if ($(`input[name=password]`).val() != myPwd) {
                    console.log($('input[name=password]').val());
                    console.log(myPwd);
                    
                    $(`input[name=password]`).css("border-color", "crimson");
                    
                    $(`input[name=password]`).val('');
                    $('input[name=password]').focus();
               } else {
                    $(`input[name=password]`).css("border-color", "blue");
                    
               }
          });
          
          $('input[name=passwordConfirm]').blur(function() {
               if ($('input[name=passwordConfirm]').val() != $('input[name=newPassword]').val()) {
                    if ($('input[name=passwordConfirm]').val() != '') {
                         alert("비밀번호가 일치하지 않습니다.");
                         
                         $('input[name=passwordConfirm]').val('');
                         $('input[name=newPassword]').val('');
                         $('input[name=newPassword]').focus();
                    }
               }
          })
     
          //비밀번호 체크
          let passwdCheck = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);
          $('#pw').keyup(function() {
          
               if (!passwdCheck.test($('#pw').val())) {
                    $("#pw").focus();
                    $('#pw').css("outline", "2px solid #d50000");
                    // $('#idCheck').css("background-color", "blue");
               } else if (passwdCheck.test($('#pw').val())) {
                    $('#pw').css("outline", "2px solid #0000ff");
               }
          });
     
          //비밀번호 확인 체크
          $('#pw2').keyup(function() {
               if ($('#pw2').val() != $('#pw').val()) {
                    console.log($('#pw2') + " / " + $('#pw'));
                    $('font[name=checkpw]').text('');
                    $('font[name=checkpw]').html("암호틀림");
               } else {
                    $('font[name=checkpw]').text('');
                    $('font[name=checkpw]').html("암호맞음");
                    $('font[name=checkpw]').css("color", "blue");
               }
          });
          
          
     });


</script>
<script src="assets/js/application.js" type="text/javascript"></script>
<script src="assets/js/search.js" type="text/javascript"></script>

</html>
