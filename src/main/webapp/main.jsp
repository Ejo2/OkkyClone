<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/common/okky-head.jsp"/>

<body>
<div class="main">
	<!-- 실례합니다 테스트 좀 해볼게요-->
	<!----------------------------------------------------------------------------------------------->
	<jsp:include page="/WEB-INF/common/okky-aside.jsp"></jsp:include>
	메인
	<c:if test="${sessionScope.id!=null}">
		<a href="logout.do">로그아웃 임시</a>

		<a href="userInfoChange.do">회원 정보 수정</a>

	</c:if>

	<jsp:include page="/WEB-INF/common/okky-footer.jsp"></jsp:include>

	<!----------------------------------------------------------------------------------------------->
</div>
</body>

<script>
    var contextPath = "";
    var encodedURL = "%2Farticles%2Fquestions";
</script>

<script src="assets/js/application.js" type="text/javascript"></script>
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