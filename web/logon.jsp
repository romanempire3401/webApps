<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="dbUtils.DbConn" %>
<%@page import="model.Band.LogOn"%>
<%@page import="model.Band.StringData"%>

<%
    String strEmailAddress = new String();
    String strUserPwd = new String();
    String errorMsg = new String();
    String welcomeMsg = new String();
    //welcomeMsg = "Thank you for logging in!";

    if (request.getParameter("emailAddress") != null) { // this is postback (not first rendering of the page)
        strEmailAddress = request.getParameter("emailAddress"); // extract user input from the URL
        strUserPwd = request.getParameter("userPwd"); // extract user input from the URL
        DbConn dbc = new DbConn(); // get database connection wrapper object
        errorMsg = dbc.getErr();// Check to see if there was any error trying to connect to the database.
        if (errorMsg.length() == 0) { // no error message, so database connection is OK
            StringData loggedOnCust = LogOn.find(dbc, strEmailAddress, strUserPwd);
            if (loggedOnCust != null) {
                session.setAttribute("band", loggedOnCust);
		response.sendRedirect("membersOnly.jsp");
            }
        }
    }
%>
<jsp:include page="toHead.jsp" />

<style>

</style>

<jsp:include page="toContent.jsp" />

<h2>Log-in:</h2>

<form action="logon.jsp" method="get">
    Email Address <input type="text" name="emailAddress" size="40" value="<%=strEmailAddress%>"/><br/>
    Password <input type="password" name="userPwd" size="40" value="<%=strUserPwd%>"/><br/>
    <input type="submit" value="Log On"/><br/>
    <span class="error"> <%=errorMsg%></span><br/>
    <%=welcomeMsg%>
</form> 


<jsp:include page="postContent.jsp" />
