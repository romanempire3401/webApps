<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="view.RequestsView"%>
<%@page language="java" import="dbUtils.DbConn" %>
<%@page import="model.Band.StringData"%>

<%
    boolean sessionCurrent = false;

    StringData loggedOnCust = (model.Band.StringData) session.getAttribute("band");
    if (loggedOnCust != null) {
        sessionCurrent = true;
    }
%>


</head>
<body>
    <div  id="container">
        <div id="titleNav">
            <div id="pageTitle">
                Session Artists for Hire
            </div>

            <span class="stopFloat"></span>
        </div>
        <div id="nav">
            <div id="menu">
                <a href="index.jsp"> Home </a> | 
                <a href="users.jsp"> Users </a> | 
                <a href="assoc.jsp"> Requests </a> | 
                <a href="other.jsp"> Instruments </a> | 
                <a href="search.jsp"> Search </a> | 
                <a href="membersOnly.jsp"> Members </a> | 
                <a href="index.jsp"> Contact </a> | 
                <a href="labs.jsp"> Labs </a> |
                <%
                    String htmlLink = new String();
                    
                    if(sessionCurrent == true){
                        String bandName = loggedOnCust.bandName;
                        //System.out.print("The band name is " + bandName);
                        htmlLink = "Welcome " + bandName + ", <a href='logoff.jsp'> Log-off </a> ";
                    } else
                        htmlLink = "<a href='logon.jsp'> LogOn </a> ";
                %>
                <%=htmlLink%>
            </div>
        </div>
        <div id="content">