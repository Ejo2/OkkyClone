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
      <link rel="shortcut icon" href="/assets/images/favicon.ico" type=ㄱ"image/x-icon">
      <link rel="apple-touch-icon" href="/assets/images/icon_57x57.png">
      <link rel="apple-touch-icon" sizes="114x114" href="/images/icon_114x114.png">
      <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
      <meta property="og:image" content="https://okky.kr/assets/images/okky_logo_fb.png">
      <link rel="stylesheet" href="/assets/css/application.css">
      
      <script>(function(w, d, s, l, i) {
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

<c:set var="board" value="${requestScope.board}"/>
<c:set var="no" value="${requestScope.no}"/>
<c:set var="cpage" value="${requestScope.cp}"/>
<c:set var="pagesize" value="${requestScope.ps}"/>
<c:set var="replyList" value="${requestScope.replyList}"/>
<c:set var="userInfo" value="${requestScope.userInfo}"/>
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
                        <c:choose>
                              <c:when test="${sessionScope.id !=null}">
                                    <a class="create btn btn-success btn-wide pull-right" href="${pageContext.request.contextPath}/BoardWrite.go">
                                          <i class="fa fa-pencil"></i> 새 글 쓰기</a>
                              </c:when>
                              <c:otherwise>
                                    <a class="create btn btn-success btn-wide pull-right" href="/login.do">
                                          <i class="fa fa-pencil"></i> 새 글 쓰기</a>
                              </c:otherwise>
                        </c:choose>
                        
                        <h4>칼럼</h4>
                  </div>
                  
                  
                  <div class="panel panel-default clearfix fa-">
                        <div class="panel-heading clearfix">
                              <div class="avatar clearfix avatar-medium pull-left">
                                    <a href="/user/info/127868" class='avatar-photo'><img
                                            src="//www.gravatar.com/avatar/a25e133c0500a97505a15f6638e8e926?d=identicon&s=40"/>
                                    </a>
                                    <div class="avatar-info">
                                          <a class="nickname" href="/memberDetailGo.do"
                                             title="${requestScope.userInfo.nickname}">${board.id}</a>
                                          <div class="activity"><span class="fa fa-flash"></span> 10</div>
                                          <%--활동점수--%>
                                          <div class="date-created"><span class="timeago"
                                                                          title="${board.writedate}">${board.writedate}</span>
                                          </div>
                                    </div>
                              </div>
                              <div class="content-identity pull-right">
                                    <div class="content-identity-count"><i class="fa fa-comment"></i>${totalReplyCount}
                                    </div>
                                    <div class="content-identity-count"><i class="fa fa-eye"></i>${board.hit}</div>
                              </div>
                        </div>
                        
                        <div class="content-container clearfix">
                              <div id="content-body" class="panel-body content-body pull-left">
                                    <div class="content-tags">
                                          <span class="list-group-item-text article-id no">${no}</span>
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
                                                         class="fa fa-angle-up note-evaluate-assent-assent good" data-placement="left"
                                                         data-toggle="tooltip" title="추천"></i>
                                                </a>
                                                
                                                <div id="content-vote-count-2524877" class="content-eval-count board_recommend">${board.good}</div>
                                                
                                                <a href="javascript://" class="note-vote-btn" role="button" data-type="dissent"
                                                   data-eval="true" data-id="2524877">
                                                      <i id="note-evaluate-dissent-2524877"
                                                         class="fa fa-angle-down note-evaluate-dissent-dissent bad" data-placement="left"
                                                         data-toggle="tooltip" title="반대"></i>
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
                                    <div class="dropdown">
                                          <form action="/BoardDeleteOk.go" method="post" id="deleteForm" style="display: none">
                                                <input id="no" name="no" value="${no}">
                                          </form>
                                    </div>
                                    
                                    <div class="dropdown">
                                          <form action="${pageContext.request.contextPath}/BoardContent.go" method="post"
                                                name="article-delete-form" id="article-delete-form">
                                                <input type="hidden" name="_csrf" value="d3611fcc-5ba1-49ea-9f83-7e974f6bbf11">
                                                <input type="hidden" name="_method" value="DELETE" id="method">
                                                
                                                <div class="dropdown">
                                                      
                                                      <%--아이디 null 값이면 삭제 못함--%>
                                                      <c:choose>
                                                            <c:when test="${sessionScope.id !=null}">
                                                                  <a href="javascript://" data-toggle="dropdown">
                                                                        <i class="fa fa-cog" data-toggle="tooltip" data-placement="left"
                                                                           title="게시물 설정"></i>
                                                                  </a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                  <a href="#">
                                                                        <i class="fa fa-cog" data-toggle="tooltip" data-placement="left"
                                                                           title="게시물 설정" style="display: none"></i>
                                                                  </a>
                                                            </c:otherwise>
                                                      </c:choose>
                                                      
                                                      
                                                      <ul class="dropdown-menu" role="menu">
                                                            <li>
                                                                  <a href="${pageContext.request.contextPath}/BoardEdit.go?no=${no}&cp=${cpage}&ps=${pagesize}" class="edit"><i
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
                  
                  
                  <%--댓글--%>
                  <div class="panel panel-default clearfix">
                        
                        <!-- List group -->
                        <ul class="list-group">
                              
                              <li id="note-title" class="list-group-item note-title">
                                    <h3 class="panel-title">답변 <span id="note-count">${totalReplyCount}</span></h3>
                              </li>
                              <c:forEach var="replyList" items="${replyList}">
                                    <li class="list-group-item note-item clearfix" id="note-2524880">
                                          <form action="/content/update/2524880" method="post" data-id="2524880" class="note-update-form">
                                                <input type="hidden" name="_method" value="PUT" id="method11">
                                                <div class="content-body panel-body pull-left">
                                                      <a href="javascript://" class="note-vote-btn note-select-btn note-deselected"
                                                         data-id="2524880" data-type="select">
                                                            <i class="fa fa-check"></i>
                                                      </a>
                                                            
                                                            <%--  <c:if test="${not empty replyList}">
                                                                  <c:forEach var="reply" items="${replyList}">--%>
                                                      
                                                      <div class="avatar clearfix avatar-medium ">
                                                            <a href="/user/info/127406" class="avatar-photo"> <%--회원정보 가기--%>
                                                                  <img src="//www.gravatar.com/avatar/970c7decc77dd782550e549336b71d3a?d=identicon&amp;s=40"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/memberDetailGo.do" title="${requestScope.userInfo.nickname}">${replyList.id}</a> <%--댓글 작성자 닉네님--%>
                                                                  <div class="activity">
                                                                        <span class="fa fa-flash"></span> 28
                                                                  </div>
                                                                        <%--활동점수--%>
                                                                  <div class="date-created">
                                                                        <span class="timeago" title="${replyList.rdate}">${replyList.rdate}</span>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                      <fieldset class="form">
                                                            <article id="note-text-2524880" class="list-group-item-text note-text">
                                                                  <p>${replyList.rcont}</p>
                                                            </article>
                                                      </fieldset>
                                                </div>
                                                      <%-- </c:forEach>
                                                           </c:if>--%>
                                                <div class="content-function pull-right text-center">
                                                      
                                                      
                                                      <div class="content-function-group">
                                                            
                                                            <div class="note-evaluate-wrapper">
                                                                  <a href="javascript://" class="note-vote-btn" role="button" data-type="assent"
                                                                     data-eval="true" data-id="2524880">
                                                                        <i id="note-evaluate-assent-2524880"
                                                                           class="fa fa-angle-up note-evaluate-assent-assent " data-placement="left"
                                                                           data-toggle="tooltip" title="" data-original-title="추천"></i>
                                                                  </a>
                                                                  
                                                                  <div id="content-vote-count-2524880" class="content-eval-count ">0</div>
                                                                  
                                                                  <a href="javascript://" class="note-vote-btn" role="button" data-type="dissent"
                                                                     data-eval="true" data-id="2524880">
                                                                        <i id="note-evaluate-dissent-2524880"
                                                                           class="fa fa-angle-down note-evaluate-dissent-dissent "
                                                                           data-placement="left" data-toggle="tooltip" title=""
                                                                           data-original-title="반대"></i>
                                                                  </a>
                                                            </div>
                                                      </div>
                                                </div>
                                                
                                                <div id="content-function-cog-2529765" class="content-function-cog">
                                                      <div class="dropdown">
                                                                  
                                                                  
                                                                  <%--아이디가 null값이면 활성화x  댓글 삭제수정하기--%>
                                                            <c:choose>
                                                                  <c:when test="${sessionScope.id != null}">
                                                                        <a href="javascript://" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-cog" data-toggle="tooltip" data-placement="left" title="" data-original-title="게시물 설정"></i></a>
                                                                        <ul class="dropdown-menu" role="menu">
                                                                              <li>
                                                                                    <a href="javascript://" class="note-edit-btn" data-id="2529765"><i class="fa fa-edit fa-fw"></i> 수정
                                                                                    </a></li>
                                                                              <li>
                                                                                    <a href="javascript://" class="note-delete-btn" data-id="2529765"><i class="fa fa-trash-o fa-fw"></i> 삭제
                                                                                    </a></li>
                                                                        </ul>
                                                                  </c:when>
                                                                  <c:otherwise>
                                                                        <a href="javascript://" data-toggle="dropdown" aria-expanded="false">
                                                                              <i class="fa fa-cog" data-toggle="tooltip" data-placement="left" title="" data-original-title="게시물 설정" style="display: none"></i></a>
                                                                  </c:otherwise>
                                                            </c:choose>
                                                      
                                                      </div>
                                                </div>
                                          
                                          </form>
                                                <%--댓글삭제 같음--%>
                                          <form action="/ReplyDeleteOk.go" method="post" id="note-delete-form-2524880" style="display: none">
                                                <input id="rno" name="rno" value="${replyList.rno}">
                                          </form>
                                                
                                                <%-- <form action="/content/delete/2524880" method="post" id="note-delete-form-2524880">
                                                     <input type="hidden" name="_csrf" value="4ca7ddc0-25d6-4348-8561-599374a73af4">
                                                     <input type="hidden" name="_method" value="DELETE" id="method22">
                                                 </form>--%>
                                    </li>
                              
                              </c:forEach>
                              <li class="list-group-item note-form clearfix">
                                    <form action="/BoardReplyOk.go" method="post" class="note-create-form">
                                          <%--댓글 리스트--%>
                                          <input type="hidden" name="_csrf" value="4ca7ddc0-25d6-4348-8561-599374a73af4">
                                          <input type="hidden" name="lastNoteId" value="2524904 " id="lastNoteId">
                                          <div class="content-body panel-body pull-left">
                                                <div style="margin-left: 5px;">
                                                      <div class="note-select-indicator note-deselected">
                                                            <i class="fa fa-edit"></i>
                                                      </div>
                                                      
                                                      <div class="avatar clearfix avatar-medium ">
                                                            <a href="/user/info/127868" class="avatar-photo"><img
                                                                    src="//www.gravatar.com/avatar/a25e133c0500a97505a15f6638e8e926?d=identicon&amp;s=40"></a>
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="/user/info/127868" title="${userInfo.nickname}">${sessionScope.id}</a> <%--로그인사용자 닉네임--%>
                                                                  <div class="activity block">
                                                                        <span class="fa fa-flash"></span> 10
                                                                  </div>
                                                                  <%--활동점수--%>
                                                            </div>
                                                      </div>
                                                </div>
                                                
                                                <%--댓글 입력--%>
                                                <fieldset class="form">
                                                      <input type="hidden" name="textType" value="HTML" id="note.textType">
                                                      <input type="hidden" name="no" value="${no}"/>
                                                      <textarea name="rcont" id="note-create" placeholder="댓글 쓰기"
                                                                class="form-control" style="width: 100%"></textarea>
                                                </fieldset>
                                          </div>
                                          <div class="content-function-cog note-submit-buttons clearfix">
                                                
                                                <c:choose>
                                                      <c:when test="${sessionScope.id !=null}">
                                                            <input type="reset" id="note-create-cancel-btn" class="btn btn-default btn-wide" value="취소" style="margin: 2px"/>
                                                            
                                                            <input type="submit" name="create" id="btn-create-btn" class="btn btn-success btn-wide"
                                                                   value="등록">
                                                      </c:when>
                                                      <c:otherwise>
                                                            
                                                            <input type="submit" name="create" id="btn-create-btn" class="btn btn-success btn-wide"
                                                                   value="등록" disabled="disabled">
                                                      </c:otherwise>
                                                </c:choose>
                                          
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


<script>
     var contextPath = "";
     var encodedURL = "%2Farticle%2F1060292";
     
     
     
     /*게시물삭제*/
     $("#article-delete-btn").on("click", function() {
          if (confirm("정말로 삭제 하시겠습니까?")) {
               //예
               $("#deleteForm").submit();
          } else {
               //아니요
          }
     });
     
     
     /*댓글삭제*/
     $(".note-delete-btn").on("click", function() {
          if (confirm("정말로 삭제 하시겠습니까?")) {
               //예
               $("#note-delete-form-2524880").submit();
          } else {
               //아니요
          }
     });
     
     //추천 제이쿼리 (클릭하면 추천)
     $(".good").on('click', function() {
          recommend("good");
     });
     
     //0이하로 반대 할 수 없음
     $(".bad").on('click', function() {
          if (Number($(".board_recommend").text()) == 0) {
               alert("더 이상 반대할 수 없습니다.");
               return;
          }
          recommend("bad");
     });
     
     /*추천기능*/
     function recommend(status) {
          let cur_recommend = Number($(".board_recommend").text());
          var param_data = {"status": status, "no": "${no}"};
          
          $.ajax({
               url: "/recommendOk.go", //추천url 실행
               method: "post",
               data: param_data,
               success: function(result) {
                    if (result == "ok") {
                         if (status == "good") {
                              $(".board_recommend").text(cur_recommend + 1);
                              alert("추천 하였습니다!");
                         } else {
                              $(".board_recommend").text(cur_recommend - 1);
                              alert("반대 하였습니다!")
                         }
                    } else {
                         alert("추천에 실패하였습니다.");
                    }
               }
          });
     }


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
     (function(d, s, id) {
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