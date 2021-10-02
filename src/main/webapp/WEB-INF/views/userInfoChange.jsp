<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/common/okky-head.jsp"/>
<style>
      
      .modal_close > a {
            display     : block;
            width       : 100%;
            height      : 100%;
            background  : url(https://img.icons8.com/metro/26/000000/close-window.png);
            text-indent : -9999px;
      }
      
      
      .img_wrap img {
            max-width : 100%;
      }


</style>


<body>
<div class="main">
      <jsp:include page="/WEB-INF/common/okky-aside.jsp"/>
      <c:set var="userInfo" value="${requestScope.userInfo}"/>
      <!----------------------------------------------------------------------------------------------->
      <div id="create-user" class="content clearfix" role="main">
            <h3 class="content-header">회원 정보 수정</h3>
            <div class="col-md-6 main-block-left">
                  <div class="panel panel-default">
                        <div class="panel-heading">
                              
                              
                              <div class="avatar clearfix avatar-medium ">
                                    <a href="memberDetailGo.do" class="avatar-photo"><img src="upload/${userInfo.photo}"></a>
                                    <div class="avatar-info">
                                          <a class="nickname" href="memberDetailGo.do" title="${userInfo.nickname}">${userInfo.nickname}</a>
                                    </div>
                              </div>
                              <a id="edit-picture-btn">변경</a>
                              
                              <div id="uploadImage" class="profile-picture-list" style="display:none;">
                                    
                                    
                                    <div class="profile-picture selected" data-id="0">
                                          <span class="avatar-photo"><img src="upload/${userInfo.photo}"></span>
                                          <span>MY 프로필</span>
                                    </div>
                                    <form action="profileChange.do" method="POST" enctype="multipart/form-data" id="uploadForm">
                                          
                                          <h2><b>이미지 미리보기</b></h2>
                                          <input type="file" name="filename1" id="input_img"/>
                                          <div class="profile-picture" data-id="0">
                                                <span class="avatar-photo"><img id="img"></span>
                                          </div>
                                          <input type="submit" value="이미지 변경하기">
                                    </form>
                              
                              </div>
                        </div>
                        <form action="updateUserNickname.do" method="POST" class="form-signup form-user panel-body" id="loginForm" autocomplete="off"><%--정보수정에 대한 form태그--%>
                              <input type="hidden" name="_csrf" value="93edf1b2-d9ca-4a57-8435-1f40c51ee8bb">
                              <input type="hidden" name="_method" value="PUT" id="_method">
                              <fieldset>
                                    <div class="form-group">
                                          <label class="control-label" for="nickname">닉네임</label>
                                          <input style="width: 100%" type="text" name="nickname" class="form-control input-sm" placeholder="닉네임" required="" value="${userInfo.nickname}" id="nickname">
                                    </div>
                              </fieldset>
                              <button class="btn btn-primary btn-block" type="submit">정보 수정</button>
                        </form>
                  </div>
            </div>
            <div class="col-md-6 main-block-right">
                  <div class="panel panel-default">
                        <div class="panel-heading">
                              <h5 class="panel-header">이메일 변경</h5>
                        </div>
                        <form action="/send" method="post" id="form1">
                              <div class="panel-body panel-margin">
                                    <div class="email-edit">
                                          <label class="control-label" for="email" style="width:100%">이메일 주소</label>
                                          <div class="field-subtitle"></div>
                                          <input type="email" name="email" class="form-control input-sm" placeholder="이메일" required="" value="${userInfo.email}" id="email" style="width: 100%">
                                          <input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=getRandom()%>"/>
                                          
                                          <input class="form-control" type="submit" id="verify-email-btn" value="인증" style="background-color: #5bc0de; color: #fff"/>
                                          <div id="error_mail" class="result-email result-check"></div>
                                    </div>
                              </div>
                        </form>
                  
                  
                  </div>
                  <div class="panel panel-default">
                        <div class="panel-body panel-margin">
                              <form action="pwdChangeGo.do" method="post">
                                    <button type="submit" class="btn btn-info btn-block">비밀번호 변경</button>
                              </form>
                              <a href="byebyeGo.do" class="btn btn-default btn-block">회원 탈퇴</a>
                        </div>
                  </div>
            </div>
      
      </div>
      
      <!----------------------------------------------------------------------------------------------->
      <jsp:include page="/WEB-INF/common/okky-footer.jsp"></jsp:include>
</div>
</body>
<script>
     var sel_file;
     
     $(document).ready(function() {
          $("#input_img").on("change", handleImgFileSelect);
     });
     
     function handleImgFileSelect(e) {
          var files = e.target.files;
          console.log(files.target);
          var filesArr = Array.prototype.slice.call(files);
          console.log(filesArr.toString());
          
          filesArr.forEach(function(f) {
               if (!f.type.match("image.*")) {
                    alert("확장자는 이미지 확장자만 가능합니다.");
                    return;
               }
               
               sel_file = f;
               
               var reader = new FileReader();
               
               reader.onload = function(e) {
                    console.log("온로드 타켓!" + e.target);
                    $("#img").attr("src", e.target.result);
               };
               
               reader.readAsDataURL(f);
          });
     }
     
     function submitAction() {
          var data = new FormData();
          
          for (var i = 0, len = sel_files.length; i < len; i++) {
               var name = "image_" + i;
               data.append(name, sel_files[i]);
          }
          data.append("image_count", sel_files.length);
          
          
          var xhr = new XMLHttpRequest();
          xhr.open("POST", "./study01_af.php");
          xhr.onload = function(e) {
               if (this.status == 200) {
                    console.log("Result : " + e.currentTarget.responseText);
               }
          }
          
          xhr.send(data);
          
     }
     
     
     
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
     $('#edit-picture-btn').click(function() {
          if ($('#uploadImage').css("display") == 'none') {
               $('#uploadImage').show();
          } else {
               $('#uploadImage').hide()
          }
     });


</script>
<script src="/assets/js/application" type="text/javascript"></script>
<script src="assets/js/search.js" type="text/javascript"></script>

<%!
      public int getRandom(){
            int random = 0;
            random = (int) Math.floor((Math.random() * (99999 - 10000 + 1))) + 10000;
            return random;
      }

%>

</html>
