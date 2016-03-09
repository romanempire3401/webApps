<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="toHead.jsp" />
<%
    String msg = "";
    if (request.getParameter("denyMsg") != null) {
        msg = request.getParameter("denyMsg");
    }
%>
<jsp:include page="toContent.jsp" />
<h3>Sorry, but you must be logged on to view that page.</h3>
<br/>
<div> <%=msg%> </div>
<jsp:include page="postContent.jsp" />
