<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/common/okky-head.jsp"/>

<body>

<c:set var="cpage" value="${requestScope.cpage}" />
<c:set var="pagecount" value="${requestScope.pagecount}" />
<c:set var="qnalist" value="${requestScope.qnalist}" />
<c:set var="totalboardcount" value="${requestScope.totalboardcount}" />
<c:set var="pager" value="${requestScope.pager}" />
<c:set var="userInfo" value="${requestScope.userInfo}"/>
<c:set var="userInfo" value="${requestScope.totalReplyCount}"/>

<div class="main">

    <jsp:include page="/WEB-INF/common/okky-aside.jsp"></jsp:include>
    <!----------------------------------------------------------------------------------------------->
    <!--문제없기를...-->
    <!--문제없기를...2-->
    <!--대분류 : list-article-->
    <div id="list-article" class="content scaffold-list event-list" role="main">
        <!--중분류1 : 네비게이션바-->
        <div class="nav" role="navigation">


            <c:choose>
                <c:when test="${sessionScope.id !=null}">
                    <a class="create btn btn-success btn-wide pull-right" href="${pageContext.request.contextPath}/QnAWrite.qo">
                        <i class="fa fa-pencil"></i> 새 글 쓰기</a>
                </c:when>
                <c:otherwise>
                    <a class="create btn btn-success btn-wide pull-right" href="/login.do">
                        <i class="fa fa-pencil"></i> 새 글 쓰기</a>
                </c:otherwise>
            </c:choose>


            <%--수정!!!!--%>
            <h4>Q&A</h4>
            <form id="category-filter-form" name="category-filter-form" method="get" action="${pageContext.request.contextPath}/QnAList.qo">
                <div class="category-filter-wrapper">
                    <div class="job-filter-container">
                        <ul class="list-sort pull-left">
                            <li><a href="#" data-sort="id" data-order="desc" class="category-sort-link active">전체글</a></li>
                        </ul>
                        <div class="job-filter-search">
                            <div class="input-group input-group-sm">

                            </div>
                        </div>
                    </div>
                    <!---->
                    <input type="hidden" name="sort" id="category-sort-input" value="id"/> <!--이게 뭘까-->
                    <input type="hidden" name="order" id="category-order-input" value="desc"/> <!--이게 뭘까-->
                </div>
            </form>
        </div>

        <!--중분류2 : 게시글리스트 : 후에 글 자동 반복으로 바뀜!-->

        <div class="panel panel-default community-panel">
            <ul class="list-group ">
                <!--게시글 1 : li기준-->
                <c:forEach var="qnalist" items="${qnalist}">
                <li class="list-group-item list-group-item-question list-group-no-note clearfix">
                    <div class="list-title-wrapper clearfix">
                        <div class="list-tag clearfix">
                            <span class="list-group-item-text article-id">${qnalist.no}</span>

                        </div>
                        <h5 class="list-group-item-heading list-group-item-evaluate">
                            <a href="${pageContext.request.contextPath}/QnAContent.qo?no=${qnalist.no}">
                                ${qnalist.title}
                            </a>
                        </h5>
                    </div>
                    <div class="list-summary-wrapper clearfix">
                        <div class="list-group-item-summary clearfix">
                            <ul>

                                    <i class="item-icon fa fa-thumbs-up"></i>${qnalist.good}</li>
                                <li class=""><i class="item-icon fa fa-eye"></i>${qnalist.hit}</li>
                            </ul>
                        </div>
                    </div>
                    <div class="list-group-item-author clearfix">
                        <div class="avatar clearfix avatar-list ">
                            <a href="/memberDetailGo.do" class='avatar-photo'><img src="//www.gravatar.com/avatar/9675fbddc407a1515b0b688801acf1cd?d=identicon&s=30"/></a>
                            <div class="avatar-info">
                                <a class="nickname" href="/memberDetailGo.do" title="${sessionScope.id}">${qnalist.id}</a>
                                <div class="date-created"><span class="timeago" title=" ${qnalist.writedate}"> ${qnalist.writedate}</span></div>
                            </div>
                        </div>
                    </div>
                </li>
                </c:forEach>
                <!---->
                <!--글들의 반복~~~-->
            </ul>
        </div>


        <!--중분류 3:페이징-->
        <div class="text-center">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    ${pager}
                </ul>
            </nav>
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
    $(function () {
        $('.category-sort-link').click(function (e) {
            $('#category-sort-input').val($(this).data('sort'));
            $('#category-order-input').val($(this).data('order'));
            e.preventDefault();
            $('#category-filter-form')[0].submit();
        });
    });
</script>
</html>