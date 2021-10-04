<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
      String msg = (String) request.getAttribute("board_msg");
      String url = (String) request.getAttribute("board_url");
      
      if (msg != null && url != null){
%>
<%--<script src="https://www.jsdelivr.com/package/npm/sweetalert2"></script>--%>
<script>
    
     alert('<%=msg%>');
     location.href = <%=url%>;
     <%--let msg = '<%=msg%>';--%>
     <%--let url = '<%=url%>';--%>
     
     <%--console.log(msg);--%>
     <%--console.log(url);--%>
     <%--setTimeout(function() {--%>
     <%--     Swal({--%>
     <%--          title: '알림',--%>
     <%--          text: msg,--%>
     <%--          type: 'success',--%>
     <%--     }, function() {--%>
     <%--          window.location = url;--%>
     <%--     });--%>
     <%--});--%>
</script>

<%
      }
%>