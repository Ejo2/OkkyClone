<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/common/okky-head.jsp"/>

<body>
<div class="main">
    <link rel="stylesheet" href="../../assets/css/yesol.css"><!--예솔 추가함 : study게시판 용 css-->
    <jsp:include page="/WEB-INF/common/okky-aside.jsp"></jsp:include>
    <!----------------------------------------------------------------------------------------------->
    <!--문제없기를...-->
    <!--문제없기를...2-->
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
                        <a class="nickname" href="/user/info/112840" title="mulbum">mulbum</a>

                    </div>
                </div>
            </div>
            <div class="panel-body">
                <form action="/articles/gathering/save" method="post" id="article-form" class="article-form" role="form"
                      onsubmit="return postForm()">
                    <fieldset class="form">
                        <input type="hidden" name="_csrf" value="2815446a-a095-4ed8-9793-12ef7c7d5b72">

                        <div class="form-group has-feedback">
                            <div>
                                <input type="text" name="title" required="" value="" placeholder="제목을 입력해 주세요."
                                       class="form-control" id="title">
                            </div>
                        </div>

                        <div class="form-group has-feedback">
                            <div>
                                <div class="form-control" id="flex-test-id" style="display: flex; flex-direction: row;border:none;box-shadow:none;padding-left:0px;padding-right:0px">

                                    <div id="content1" style="flex-grow: 1;margin-right:10px">
                                        <select id="sido-11" name="categoryCode" class="form-control" required="">
                                            <option value="">시도</option>
                                            <option value="sido1">시도1</option>
                                            <option value="sido2">시도2</option>
                                        </select>
                                    </div>
                                    <div id="content2" style="flex-grow: 1; margin-right:10px">
                                        <select id="sido-12" name="categoryCode" class="form-control" required="">
                                            <option value="">시군구</option>
                                            <option value="sido1">시도1</option>
                                            <option value="sido2">시도2</option>
                                        </select>
                                    </div>
                                    <div id="content3" style="flex-grow: 3">
                                        <select id="sido-13" name="categoryCode" class="form-control" required="">
                                            <option value="">스터디 유형을 선택해 주세요</option>
                                            <option value="sido1">시도1</option>
                                            <option value="sido2">시도2</option>
                                        </select>
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
                                <select id="carrier" name="categoryCode" class="form-control" required="">
                                    <option value="">스터디원의 희망 경력을 선택해 주세요</option>
                                    <option value="life"

                                            data-external="false"
                                            data-anonymity="false">
                                        구직자
                                    </option>
                                    <option value="forum"

                                            data-external="false"
                                            data-anonymity="false">
                                        1~3년
                                    </option>
                                    <option value="event"

                                            data-external="false"
                                            data-anonymity="false">
                                        4년 이상
                                    </option>
                                    <option value="event"

                                            data-external="false"
                                            data-anonymity="false">
                                        경력 무관
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group has-feedback">
                            <div class="study_email_deadline">
                                <div class="styling">마감 여부</div>
                                <div class="styling2"><label><input type="radio" name="deadline" value="going" checked disabled> 모집중</label></div>
                                <div class="styling2"><label><input type="radio" name="deadline" value="end" disabled> 마감</label></div>
                            </div>
                        </div>


                        <div class="form-group has-feedback">
                            <textarea name="text" id="summernote" rows="20"
                                      class="form-control input-block-level"></textarea>
                        </div>
                        <input type="hidden" name="textType" value="HTML" id="textType">


                        <div class="recaptcha-wrapper">
                            <script src="https://www.google.com/recaptcha/api.js" async defer></script>
                            <div class="g-recaptcha" data-sitekey="6Lcvw_gSAAAAAH3zOofJBJOFLpmjx7Vq3hxnYIRw"></div>
                        </div>

                        <div class="nav" role="navigation">
                            <fieldset class="buttons">
                                <a href="/articles/gathering" class="btn btn-default btn-wide"
                                   onclick="return confirm('정말로 취소하시겠습니까?')">취소</a>
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

<script src="../../assets/js/application.js" type="text/javascript"></script>
<script src="../../assets/js/search.js" type="text/javascript"></script>
<script>
    $(function () {
        $('.category-sort-link').click(function (e) {
            $('#category-sort-input').val($(this).data('sort'));
            $('#category-order-input').val($(this).data('order'));
            e.preventDefault();
            $('#category-filter-form')[0].submit();
        });
    });

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