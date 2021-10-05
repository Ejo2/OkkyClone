<%@ page import="java.util.ArrayList" %>
<%@ page import="kr.or.bit.utils.ConnectionHelper" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/common/okky-head.jsp"/>
<%--유저의 이메일과 아이디를 중복 검증을 위해 찾아옵니다.--%>
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
                        
                        <form action="join.do" method="post" class="form-signup form-user panel-body" id="joinForm" autocomplete="off">
                              <input type="hidden" name="isCheck" id="isCheck"/>
                              <input type="hidden" name="_csrf" value="7907b04a-3989-4228-83bd-d76781042c9f">
                              <fieldset>
                                    
                                    <label for="id">아이디</label>
                                    <input style="width: 100%;" maxlength="20" minlength="4" type="text" name="id" class="form-control input-sm" required="" placeholder="아이디" value="" id="id">
                                    <br>
                                    <button id="idCheckBtn" class="btn btn-info" type="button">아이디 중복 체크</button>
                                    <br>
                                    <br>
                                    <label for="nickname">닉네임</label><input maxlength="15" style="width: 100%" type="text" name="nickname" class="form-control input-sm" required="" placeholder="닉네임" value="" id="nickname">
                                    <br>
      
                                    <label for="pw">패스워드</label><input maxlength="16" style="width: 100%" type="password" name="pw" class="form-control input-sm" required="" placeholder="비밀번호 : 대 소문자 특수문자 포함 8 ~16" value="" id="pw">
                                    <br>
      
                                    <label for="pw2">패스워드 확인</label><input maxlength="16" style="width: 100%" type="password" name="pw2" class="form-control input-sm" required="" placeholder="비밀번호 확인" value="" id="pw2">
                                    <font name="checkpw"></font>
                                    <br>
      
                                    <label for="email">이메일</label><input maxlength="30" type="text" name="email" style="width:100%;" class="form-control input-sm" required="" placeholder="이메일" value="" id="email">
                                    <br>
      
                                    <%--프로필사진은 일단은 기본 이미지로 대체합니다.
                                    이후 회원정보에서 프로필 사진 업로드합니다.
                                    여기서는 photo에 null값으로 들어갈 예정입니다.--%>
                                    
                                   
                              
                              </fieldset>
                              
                              <div class="recaptcha-wrapper">
                                    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
                                    <div class="g-recaptcha" data-sitekey="6Lcvw_gSAAAAAH3zOofJBJOFLpmjx7Vq3hxnYIRw"></div>
                              </div>
                              <br>
                              <button id="joinBtn" class="btn btn-primary btn-block" type="submit">계정 생성</button>
                        
                        
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
<script type="text/javascript">
     
     
     $(function() {
          
          $('#idCheckBtn').on("click", function() {
               let myId = $('#id').val();
               $.ajax(
                    {
                         url: "idCheck.do",
                         type: "POST",
                         dataType: "html",
                         data: {
                              id: myId
                         },
                         success: function(responsedata) {
                              let result = responsedata.trim();
                              if (result == 1) {
                                   alert('아이디 사용가능');
                                   $('#joinBtn').removeClass("hide");
                                   
                              } else {
                                   alert('아이디가 중복됩니다..');
                                   
                                   $("#joinBtn").addClass("hide");
                              }
                         },
                         fail: function(data) {
                              alert('데이터 전송 실패');
                         },
                    }
               );
               
          });
          
          //아이디 최소
          var idCheck = RegExp(/^[A-Za-z0-9_\-]{5,20}$/);
          
          $('#id').keyup(function() {
               
               if (!idCheck.test($(this).val())) {
                    $("#id").focus();
                    $('#id').css("outline", "2px solid #d50000");
                    // $('#idCheck').css("background-color", "blue");
               } else if (idCheck.test($(this).val())) {
                    $('#id').css("outline", "2px solid #0000ff");
               }
          });
          
          //닉네임 최소
          let nickNameCheck = RegExp(/^[가-힣a-zA-Z0-9]{2,15}$/);//2자~10 한 영 숫
          $('#nickname').keyup(function() {
               
               if (!nickNameCheck.test($(this).val())) {
                    $("#nickname").focus();
                    $('#nickname').css("outline", "2px solid #d50000");
                    // $('#idCheck').css("background-color", "blue");
               } else if (nickNameCheck.test($(this).val())) {
                    $('#nickname').css("outline", "2px solid #0000ff");
               }
          });
          
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
          
          //이메일 체크
          const emailCheck = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; //이메일
          
          $('#email').keyup(function() {
               //이메일
               if (!emailCheck.test($("#email").val())) {
                    console.log($('#email').val());
                    $("#email").focus();
                    $('#email').css("outline", "2px solid #d50000");
               } else if (emailCheck.test($('#email').val())) {
                    $('#email').css("outline", "2px solid #0000ff");
               }
          });
          
          $('#join').click(function() {
               const formElement = $("#loginForm");
               if ($('#id').val() == "" || $('#pw').val() == "" || $('#pw2').val() == "" ||
                    $('#email').val() == "" || $('#photo').val() == "")
               {
                    
                    alert('빈값이 있습니다.');
                    formElement.attr("action", "join.do");
                    formElement.attr("method", "post");
                    formElement.submit();
                    
                    
               }
               if ($('#id').css("outline") == "2px solid #d50000" || $('font[name=check]').html() ==
                    "암호틀림" ||
                    $('#email').css("outline") ==
                    "2px solid #d50000" || $('#pw').css("outline") == "2px solid #d50000" ||
                    $('#pw2').css("outline") ==
                    "2px solid #d50000")
               {
                    alert('형식에 맞지 않습니다.');
                    
                    formElement.attr("action", "join.do");
                    formElement.attr("method", "post");
                    formElement.submit();
                    
               }
          });
          
          
          $('.category-sort-link').click(function(e) {
               $('#category-sort-input').val($(this).data('sort'));
               $('#category-order-input').val($(this).data('order'));
               e.preventDefault();
               $('#category-filter-form')[0].submit();
          });
     });
</script>
</html>