<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/common/okky-head.jsp"/>

<body>
<div class="main">
      <jsp:include page="/WEB-INF/common/okky-aside.jsp"></jsp:include>
      <c:set var="userInfo" value="${requestScope.userInfo}"/>
      <!----------------------------------------------------------------------------------------------->
      <div id="create-user" class="content clearfix" role="main">
            <h3 class="content-header">회원 정보 수정</h3>
            <div class="col-md-6 main-block-left">
                  <div class="panel panel-default">
                        <div class="panel-heading">
                              
                              
                              
                              
                              <div class="avatar clearfix avatar-medium ">
                                    <a href="/user/info/115337" class="avatar-photo"><img src="//www.gravatar.com/avatar/0285579c04f577bf59230b931e1da2f5?d=identicon&amp;s=40"></a>
                                    <div class="avatar-info">
                                          <a class="nickname" href="memberDetailGo.do" title="${userInfo.nickname}">${userInfo.nickname}</a>
                                    </div>
                              </div>
                              <a id="edit-picture-btn">변경</a>
                              <div class="profile-picture-list" style="display:none;">
                                    
                                    
                                    <div class="profile-picture selected" data-id="0">
                                          <span class="avatar-photo"><img src="//www.gravatar.com/avatar/0285579c04f577bf59230b931e1da2f5?d=identicon&amp;s=40"></span>
                                          <span>Gravatar</span>
                                    </div>
                                    
                                    
                                    <div class="profile-picture " data-id="34418">
                                          <span class="avatar-photo"><img src="${userInfo.photo}"></span>
                                          <span>Google</span>
                                    </div>
                                    <button class="btn btn-primary" id="profile-upload-btn" style="font-size: 12px">이미지 업로드<br><small>권장 사이즈 150px<br>최대 250KB</small></button>
                                    <input type="file" name="files" accept="image/gif, image/jpg, image/jpeg, image/png" style="display:none;" id="profileImage">
                                    <button class="btn btn-success picture-confirm-btn">확인</button>
                              </div>
                        </div>
                        <form action="updateUserInfo.do" method="POST" class="form-signup form-user panel-body" id="loginForm" autocomplete="off"><%--정보수정에 대한 form태그--%>
                              <input type="hidden" name="_csrf" value="93edf1b2-d9ca-4a57-8435-1f40c51ee8bb">
                              <input type="hidden" name="_method" value="PUT" id="_method">
                              <fieldset>
                                    
                                    <div class="form-group">
                                          <label class="control-label" for="nickname">닉네임</label>
                                          <input type="text" name="nickname" class="form-control input-sm" placeholder="닉네임" required="" value="${userInfo.id}" id="nickname">
                                    </div>
                                    
                                    <div class="checkbox">
                                          <label>
                                                <input type="checkbox" name="dmAllowed" checked="checked" id="person.dmAllowed">
                                                이메일 수신 동의                        </label>
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
                        <div class="panel-body panel-margin">
                              <div class="email-edit">
                                    <label class="control-label" for="email" style="width:100%">이메일 주소</label>
                                    <div class="field-subtitle"></div>
                                    <input type="text" name="email" class="form-control input-sm" placeholder="이메일" required="" value="${userInfo.email}" id="email">
                                    <button class="btn btn-primary" style="display:none;" data-email-type="UPDATE_EMAIL" type="button" id="verify-email-btn">인증</button>
                                    <button class="btn btn-success" style="display:none;" type="button" id="verify-email-retry-btn">재전송</button>
                              </div>
                        </div>
                  </div>
                  <div class="panel panel-default">
                        <div class="panel-body panel-margin">
                              <a href="passwordChange.do" class="btn btn-info btn-block">비밀번호 변경</a><%--모달창으로 띄울 예정입니다.--%>
                              <a href="byebyeGo.do" class="btn btn-default btn-block">회원 탈퇴</a><%--모달창으로 띄울 예정입니다.--%>
                        </div>
                  </div>
            </div>
            
      </div>
      
      <!----------------------------------------------------------------------------------------------->
      <jsp:include page="/WEB-INF/common/okky-footer.jsp"></jsp:include>
</div>
</body>
<script src="assets/js/application.js" type="text/javascript"></script>
<script src="assets/js/search.js" type="text/javascript"></script>
</html>
