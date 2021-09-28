<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/common/okky-head.jsp"/>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" type="text/css" media="screen" href="/assets/css/qna_read.css">

    <title>OKKY - 서블릿 어렵네요ㅠ</title>
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
    <meta property="og:type" content="article">
    <meta property="og:site_name" content="OKKY">
    <meta property="og:url" content="https://okky.kr/article/1060292">
    <meta property="og:description" content=" 어려워요ㅠ ">
    <meta property="og:title" content="OKKY | 서블릿 어렵네요ㅠ">
    <meta property="dable:item_id" content="1060292">
    <meta property="dable:author" content="닉녬">
    <meta property="article:section" content="tech-qna">
    <meta property="article:published_time" content="2021-09-28T18:57:07Z">
</head>

<body>
<div>
    <jsp:include page="/WEB-INF/common/okky-aside.jsp"></jsp:include>


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
                <a class="create btn btn-success btn-wide pull-right" href="/articles/tech-qna/create"><i
                        class="fa fa-pencil"></i> 새 글 쓰기</a>
                <h4>Tech Q&A</h4>
            </div>


            <div class="panel panel-default clearfix fa-">
                <div class="panel-heading clearfix">

                    <div class="avatar clearfix avatar-medium pull-left">
                        <a href="/user/info/127868" class='avatar-photo'><img
                                src="//www.gravatar.com/avatar/a25e133c0500a97505a15f6638e8e926?d=identicon&s=40"/></a>
                        <div class="avatar-info">
                            <a class="nickname" href="/user/info/127868" title="닉녬">닉녬</a>
                            <div class="activity"><span class="fa fa-flash"></span> 10</div>
                            <div class="date-created"><span class="timeago" title="2021-09-28T18:57:07">2021-09-28 18:57:07</span>
                            </div>
                        </div>
                    </div>

                    <div class="content-identity pull-right">
                        <div class="content-identity-count"><i class="fa fa-comment"></i> 0</div>
                        <div class="content-identity-count"><i class="fa fa-eye"></i> 1</div>
                    </div>
                </div>
                <div class="content-container clearfix">
                    <div id="content-body" class="panel-body content-body pull-left">
                        <div class="content-tags">
                            <span class="list-group-item-text article-id">#1060292</span>
                            <a href="/articles/tech-qna" class="list-group-item-text item-tag label label-info"><i
                                    class="fa fa-database"></i> Tech Q&A</a>
                        </div>
                        <h2 class="panel-title">
                            서블릿 어렵네요ㅠ
                        </h2>
                        <hr/>
                        <article class="content-text" itemprop="articleBody">
                            <p>어려워요ㅠ</p>
                        </article>
                    </div>

                    <div id="content-function" class="content-function pull-right text-center">
                        <div class="content-function-group">
                            <div class="note-evaluate-wrapper">
                                <a href="javascript://" class="note-vote-btn" role="button" data-type="assent"
                                   data-eval="true" data-id="2524877">
                                    <i id="note-evaluate-assent-2524877"
                                       class="fa fa-angle-up note-evaluate-assent-assent" data-placement="left"
                                       data-toggle="tooltip" title="추천"></i>
                                </a>

                                <div id="content-vote-count-2524877" class="content-eval-count">0</div>

                                <a href="javascript://" class="note-vote-btn" role="button" data-type="dissent"
                                   data-eval="true" data-id="2524877">
                                    <i id="note-evaluate-dissent-2524877"
                                       class="fa fa-angle-down note-evaluate-dissent-dissent" data-placement="left"
                                       data-toggle="tooltip" title="반대"></i>
                                </a>
                            </div>
                        </div>
                        <div class="content-function-group article-scrap-wrapper">
                            <a href="javascript://" id="article-scrap-btn" data-type="scrap"><i class="fa fa-bookmark "
                                                                                                data-toggle="tooltip"
                                                                                                data-placement="left"
                                                                                                title="스크랩"></i></a>
                            <div id="article-scrap-count" class="content-count">0</div>
                        </div>
                    </div>
                    <div class="content-function-cog share-btn-wrapper">
                        <div class="dropdown">

                        </div>

                        <div class="dropdown">
                            <form action="/article/delete/1060292" method="post" name="article-delete-form"
                                  id="article-delete-form">
                                <input type="hidden" name="_csrf" value="d3611fcc-5ba1-49ea-9f83-7e974f6bbf11">
                                <input type="hidden" name="_method" value="DELETE" id="method">
                                <div class="dropdown">
                                    <a href="javascript://" data-toggle="dropdown"><i class="fa fa-cog"
                                                                                      data-toggle="tooltip"
                                                                                      data-placement="left"
                                                                                      title="게시물 설정"></i></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="/article/edit/1060292" class="edit"><i
                                                class="fa fa-edit fa-fw"></i> 수정 </a></li>
                                        <li><a href="javascript://" id="article-delete-btn"><i
                                                class="fa fa-trash-o fa-fw"></i> 삭제 </a></li>
                                    </ul>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


            <div class="panel panel-default clearfix">
                <!-- List group -->
                <ul class="list-group">
                    <li id="note-title" class="list-group-item note-title">
                        <h3 class="panel-title">답변 <span id="note-count">0</span></h3>
                    </li>
                    <li class="list-group-item note-form clearfix">
                        <form action="/article/addNote/1060292" method="post" class="note-create-form">
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
                                            <a class="nickname" href="/user/info/127868" title="닉녬">닉녬</a>
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

        <form action="/article/dissent/1060292" method="post" name="note-dissent-form" id="note-dissent-form">
            <input type="hidden" name="_method" value="PUT" id="method1">
        </form>
        <form action="/article/assent/1060292" method="post" name="note-assent-form" id="note-assent-form">
            <input type="hidden" name="_method" value="PUT" id="method2">
        </form>
        <form action="/article/unvote/1060292" method="post" name="note-unvote-form" id="note-unvote-form">
            <input type="hidden" name="_method" value="PUT" id="method3">
        </form>
        <form action="/article/selectNote/1060292" method="post" name="note-select-form" id="note-select-form">
            <input type="hidden" name="_method" value="PUT" id="method4">
        </form>
        <form action="/article/deselectNote/1060292" method="post" name="note-deselect-form" id="note-deselect-form">
            <input type="hidden" name="_method" value="PUT" id="method5">
        </form>
        <form action="/article/scrap/1060292" method="post" name="article-scrap-form" id="article-scrap-form">
        </form>
        <div class="right-banner-wrapper">

            <div class="google-ad">
                <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                <!-- okjspad_160x500 -->
                <ins class="adsbygoogle"
                     style="display:inline-block;width:160px;height:500px"
                     data-ad-client="ca-pub-8103607814406874"
                     data-ad-slot="6573675943"></ins>
                <script>
                    (adsbygoogle = window.adsbygoogle || []).push({});
                </script>
            </div>
        </div>
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

<div id="userAgreement" class="modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        </div>
    </div>
</div>
</body>
</html>