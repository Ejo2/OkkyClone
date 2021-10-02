<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/common/okky-head.jsp"/>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet"  href="/assets/css/qna_write.css">
    <script src="../../../summernote/js/summernote-lite.js"></script>
    <!--예솔 추가함 : summernote-->
    <script src="../../../summernote/js/summernote-ko-KR.js"></script>
    <!--예솔 추가함 : summernote-->
    <link rel="stylesheet" href="../../../summernote/css/summernote-lite.css">
    <!--예솔 추가함 : summernote-->



    <title>OKKY - Article 등록</title>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <meta property="og:image" content="https://okky.kr/assets/images/okky_logo_fb.png">
    <link rel="stylesheet" href="/assets/css/application.css">

    <!--[if lt IE 9]>
    <![endif]-->

</head>


<body>
<jsp:include page="/WEB-INF/common/okky-aside.jsp"></jsp:include>

<c:set var="no" value="${requestScope.no}" />
<c:set var="board" value="${requestScope.board}" />

<div class="main content">


    <div class="panel panel-default clearfix">
        <div class="panel-heading clearfix">
        <div class="panel-body">
            <div id="article-create">

                        <div class="avatar clearfix avatar-medium pull-left">
                            <a href="/user/info/127868" class='avatar-photo'><img
                                    src="//www.gravatar.com/avatar/a25e133c0500a97505a15f6638e8e926?d=identicon&s=40" /></a>
                            <div class="avatar-info">
                                <a class="nickname" href="/user/info/127868" title="닉녬">닉녬</a>

                                <div class="activity"><span class="fa fa-flash"></span> 10</div>
                                <div class="date-created"><span class="timeago" title="${board.writedate}">${board.writedate}</span></div>
                            </div>
                        </div>
                        <div class="content-identity pull-right">
                            <div class="article-id">${no}</div>
                            <div><i class="fa fa-eye"></i>${board.hit}</div>
                        </div>
                    </div>
                </div>
            </div>

            <form action="/QnAEditOk.qo" method="post" id="article-form" class="article-form" role="form"
                  onsubmit="return postForm()">
                <fieldset class="form">
                    <input type="hidden" id="no" name ="no" value="${no}" />
                    <input type="hidden" name="_csrf" value="c6a51f4b-0401-45ae-a2b9-0c475512b478">
                    <div class="form-group has-feedback">
                        <div>
                            <select id="category" name="categoryCode" class="form-control" required="">
                                <option value="">게시판을 선택해 주세요.</option>
                                <option value="tech-qna" data-external="false" data-anonymity="false">
                                    Q&A </option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group has-feedback">
                        <div>
                            <input type="text" name="title"  required="" value="${board.title}" placeholder="제목을 입력해 주세요."
                                   class="form-control" id="title"/>
                        </div>
                    </div>

                    <div class="form-group has-feedback">
                        <div>
                            <input type="text" name="tagString" value="" placeholder="Tags," class="form-control"
                                   id="tagString">
                        </div>
                    </div>

                    <div class="form-group has-feedback">
                            <textarea name="cont" id="summernote" rows="20"
                                      class="form-control input-block-level">${board.cont}</textarea>
                    </div>
                    <input type="hidden" name="textType" value="HTML" id="textType">

                    <div class="recaptcha-wrapper">
                        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
                        <div class="g-recaptcha" data-sitekey="6Lcvw_gSAAAAAH3zOofJBJOFLpmjx7Vq3hxnYIRw">
                        </div>
                    </div>

                    <div class="nav" role="navigation">
                        <fieldset class="buttons">
                            <a href="/articles/questions" class="btn btn-default btn-wide"
                               onclick="return confirm('정말로 취소하시겠습니까?')">취소</a>
                            <input type="submit" name="create" class="create btn btn-success btn-wide pull-right"
                                   action="create" value="등록" id="create">
                        </fieldset>
                    </div>
                </fieldset>
            </form>
        </div>



<jsp:include page="/WEB-INF/common/okky-footer.jsp"></jsp:include>


<script>
    var contextPath = "";
    var encodedURL = "%2Farticles%2Fquestions%2Fcreate";
</script>


<script src="/assets/js/application.js" type="text/javascript"></script>
<script src="/assets/js/apps/search.js" type="text/javascript"></script>
<script src="/assets/js/apps/notification.js" type="text/javascript"></script>
<script src="/assets/js/libs/typeahead.bundle.js"></script>
<script type="text/javascript">
    var tagTokenizers = new Bloodhound({
        datumTokenizer: Bloodhound.tokenizers.obj.whitespace('tagName'),
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        remote: {
            url: '/tag?tagName=%QUERY',
            wildcard: '%QUERY'
        }
    });

    var tagsInputConfig = {
        typeaheadjs: {
            displayKey: 'tagName',
            valueKey: 'tagName',
            source: tagTokenizers.ttAdapter(),
            templates: {
                suggestion: function (tag) {
                    var query = tag._query.replace(/[.*+\-?^$'{}'()|[\]\\]/g, '\\$&');
                    var regexp = new RegExp('^(' + query + ')', 'g');
                    return '<div>' + tag.tagName.replace(regexp, "<strong>$1</strong>") + ' <span>+' + tag.count + '</span></div>';
                }
            }
        }
    };

    var tagsInputItemAddedEventCallback = function (event) {
        $(this).parent().find(".tt-input").typeahead("val", "");
    };

</script>


<script type="text/javascript">
    $(document).ready(function () {
        $('#summernote').summernote({
            height: 300,                 // 에디터 높이
            minHeight: null,             // 최소 높이
            maxHeight: null,             // 최대 높이
            focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
            lang: "ko-KR",               // 한글 설정
            placeholder: '최대 2048자까지 쓸 수 있습니다'   //placeholder 설정
        });


        /*submit 전송*/
        $("#article-form").submit(function (){
           let no =  $("#no").val();
           let title = $("#title").val();
           let cont = $("#summernote").val();
        });
    });



    var tagsinputWidgets = $('input[name=tagString]').tagsinput(tagsInputConfig);
    $('input[name=tagString]').on('itemAdded', tagsInputItemAddedEventCallback);

    tagsinputWidgets.forEach(function (widget) {
        var input = widget.input();

        input.focusout(function () {
            widget.add(input.val());
            input.typeahead('val', '');
        });

        input.keyup(function () {
            var value = this.value;
            value = value.substring(value.length - 1);
            if (value == "," || value == " ") {
                widget.add($.trim(input.val()));
                input.typeahead('val', '');
            }
        });
    });

    $('#summernote').summernote({
        minHeight: 300, lang: 'ko-KR',
        onInit: function () {
            if ($(window).height() > 400) {
                $('.note-editable').css('max-height', $(window).height() - 100);
            }
            $(".note-link-btn").attr("type", "button");
        },
        onImageUpload: $.onImageUpload($('#summernote'))
    });

    function postForm() {
        var response = grecaptcha.getResponse();
        if (response.length == 0) {
            alert("CAPTCHA 인증을 진행해주세요.");
            return false;
        }
        $('textarea[name="content.text"]').val($('#summernote').code());
    }

    $('#notice').click(function () {
        if ($(this).is(':checked')) {
            $('#noticeCategoryList').show();
        } else {
            $('#noticeCategoryList').hide();
            $('input[name="notices"]').prop('checked', false);
        }
    });

    $('#category').change(function () {
        if (this.value == 'recruit') {
            if (this.value && confirm('게시판 변경시 수정된 내용은 초기화 됩니다. 변경 하시겠습니까?')) {
                /*if(this.value == 'recruit') {
                  location.href=contextPath+'/recruit/create';
                } else {*/
                location.href = contextPath + '/articles/' + this.value + '/create';
                // }
            } else {

            }
        }
    });
</script>
<script type="text/javascript">
    setInterval(function () {
        $.get("/keepAlive");
    }, 1500 * 1000);
</script>

<div id="userPrivacy" class="modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        </div>
    </div>
</div>

<div id="userAgreement" class="modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        </div>
    </div>
</div>
</div>
</body>
</html>