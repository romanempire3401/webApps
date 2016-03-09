<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page language="java" import="view.WebUserView" %>
<%@page language="java" import="dbUtils.DbConn" %>

<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List All Users</title>
        <style>
            body {background-color:lightgray;}
            .resultSetFormat {background-color:beige;}
            .resultSetFormat th {border: medium solid brown; background-color:powderblue; padding:5px;}
            .resultSetFormat td {border: thin solid brown; background-color:aliceblue; padding:5px;}
            table {
                margin:auto;
            }
            h1, h2 {
                text-align:center;
            }
        </style>
    </head>
    <body>

        <%
            DbConn dbc = new DbConn();
            String msg = dbc.getErr(); // returns "" if connection is good, else error msg.
            if (msg.length() == 0) { // got open connection

                // returns a string that contains a HTML table with the db data in it
                msg = WebUserView.listAllUsers("resultSetFormat", dbc);
            }
            // PREVENT DB connection leaks:
            dbc.close(); //    EVERY code path that opens a db connection, must also close it.
        %>

        <h2>Web User List</h2>
        <% out.print(msg); %>

    </body>
</html>