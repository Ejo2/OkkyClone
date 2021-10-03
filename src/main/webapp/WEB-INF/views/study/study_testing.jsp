<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<head>
    <title>Title</title>
</head>
<body>
<!--테스트용으로 제작했으며 곧 지울겁니다-->
   <c:set var="test" value="${requestScope.title}"></c:set>
   <br>
    ${requestScope.title}
   <br>
   ${requestScope.location1}
   <br>
   ${requestScope.location2}
   <br>
   ${requestScope.categoryCode}
   <br>
   ${requestScope.carrier}
   <br>
   ${requestScope.deadline}
   <br>
   ${requestScope.text}
   <br>
   ${requestScope.count}
</body>
</html>
