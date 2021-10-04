<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/common/okky-head.jsp"/>

<jsp:include page="/WEB-INF/common/okky-aside.jsp"/>
<body>
<div class="main">
      <!----------------------------------------------------------------------------------------------->
      <c:set var="userInfo" value="${requestScope.userInfo}"/>
      <c:set var="writeBoardList" value="${requestScope.writeBoardList}"/>
      <c:set var="userScrapList" value="${requestScope.userScrapList}"/>
      <c:set var="totalBoardCount" value="${requestScope.totalBoardCount}"/>
      <c:set var="pager" value="${requestScope.pager}" />
      
      <c:set var="pagesize" value="${requestScope.pagesize}"/>
      <c:set var="cpage" value="${requestScope.cpage}"/>
      <c:set var="pageCount" value="${requestScope.pageCount}"/>
      <c:set var="totalBoardCount" value="${requestScope.totalBoardCount}"/>
      
      <div id="user" class="content clearfix" role="main">
            <div class="panel panel-default">
                  <div class="panel-body">
                        <c:choose>
                              <c:when test="${userInfo.photo ==null}">
                                    <div class="avatar clearfix avatar-big col-sm-3 text-center">
                                          <a href="#" class="avatar-photo"><img src="upload/bros_blank.jpg"></a>
                                    </div>
                              </c:when>
                              <c:otherwise>
                                    <div class="avatar clearfix avatar-big col-sm-3 text-center">
                                          <a href="#" class="avatar-photo"><img src="upload/${userInfo.photo}"></a>
                                    </div>
                              </c:otherwise>
                        </c:choose>
                        
                        
                        <div class="user-info col-sm-9">
                              <div class="clearfix">
                                    <h2 class="pull-left">${userInfo.nickname}</h2>
                              </div>
                        
                        </div>
                  </div>
            </div>
            <div class="col-sm-2 user-info-nav pull-right">
                  <ul class="nav">
                        <li class="active"><a href="memberDetailGo.do">게시물
                              <span class="badge">${totalBoardCount}</span></a></li>
                        
                  </ul>
            </div>
            <div class="col-sm-10 main-block-left pull-left">
                  <ul class="list-group" id="list-group">
                        
                        <c:forEach var="board" items="${writeBoardList}">
                              <li class="list-group-item list-group-item-small list-group-has-note clearfix">
                                    <div class="list-icon-wrapper pull-left">
                                          
                                          <i class="fa fa-angle-up fa-lg"></i>
                                    
                                    </div>
                                    <div class="list-title-wrapper list-activity">
                                          <div class="list-activity-desc">
                          <span class="list-activity-desc-text">
                          	${board.id}님이
                          	  게시글을 작성하셨습니다.
                          
                          
                          
                          </span>
                                                <span class="timeago" title="2021-09-26T15:36:30">${board.writeDate}</span>
                                          </div>
                                          <h5 class="list-group-item-heading">
                                                <a href="myContentGo.do?bno=${board.bno}&no=${board.no}">${board.title}</a>
                                          
                                                <div class="list-group-item-author pull-right clearfix">
                                                      
                                                      
                                                      <div class="avatar clearfix avatar-x-small ">
                                                            <div class="avatar-info">
                                                                  <a class="nickname" href="#" title="${requestScope.userInfo.nickname}">${requestScope.userInfo.nickname}</a>
                                                            
                                                            </div>
                                                      </div>
                                                </div>
                                          </h5>
                                    </div>
                              </li>
                        
                        </c:forEach>
                  
                  
                  </ul>
                  <div class="text-center">
                        <nav aria-label="Page navigation example">
                              <ul class="pagination">
                                    ${pager}
                              </ul>
                        </nav>
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

<script src="assets/js/search.js" type="text/javascript"></script>

<script>
     $(function() {
          $('.category-sort-link').click(function(e) {
               $('#category-sort-input').val($(this).data('sort'));
               $('#category-order-input').val($(this).data('order'));
               e.preventDefault();
               $('#category-filter-form')[0].submit();
          });
     });
     
     
     
     function acyncMovePage(url) {
          // ajax option
          var ajaxOption = {
               url: url,
               async: true,
               type: "POST",
               dataType: "html",
               cache: false
          };
          
          $.ajax(ajaxOption).done(function(data) {
               // Contents 영역 삭제
               $('#list-group').children().remove();
               // Contents 영역 교체
               $('#list-group').html(data);
          });
     }
</script>
</html>