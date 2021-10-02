<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/common/okky-head.jsp"/>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" type="text/css" media="screen" href="/assets/css/qna_read.css">

    <title>OKKY - 상세보기</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="_csrf_parameter" content="_csrf"/>
    <meta name="_csrf_header" content="X-CSRF-TOKEN"/>
    <meta name="_csrf" content="d3611fcc-5ba1-49ea-9f83-7e974f6bbf11"/>
    <link rel="shortcut icon" href="/assets/images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="/assets/images/icon_57x57.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/images/icon_114x114.png">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <meta property="og:image" content="https://okky.kr/assets/images/okky_logo_fb.png">
    <link rel="stylesheet" href="/assets/css/application.css">
    <script>(function (w, d, s, l, i) {
        w[l] = w[l] || [];
        w[l].push({
            'gtm.start':
                new Date().getTime(), event: 'gtm.js'
        });
        var f = d.getElementsByTagName(s)[0],
            j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : '';
        j.async = true;
        j.src =
            'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
        f.parentNode.insertBefore(j, f);
    })(window, document, 'script', 'dataLayer', 'GTM-M52CW55');</script>
    <!--[if lt IE 9]>
    <script src="/js/libs/html5.js"></script>
    <script src="/assets/libs/respond.src.js"></script>
    <script src="/assets/libs/html5.js"></script>
    <![endif]-->

</head>
<body>

    <c:set var="board" value="${requestScope.board}" />
    <c:set var="idx" value="${requestScope.no}" />
    <c:set var="cpage" value="${requestScope.cp}" />
    <c:set var="pagesize" value="${requestScope.ps}" />
    <c:set var="replyList" value="${requestScope.replyList}" />

<div>
    <jsp:include page="/WEB-INF/common/okky-columns-aside.jsp"></jsp:include>

    <script id="setting-template" type="text/template">
        <div class="popover popover-fixed" role="tooltip"><div class="arrow"></div>
            <h3 class="popover-title"></h3>
            <div class="popover-footer clearfix" id="user-func-popover">
                <label href="" for="logoutButton" class="popover-btn"><i class="fa fa-sign-out"></i> 로그아웃</label>
                <a href="/user/edit" class="popover-btn"><i class="fa fa-user"></i> 정보수정</a>
            </div>
        </div>
    </script>

    <script id="notification-template" type="text/template">
        <div class="popover popover-fixed" role="tooltip">
            <div class="arrow"></div>
            <h3 class="popover-title"></h3>
            <div class="popover-content" id="notification-popover"></div>
        </div>
    </script>

    <div class="main">
        <div id="article" class="content" role="main">

            <div class="nav" role="navigation">
                <a class="create btn btn-success btn-wide pull-right" href="${pageContext.request.contextPath}/BoardWrite.go">
                    <i class="fa fa-pencil"></i> 새 글 쓰기</a>
                <h4>칼럼</h4>
            </div>


            <div class="panel panel-default clearfix fa-">
                <div class="panel-heading clearfix">
                    <div class="avatar clearfix avatar-medium pull-left">
                        <a href="/user/info/127868" class='avatar-photo'><img
                                src="//www.gravatar.com/avatar/a25e133c0500a97505a15f6638e8e926?d=identicon&s=40"/>
                        </a>
                        <div class="avatar-info">
                            <a class="nickname" href="/user/info/127868" title="${requestScope.userInfo.nickname}">${requestScope.userInfo.nickname}</a>
                            <div class="activity"><span class="fa fa-flash"></span> 10</div> <%--활동점수--%>
                            <div class="date-created"><span class="timeago" title="${board.writedate}">${board.writedate}</span></div>
                        </div>
                    </div>
                    <div class="content-identity pull-right">
                        <div class="content-identity-count"><i class="fa fa-comment"></i> 0</div> <%--??--%>
                        <div class="content-identity-count"><i class="fa fa-eye"></i>${board.hit}</div>
                    </div>
                </div>

                <div class="content-container clearfix">
                    <div id="content-body" class="panel-body content-body pull-left">
                        <div class="content-tags">
                            <span class="list-group-item-text article-id">${board.no}</span>
                            <a href="/articles/tech-qna" class="list-group-item-text item-tag label label-info">
                                <i class="fa fa-database"></i>칼럼
                            </a>
                        </div>
                        <h2 class="panel-title">
                            ${board.title}
                        </h2>
                        <hr/>
                        <article class="content-text" itemprop="articleBody">
                            <p> ${board.cont}</p>
                        </article>
                    </div>

                    <div id="content-function" class="content-function pull-right text-center">
                        <div class="content-function-group">
                            <div class="note-evaluate-wrapper">
                                <a href="javascript://" class="note-vote-btn" role="button" data-type="assent"
                                   data-eval="true" data-id="2524877">
                                    <i id="note-evaluate-assent-2524877"
                                       class="fa fa-angle-up note-evaluate-assent-assent" data-placement="left"
                                       data-toggle="tooltip" title="추천">
                                    </i>
                                </a>
                                <div id="content-vote-count-2524877" class="content-eval-count">0</div>
                                <a href="javascript://" class="note-vote-btn" role="button" data-type="dissent"
                                   data-eval="true" data-id="2524877">
                                    <i id="note-evaluate-dissent-2524877"
                                       class="fa fa-angle-down note-evaluate-dissent-dissent" data-placement="left"
                                       data-toggle="tooltip" title="반대">
                                    </i>
                                </a>
                            </div>
                        </div>
                        <div class="content-function-group article-scrap-wrapper">
                            <a href="javascript://" id="article-scrap-btn" data-type="scrap">
                                <i class="fa fa-bookmark" data-toggle="tooltip" data-placement="left" title="스크랩"></i>
                            </a>
                            <div id="article-scrap-count" class="content-count">0</div>
                        </div>
                    </div>

                    <div class="content-function-cog share-btn-wrapper">
                        <div class="dropdown"></div>
                        <div class="dropdown">
                            <form action="${pageContext.request.contextPath}/BoardEdit.go" method="post" name="article-delete-form"
                                  id="article-delete-form">
                                <input type="hidden" name="_csrf" value="d3611fcc-5ba1-49ea-9f83-7e974f6bbf11">
                                <input type="hidden" name="_method" value="DELETE" id="method">
                                <div class="dropdown open">
                                    <a href="javascript://" data-toggle="dropdown" aria-expanded="true"><i class="fa fa-cog" data-toggle="tooltip" data-placement="left" title="" data-original-title="게시물 설정"></i></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="${pageContext.request.contextPath}/BoardEdit.go?no=${no}&cp=${cpage}&ps=${pagesize}" class="edit"><i class="fa fa-edit fa-fw"></i> 수정 </a></li>
                                        <li><a href="${pageContext.request.contextPath}/BoardDelete.go?no=${no}&cp=${cpage}&ps=${pagesize}" id="article-delete-btn"><i class="fa fa-trash-o fa-fw"></i> 삭제 </a></li>
                                    </ul>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


            <%--댓글--%>
            <div class="panel panel-default clearfix">
                <!-- List group -->
                <ul class="list-group">
                    <li id="note-title" class="list-group-item note-title">
                        <h3 class="panel-title">답변 <span id="note-count">0</span></h3>
                    </li>
                    <li class="list-group-item note-form clearfix">
                        <form action="${pageContext.request.contextPath}/BoardContent.go" method="post" class="note-create-form">
                            <input type="hidden" name="_csrf" value="d3611fcc-5ba1-49ea-9f83-7e974f6bbf11">
                            <div class="content-body panel-body pull-left">
                                <div style="margin-left: 5px;">
                                    <div class="note-select-indicator note-deselected">
                                        <i class="fa fa-edit"></i>
                                    </div>

                                    <div class="avatar clearfix avatar-medium ">
                                        <a href="/user/info/127868" class='avatar-photo'><img
                                                src="//www.gravatar.com/avatar/a25e133c0500a97505a15f6638e8e926?d=identicon&s=40"/></a>
                                        <div class="avatar-info">
                                            <a class="nickname" href="/user/info/127868" title="닉네임">닉네임</a>
                                            <div class="activity block"><span class="fa fa-flash"></span> 0</div>
                                        </div>
                                    </div>
                                </div>
                                <fieldset class="form">
                                    <input type="hidden" name="textType" value="HTML" id="note.textType">
                                    <textarea name="note.text" id="note-create" placeholder="댓글 쓰기"
                                              class="form-control"></textarea>
                                </fieldset>
                            </div>
                            <div class="content-function-cog note-submit-buttons clearfix">
                                <p><a href="javascript://" id="note-create-cancel-btn" class="btn btn-default btn-wide"
                                      style="display: none;">취소</a></p>
                                <input type="submit" name="create" id="btn-create-btn" class="btn btn-success btn-wide"
                                       value="등록" disabled="disabled">
                            </div>
                        </form>
                    </li>
                </ul>
            </div>
        </div>
        <jsp:include page="/WEB-INF/common/okky-footer.jsp"></jsp:include>
    </div>
</div>

    <script>
        var contextPath = "";
        var encodedURL = "%2Farticle%2F1060292";
    </script>

    <script src="/assets/js/application.js" type="text/javascript"></script>
    <script src="/assets/js/apps/search.js" type="text/javascript"></script>
    <script src="/assets/js/apps/notification.js" type="text/javascript"></script>
    <div id="fb-root"></div>
    <script src="/assets/js/libs/prism.js" type="text/javascript"></script>
    <script src="/assets/js/apps/note.js" type="text/javascript"></script>
    <script src="/assets/js/apps/vote.js" type="text/javascript"></script>
    <script src="/assets/js/apps/scrap.js" type="text/javascript"></script>
    <script src="/assets/js/apps/article.js" type="text/javascript"></script>
    <script>
        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s);
            js.id = id;
            js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&appId=1539685662974940&version=v2.0";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    </script>

    <div id="userPrivacy" class="modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
            </div>
        </div>
    </div>

    <div id="userAgreement" class="modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
            </div>
        </div>
    </div>

    <script src="/summernote/js/summernote-lite.js"></script>
    <!--예솔 추가함 : summernote-->
    <script src="/summernote/js/summernote-ko-KR.js"></script>
    <!--예솔 추가함 : summernote-->
    <link rel="stylesheet" href="/summernote/css/summernote-lite.css">
    <!--예솔 추가함 : summernote-->
    <script type="text/javascript">
        $("#note-create").on('click',function(){
            $("#note-create").summernote({
                height: 300,                 // 에디터 높이
                minHeight: null,             // 최소 높이
                maxHeight: null,             // 최대 높이
                focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
                lang: "ko-KR",               // 한글 설정
                placeholder: '최대 2048자까지 쓸 수 있습니다'   //placeholder 설정
            });
        });
    </script>
</body>
</html>