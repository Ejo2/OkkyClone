<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/common/okky-head.jsp"/>

<body>
<div class="main">

    <jsp:include page="/WEB-INF/common/okky-aside.jsp"></jsp:include>
    <!----------------------------------------------------------------------------------------------->
    <!--문제없기를...-->
    <!--문제없기를...2-->
    <!--대분류 : list-article-->
    <div id="list-article" class="content scaffold-list event-list" role="main">
        <!--중분류1 : 네비게이션바-->
        <div class="nav" role="navigation">
            <a class="create btn btn-success btn-wide pull-right" href="StudyWrite.so">
                <i class="fa fa-pencil"></i> 새 글 쓰기</a>

            <h4>정기모임/스터디</h4>
            <form id="category-filter-form" name="category-filter-form" method="get" action="/articles/event">
                <div class="category-filter-wrapper">
                    <!--구인에서 따왔음-->
                    <div class="job-filter-container">
                        <div class="job-filter-btns">
                            <div class="job-filter-btn" data-type="extra">스터디 유형</div><!--별도의 table 필요할듯?-->
                            <div class="job-filter-btn" data-type="position">스킬</div> <!--태그 정해지면 여기에 쭉 뿌려줄것!-->
                            <div class="job-filter-btn" data-type="location">지역</div>
                            <div class="job-filter-btn" data-type="pay">경력</div>
                        </div>
                        <div class="job-filter-search">
                            <div class="input-group input-group-sm">
                                <input type="search" name="query" id="search-field" class="form-control"
                                       placeholder="검색어" value=""/>
                                <span class="input-group-btn">
						            <button class="btn btn-default" id="search-btn"><i
                                            class="fa fa-search"></i></button>
					                </span>
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
                <li class="list-group-item list-group-item-question list-group-no-note clearfix">
                    <div class="list-title-wrapper clearfix">
                        <div class="list-tag clearfix">
                            <span class="list-group-item-text article-id">#1059173</span>
                            <a href="/articles/gathering" class="list-group-item-text item-tag label label-info"><i class="fa fa-comments"></i> 정기모임/스터디</a>
                        </div>
                        <h5 class="list-group-item-heading list-group-item-evaluate">
                            <a href="/article/1059173">
                                사당역 알고리즘 스터디 추가모집합니다
                            </a>
                        </h5>
                    </div>
                    <div class="list-summary-wrapper clearfix">
                        <div class="list-group-item-summary clearfix">
                            <ul>
                                <li class="item-icon-disabled"><i class="item-icon fa fa-comment "></i> 0</li>
                                <li class="item-icon-disabled">
                                    <i class="item-icon fa fa-thumbs-up"></i> 0
                                </li>
                                <li class=""><i class="item-icon fa fa-eye"></i> 30</li>
                            </ul>
                        </div>
                    </div>
                    <div class="list-group-item-author clearfix">
                        <div class="avatar clearfix avatar-list ">
                            <a href="/user/info/102530" class='avatar-photo'><img src="//www.gravatar.com/avatar/9675fbddc407a1515b0b688801acf1cd?d=identicon&s=30"/></a>
                            <div class="avatar-info">
                                <a class="nickname" href="/user/info/102530" title="dev_ape_2">dev_ape_2</a>
                                <div class="date-created"><span class="timeago" title="2021-09-27T21:13:36">2021-09-27 21:13:36</span></div>
                            </div>
                        </div>
                    </div>
                </li>
                <!---->
                <!--글들의 반복~~~-->
            </ul>
        </div>

        <!--중분류 3:페이징-->
        <div class="text-center">
            <ul class="pagination pagination-sm">
                <li class="prev disabled">
				<span>«</span>
                </li>

                <li class="active">
                    <span>1</span> <!--활성화된 페이지는 span으로 죽여주나봄-->
                </li>
                <li>
                    <a href="/articles/community?offset=20&max=20&sort=id&order=desc">2</a>
                </li>
                <li>
                    <a href="/articles/community?offset=40&max=20&sort=id&order=desc">3</a>
                </li>
                <li>
                    <a href="/articles/community?offset=60&max=20&sort=id&order=desc">4</a>
                </li>
                <li>
                    <a href="/articles/community?offset=80&max=20&sort=id&order=desc">5</a>
                </li>
                <li>
                    <a href="/articles/community?offset=100&max=20&sort=id&order=desc">6</a>
                </li>
                <li>
                    <a href="/articles/community?offset=120&max=20&sort=id&order=desc">7</a>
                </li>
                <li>
                    <a href="/articles/community?offset=140&max=20&sort=id&order=desc">8</a>
                </li>
                <li>
                    <a href="/articles/community?offset=160&max=20&sort=id&order=desc">9</a>
                </li>
                <li>
                    <a href="/articles/community?offset=180&max=20&sort=id&order=desc">10</a>
                </li>

                <li class="disabled"><span>...</span></li>
                <li>
                    <a href="/articles/community?offset=134560&max=20&sort=id&order=desc">6729</a>
                </li>

                <li class="next">
                    <a href="/articles/community?offset=20&max=20&sort=id&order=desc">»</a>
                </li>
            </ul>
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

<script src="assets/js/application.js" type="text/javascript"></script>
<script src="assets/js/search.js" type="text/javascript"></script>
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