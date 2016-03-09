<%@page import="model.Band.StringData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="view.RequestsView"%>
<%@page language="java" import="dbUtils.DbConn" %>

<%-- this is the new comment --%>

<%
    DbConn dbc = new DbConn();
    String msg = dbc.getErr(); // returns "" if connection is good, else error msg.
    if (msg.length() == 0) { // got open connection

        // returns a string that contains a HTML table with the db data in it
        msg = RequestsView.listAllUsers("resultSetFormat", dbc);
    }
    // PREVENT DB connection leaks:
    dbc.close(); //    EVERY code path that opens a db connection, must also close it.

%>

<jsp:include page="toHead.jsp" />

<style>
    body {background-color: lightgray;}
    .resultSetFormat {background-color: maroon;}
    .resultSetFormat th {background-color: yellow; padding:5px;}
    .resultSetFormat td {border: thin solid black; background-color: tan; padding:5px;}
    table {
        margin:auto;
    }
    h1, h2 {
        text-align:center;
    }
</style>

<jsp:include page="toContent.jsp" />

<h2>Request List</h2>
<% out.print(msg);%>


<jsp:include page="postContent.jsp" />