<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/common/okky-head.jsp"/>
<jsp:include page="/WEB-INF/common/okky-aside.jsp"></jsp:include>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" type="text/css" media="screen" href="/assets/css/qna_read.css">

    <title>${sb.title}</title>
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
</head>

<body>
<link rel="stylesheet" href="../../../assets/css/yesol.css">
<div>


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
                <a class="create btn btn-success btn-wide pull-right" href="StudyWrite.so"><i
                        class="fa fa-pencil"></i> 새 글 쓰기</a>
                <h4>정기모임/스터디</h4>
            </div>


            <div class="panel panel-default clearfix fa-">
                <div class="panel-heading clearfix">
                    <c:set var="sb" value="${requestScope.sb}"></c:set>
                    <div class="avatar clearfix avatar-medium pull-left">
                        <a href="/user/info/127868" class='avatar-photo'><img
                                src="//www.gravatar.com/avatar/a25e133c0500a97505a15f6638e8e926?d=identicon&s=40"/></a>
                        <div class="avatar-info">
                            <a class="nickname" href="/user/info/127868" title=${sb.id}>${sb.id}</a>
                            <div class="date-created"><span class="timeago"
                                                            title="2021-09-28T18:57:07">${sb.writedate}</span>
                            </div>
                        </div>
                    </div>

                    <div class="content-identity pull-right">
                        <div class="content-identity-count"><i class="fa fa-comment"></i>${requestScope.replyCount}</div>
                        <div class="content-identity-count"><i class="fa fa-eye"></i>${sb.hit}</div>
                    </div>
                </div>
                <div class="content-container clearfix">
                    <div id="content-body" class="panel-body content-body pull-left">
                        <div class="content-tags">
                            <span class="list-group-item-text article-id" id="no">${sb.no}</span>
                            <a href="/articles/tech-qna" class="list-group-item-text item-tag label label-info"><i
                                    class="fa fa-database"></i>정기모임/스터디</a>
                        </div>
                        <h2 class="panel-title">
                            ${sb.title}
                        </h2>
                        <hr/>
                        <article class="content-text" itemprop="articleBody">
                            <div class="study_email_deadline">
                                <div class="styling">지역</div>
                                <div class="styling2">${sb.sido}</div>
                            </div>
                            <div class="study_email_deadline">
                                <div class="styling">스터디 유형</div>
                                <div class="styling2">${requestScope.cateName}</div>
                            </div>
                            <div class="study_email_deadline">
                                <div class="styling">경력</div>
                                <div class="styling2">${sb.exp}</div>
                            </div>
                            <div class="study_email_deadline">
                                <div class="styling">마감여부</div>
                                <div class="styling2" id="closeok">${sb.closeok}</div>
                            </div>
                            <hr/>
                            ${sb.cont}
                        </article>
                    </div>

                    <div id="content-function" class="content-function pull-right text-center">
                        <div class="content-function-group">
                            <div class="note-evaluate-wrapper"> <!--비동기로 바꾸는 작업 필요-->
                                <a href="javascript:goodUpAndDown('up',${sb.no});" class="note-vote-btn" role="button"
                                   data-type="assent"
                                   data-eval="true" data-id="2524877">
                                    <i id="note-evaluate-assent-2524877"
                                       class="fa fa-angle-up note-evaluate-assent-assent" data-placement="left"
                                       data-toggle="tooltip" title="추천"></i>
                                </a>

                                <div id="content-vote-count-2524877" class="content-eval-count">${sb.good}</div>
                                <!--비동기로 좋아요 가져오기-->

                                <a href="javascript:goodUpAndDown('down',${sb.no});" class="note-vote-btn" role="button"
                                   data-type="dissent"
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
                            <div id="article-scrap-count" class="content-count">${sb.scrapNum}</div>
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
                                        <li><a href="StudyEdit.so?no=${sb.no}" class="edit"><i
                                                class="fa fa-edit fa-fw"></i> 수정 </a></li>
                                        <li><a href="StudyDelete.so?no=${sb.no}" id="article-delete-btn"><i
                                                class="fa fa-trash-o fa-fw"></i> 삭제 </a></li>
                                    </ul>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


            <div class="panel panel-default clearfix">
                <!-- List group ------------------------------------------------------------------------------------------------>
                <ul class="list-group">
                    <li id="note-title" class="list-group-item note-title">
                        <h3 class="panel-title">답변 <span id="note-count">${requestScope.replyCount}</span></h3>
                    </li>

                    <div id="replylist">
                        <!-------------------------이 안의 코드는 더미코드로 뿌려지지 않습니다. javascript에서 뿌려집니다-------->
                        <li class="list-group-item note-item clearfix" id="note-2448736">
                            <div class="content-body panel-body pull-left">
                                <div class="avatar clearfix avatar-medium ">
                                    <a href="/user/info/122431" class='avatar-photo'><img
                                            src="https://phinf.pstatic.net/contact/20191027_276/1572171959967Pzk1W_JPEG/ccc.jpg"/></a>
                                    <div class="avatar-info">
                                        <a class="nickname" href="/user/info/122431" title="궁예">궁예</a>
                                        <div class="date-created"><span class="timeago" title="2021-07-28T13:10:13">2021-07-28 13:10:13</span>
                                        </div>
                                    </div>
                                </div>
                                <fieldset class="form">
                                    <article id="note-text-2448736" class="list-group-item-text note-text">
                                        <p>좋은정보감사합니다</p>
                                    </article>
                                </fieldset>
                            </div>
                            <div class="content-function pull-right text-center">
                                <div class="content-function-group">
                                    <div class="note-evaluate-wrapper">
                                        <!--옆칸에 톱니바퀴-->
                                        <div class="dropdown">
                                            <div class="dropdown">
                                                <a href="javascript://" data-toggle="dropdown"><i class="fa fa-cog"
                                                                                                  data-toggle="tooltip"
                                                                                                  data-placement="left"
                                                                                                  title="게시물 설정"></i></a>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li><a href="StudyEdit.so?no=${sb.no}" class="edit"><i
                                                            class="fa fa-edit fa-fw"></i> 수정 </a></li>
                                                    <li><a href="StudyDelete.so?no=${sb.no}"
                                                           id="reply-delete-btn"><i
                                                            class="fa fa-trash-o fa-fw"></i> 삭제 </a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!--톱니바퀴 끝---------------------------->
                                    </div>
                                </div>
                            </div>
                        </li>
                        <!---------------------------------------------------------------------------------->
                    </div>


                    <!--여기부터 댓글 작성 폼-------------------------------------------------------------->
                    <li class="list-group-item note-form clearfix">
                        <form action="" onsubmit="replyAdd();" method="post" class="note-create-form">
                            <input type="hidden" name="_csrf" value="d3611fcc-5ba1-49ea-9f83-7e974f6bbf11">
                            <div class="content-body panel-body pull-left">
                                <div style="margin-left: 5px;">

                                    <div class="avatar clearfix avatar-medium ">
                                        <a href="/user/info/127868" class='avatar-photo'><img
                                                src="//www.gravatar.com/avatar/a25e133c0500a97505a15f6638e8e926?d=identicon&s=40"/></a>
                                        <div class="avatar-info">
                                            <a class="nickname" href="#" title="${sessionScope.id}"
                                               id="reply-nickname">${sessionScope.id}</a>

                                        </div>
                                    </div>
                                </div>
                                <fieldset class="form">
                                    <input type="hidden" name="textType" value="HTML" id="note.textType">
                                    <textarea name="repltext" placeholder="댓글 쓰기"
                                              class="form-control" id="reply-content"></textarea>
                                </fieldset>
                            </div>
                            <div class="content-function-cog note-submit-buttons clearfix">
                                <p><a href="#" id="note-create-cancel-btn" class="btn btn-default btn-wide"
                                >취소</a></p>
                                <input type="submit" name="create" id="btn-create-btn" class="btn btn-success btn-wide"
                                       value="등록">
                            </div>
                        </form>
                        <!--------------------------------------------------------------------------------------------------------------->
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

    $(function () {
        replyList();
        replyAdd();
    });

    //마감 여부 체크
    let closeok = ${sb.closeok};
    let html = "";
    if (closeok == 1) {
        html += "마감";
    } else {
        html += "모집중";
    }
    $('#closeok').html(html);

    //비동기로 좋아요/싫어요 수 늘리기
    function goodUpAndDown(type, no) {
        let jsonData = {
            type: type,
            no: no
        }
        $.ajax({
            url: "/StudyGood.so",
            type: "POST",
            dataType: "text",//수신타입
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: jsonData,//발신데이터 자체
            success: function (response) {
                if (response) {
                    document.querySelector("#content-vote-count-2524877").innerHTML = response;
                } else {
                    alert("error occured")
                }
            },
            error: function (request, status, error) {
                console.log(error);
            }
        })
    }

    //비동기로 댓글 입력
    function replyAdd() {
        $('#btn-create-btn').click(function () {
            //let content = document.quereySelector('#reply-content');
            let jsonData = {
                no: $("#no").text(),
                id: $("#reply-nickname").text(),
                content: $("#reply-content").val()
                //content:content.value
            }
            $.ajax({
                url: "/StudyReply.so",
                type: 'POST',
                data: jsonData,
                success: function (data) {
                    alert("댓글이 등록되었습니다");
                    replyList();
                    $('#reply-content').val("");

                },
                error: function () {
                    alert('댓글 등록 실패');
                }
            });
        });
    };

    function replyList() {
        $.ajax({
            url: "/ReplyList.so",
            type: 'POST',
            dataType: "json",//수신타입
            data: {
                no: $("#no").text()
            },
            success: function (data) {
                $('#replylist').empty();

                if (data.length == 0) {

                } else {
                    $.each(data, function (index, obj) {
                        $('#replylist').append(
                            //    obj.rcont + '<br>'

                            '<li class="list-group-item note-item clearfix" id="note-2448736">' +
                            '<div class="content-body panel-body pull-left">' +
                            '<div class="avatar clearfix avatar-medium ">' +
                            '<a href="/user/info/122431" class="avatar-photo"><img src="https://phinf.pstatic.net/contact/20191027_276/1572171959967Pzk1W_JPEG/ccc.jpg"/></a>' +
                            '<div class="avatar-info">' +
                            '<input type="hidden" id="replyRno" name="game_token" value="'+obj.rno+'">'+
                            '<a class="nickname" href="/user/info/122431">' + obj.id + '</a>' +
                            '<div class="date-created"><span class="timeago" >' + obj.rdate + '</span>' +
                            '</div>' +
                            '</div>' +
                            '</div>' +
                            '<fieldset class="form">' +
                            '<article id="note'+obj.rno+'" class="list-group-item-text note-text">' +
                            '<p>' + obj.rcont + '</p>' +
                            '</article>' +
                            '</fieldset>' +
                            '</div>' +
                            '<div class="content-function pull-right text-center">' +
                            '<div class="content-function-group">' +
                            '<div class="note-evaluate-wrapper">' +

                            '<div class="dropdown">' +
                            '<div class="dropdown">' + //여기도 같은 문제
                            '<a href="javascript://" data-toggle="dropdown"><i class="fa fa-cog" data-toggle="tooltip" data-placement="left"title="게시물 설정"></i></a>' +
                            '<ul class="dropdown-menu" role="menu">' +
                            '<li><a href="javascript:replyUpdate(' + obj.rno +',`'+obj.rcont+ '`)" id="update'+obj.rno+'"><i class="fa fa-edit fa-fw"></i> 수정 </a></li>' +
                            '<li><a href="javascript:replyDelete('+  obj.rno + ')" id="reply-delete-btn"><i class="fa fa-trash-o fa-fw"></i> 삭제 </a></li>' +
                            '</ul>' +
                            '</div>' +
                            '</div>' +
                            '</div>' +
                            '</div>' +
                            '</div>' +
                            '</li>'
                        );
                    });
                }
            },
            error: function () {
                alert('댓글 로드 실패');
            }
        });

    }

    function replyDelete(rno) {
        $.ajax({
            url :"/Replydelete.so",
            type : 'POST',
            datatype : "text",
            data :{
                no: $("#no").text(),
                rno:rno
            },
            success : function(data){
                alert("댓글이 삭제되었습니다");
                replyList();
            },
            error : function() {
                alert('댓글 삭제 실패');
            }
        });
    }

    function replyUpdate(rno,rcont) {
        //console.log(rno +"/"+ rcont); 잘 나온다!
        let idsource = "#" + "update"+rno;
        let idsource2 = "#" + "note"+rno;
        //console.log(idsource);
        //console.log(idsource2);
        //console.log($(idsource2).val());
        $(idsource).empty();
        $(idsource2).append(
            '<textarea name="repltextUpdate" class="form-control" id="updateRcont'+rno+'"></textarea>'+
            '<input type="button" value="수정하기" Style="margin-top: 5px;" onclick="updateProcess('+rno+')">'
        );
    }

    function updateProcess(rno) {
        let temp = "#" + "updateRcont"+rno;
        let jsonData = {
            rno: rno,
            rcont: $(temp).val()
        }
        $.ajax({
            url: "/StudyReplyUpdate.so",
            type: 'POST',
            data: jsonData,
            success: function (data) {
                alert("댓글이 수정되었습니다");
                replyList();
            },
            error: function () {
                alert('댓글 등록 실패');
            }
        });

    };


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