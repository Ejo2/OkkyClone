<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/common/okky-head.jsp"/>

<body>
<div class="main">
    <link rel="stylesheet" href="../../../assets/css/yesol.css"><!--예솔 추가함 : study게시판 용 css-->
    <script src="../../../assets/js/location/location.js"></script>
    <jsp:include page="/WEB-INF/common/okky-aside.jsp"></jsp:include>
    <!----------------------------------------------------------------------------------------------->


    <div id="article-create" class="content" role="main">
        <div class="content-header">
            <h3>새 글 쓰기</h3>
        </div>

        <div class="panel panel-default clearfix">
            <div class="panel-heading clearfix">

                <div class="avatar clearfix avatar-medium pull-left">
                    <a href="/user/info/112840" class='avatar-photo'><img
                            src="//www.gravatar.com/avatar/EB4A935EC22B3AD295D18E838B72F9FB?d=identicon&s=40"/></a>
                    <div class="avatar-info">
                        <a class="nickname" href="/user/info/112840" title="${sessionScope.id}">${sessionScope.id}</a>

                    </div>
                </div>
            </div>
            <div class="panel-body"> <!--form 시작-->
                <form action="StudyWriteSubmit.so" method="post" id="article-form" class="article-form" role="form">
                    <fieldset class="form">
                        <input type="hidden" name="nickname" value="${sessionScope.id}">

                        <div class="form-group has-feedback">
                            <div>
                                <input type="text" name="title" required="" value="" placeholder="제목을 입력해 주세요."
                                       class="form-control" id="title"> <!--parameter 1 : 제목-->
                            </div>
                        </div>

                        <div class="form-group has-feedback">
                            <div>
                                <div class="form-control" id="flex-test-id" style="display: flex; flex-direction: row;border:none;box-shadow:none;padding-left:0px;padding-right:0px">

                                    <div id="content1" style="flex-grow: 1;margin-right:10px">
                                        <select id="location1" name="location1" class="form-control" required="">
                                            <option value="">==시도 선택==</option>
                                        </select><!--parameter 2 : 지역-->
                                    </div>
                                    <div id="content2" style="flex-grow: 1; margin-right:10px">
                                        <select id="location2" name="location2" class="form-control" required="">
                                            <option value="">==시군구 선택==</option>
                                        </select><!--parameter 3 : 지역2-->
                                    </div>
                                    <div id="content3" style="flex-grow: 3">
                                        <select id="study" name="categoryCode" class="form-control" required="">
                                            <option value="">==스터디 유형을 선택해 주세요==</option>
                                            <c:forEach var="categoryList" items="${categoryList}">
                                            <option value="${categoryList.st_categorynum}">${categoryList.st_category}</option>
                                            </c:forEach>
                                        </select><!--parameter 4 : 스터디유형-->
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="form-group has-feedback">
                            <div>
                                <input type="text" name="tagString" value="" placeholder="Tags," class="form-control"
                                       id="tagString">
                            </div>
                        </div>

                        <div class="form-group has-feedback">
                            <div>
                                <select id="carrier" name="carrier" class="form-control" required="">
                                    <option value="">==스터디원의 희망 경력을 선택해 주세요==</option>
                                    <option value="무관">무관</option>
                                    <option value="구직자">구직자</option>
                                    <option value="1~3년">1~3년</option>
                                    <option value="4년 이상">4년 이상</option><!--parameter 5 : 경력-->
                                </select>
                            </div>
                        </div>

                        <div class="form-group has-feedback">
                            <div class="study_email_deadline">
                                <div class="styling">마감 여부</div>
                                <div class="styling2"><input type="radio" name="deadline" value="0" checked><label>모집중</label></div>
                                <div class="styling2"><input type="radio" name="deadline" value="1" disabled> <label>마감</label></div>
                            </div><!--parameter 6 : 마감여부 - 글 생성시에는 무조건 모집중-->
                        </div>


                        <div class="form-group has-feedback">
                            <textarea name="text" id="summernote" rows="20"
                                      class="form-control input-block-level"></textarea>
                        </div><!--parameter 5 : 마감여부 - 글내용-->
                        <input type="hidden" name="textType" value="HTML" id="textType">


                        <div class="recaptcha-wrapper">
                            <script src="https://www.google.com/recaptcha/api.js" async defer></script>
                            <div class="g-recaptcha" data-sitekey="6Lcvw_gSAAAAAH3zOofJBJOFLpmjx7Vq3hxnYIRw"></div>
                        </div>

                        <div class="nav" role="navigation">
                            <fieldset class="buttons">
                                <a href="/articles/gathering" class="btn btn-default btn-wide"
                                   onclick="testfunc()">취소</a>
                                <input type="submit" name="create" class="create btn btn-success btn-wide pull-right"
                                       action="create" value="등록" id="create">
                            </fieldset>
                        </div>
                    </fieldset>
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

<script src="../../../assets/js/application.js" type="text/javascript"></script>
<script src="../../../assets/js/search.js" type="text/javascript"></script>
<script>

    $(document).ready(function() {
        $('#summernote').summernote({
            height: 300,                 // 에디터 높이
            minHeight: null,             // 최소 높이
            maxHeight: null,             // 최대 높이
            focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
            lang: "ko-KR",					// 한글 설정
            placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
        });
    });
</script>
</html>