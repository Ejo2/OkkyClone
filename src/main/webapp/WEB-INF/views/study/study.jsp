<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/common/okky-head.jsp"/>

<body>
<div class="main">

    <jsp:include page="/WEB-INF/common/okky-aside.jsp"></jsp:include>
    <!----------------------------------------------------------------------------------------------->
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
                            <div class="job-filter-btn" data-type="location1">시도</div>
                            <div class="job-filter-btn" data-type="location2">시군구</div>
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

        <!--중분류2 : 게시글리스트 -->
        <div class="panel panel-default community-panel">
            <ul class="list-group ">
                <!--게시글 1 : li기준-->
                <c:forEach var="board" items="${boardlist}"><!--글들의 반복~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <li class="list-group-item list-group-item-question list-group-no-note clearfix">
                    <div class="list-title-wrapper clearfix">
                        <div class="list-tag clearfix">
                            <span class="list-group-item-text article-id">${board.no}</span>
                            <c:if test="${board.closeok ==1}">
                            <a href="#" class="list-group-item-text item-tag label label-info">마감</a>
                            </c:if>
                        </div>
                        <h5 class="list-group-item-heading list-group-item-evaluate">
                            <a href="/StudyDetail.so?no=${board.no}">
                                    ${board.title}
                            </a>
                        </h5>
                    </div>
                    <div class="list-summary-wrapper clearfix">
                        <div class="list-group-item-summary clearfix">
                            <ul>
                                <li class="item-icon-disabled"><i class="item-icon fa fa-comment "></i>0</li>
                                <li class="item-icon-disabled">
                                    <i class="item-icon fa fa-thumbs-up"></i>${board.good}
                                </li>
                                <li class=""><i class="item-icon fa fa-eye"></i>${board.hit}</li>
                            </ul>
                        </div>
                    </div>
                    <div class="list-group-item-author clearfix">
                        <div class="avatar clearfix avatar-list ">
                            <a href="/user/info/102530" class='avatar-photo'><img src="//www.gravatar.com/avatar/9675fbddc407a1515b0b688801acf1cd?d=identicon&s=30"/></a>
                            <div class="avatar-info">
                                <a class="nickname" href="/user/info/102530" title="dev_ape_2">${board.id}</a>
                                <div class="date-created"><span class="timeago" title="2021-09-27T21:13:36">${board.writedate}</span></div>
                            </div>
                        </div>
                    </div>
                </li>
                </c:forEach><!--글들의 반복~~~~~~~~~~~~~~~~~~~~~~~~~~-->
            </ul>
        </div>

        <!--중분류 3:페이징-->
        <div class="text-center">

            <ul class="pagination pagination-sm" id="pagehere">

            </ul>
        </div>

    </div>

    <!----------------------------------------------------------------------------------------------->
    <jsp:include page="/WEB-INF/common/okky-footer.jsp"></jsp:include>

</div>
</body>

<script>
    //var contextPath = ""; 이게 뭐지1
    //var encodedURL = "%2Farticles%2Fquestions";이게 뭐지2
    let sc ={
        totalPost : ${StudyCriteria.totalPost},
        postPerPage : ${StudyCriteria.postPerPage},
        totalPage : ${StudyCriteria.totalPage},
        currentPage : ${StudyCriteria.currentPage},
        pagePerBlock : ${StudyCriteria.pagePerBlock},
        currentBlock : ${StudyCriteria.currentBlock},
        totalBlock : ${StudyCriteria.totalBlock}
    }
    createBoardPage(sc);

    function createBoardPage(sc){
        console.log("totalPost : " + sc.totalPost);
        console.log("postPerPage : " + sc.postPerPage);
        console.log("totalPage : " + sc.totalPage);
        console.log("currentPage : " + sc.currentPage);
        console.log("pagePerBlock : " + sc.pagePerBlock);
        console.log("currentBlock : " + sc.currentBlock);
        console.log("totalBlock : " + sc.totalBlock);

        if(sc.totalPage ===0){
            sc.totalPage = 1;
            //총페이지수 = 총게시물/페이지당글갯수 이며 page 0 일때에는 1로 친다
        }
        let html = "<ul class='pagination pagination-sm' id='pagehere'>";

        if(sc.currentBlock !=1){ //현재 첫번째 블록이 아니면 ≪를 붙인다
            html += "<li><a onclick='previousBoardPage()'>≪</a></li>";
        }
        let firstPageInBoard;

        if(sc.currentBlock ===1){
            firstPageInBoard = 1; ////첫번째 블록에 있으면 그 블록의 첫페이지는1이다
        }else{
            firstPageInBoard = (sc.currentBlock-1)*sc.pagePerBlock + 1;
            //첫번째 블록이 아니라면 그 블록의 첫페이지는 (현재페이지-1)*5+1 이다
        }

        for(let i=firstPageInBoard;i<sc.totalPage+1;i++){//시작페이지부터 총페이지수까지
            if(sc.currentBlock===1){//case1 : 1페이지일경우
                html += "<li><a href='StudyPaging.so?page=" + i + "'>" + i + "</a></li>";//[1]~[5]찍어주구

                if(i === sc.pagePerBlock){//i가 한페이지당 보여줄 블록수와 같아지면
                    i = sc.totalPage+1;//i 그만돌리고 끝내겠다
                }

            }else if((sc.currentBlock-1)*sc.pagePerBlock<i && sc.currentBlock*sc.pagePerBlock>=i){
                //case2 : [6]~[10] ,[11]~[15]등 i가 한블록내의 첫숫자와 끝숫자 내에 위치한 경우
                html += "<li><a href='StudyPaging.so?page=" + i + "'>" + i + "</a></li>";

                //[6]~[10] 찍어주고 끝내겠다
            }else{//이도 저도 아니면 i 수 올려서 끝내겠다
                i=sc.totalPage+1;
            }
        }


        if(sc.currentBlock !=sc.totalBlock){
            html +="<li><a>...</a></li>";
            html +="<li><a href='StudyPaging.so?page=" + sc.totalPage + "'>" + sc.totalPage + "</a></li>";
            html += "<li><a onclick='nextBoardPage()'>≫</a></li>";
        }

        html += "</ul>";
        $('#pagehere').html(html);
    };

    function previousBoardPage(){
        sc.currentBlock--;
        if (sc.currentBlock === 0) {
            alert('처음 페이지입니다.');
        } else {
            createBoardPage(sc);
        }
    }
    function nextBoardPage(){
        sc.currentBlock++;
        if (sc.totalBlock < sc.currentBlock) {
            alert('마지막 페이지입니다.');
        } else {
            createBoardPage(sc);
        }
    }



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