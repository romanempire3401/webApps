<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.DriverManager"%>
<%@ page language="java" import="java.sql.Connection"%>
<%@ page language="java" import="java.sql.PreparedStatement"%>
<%@ page language="java" import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
    <head>
        <style>
            body {background-color: khaki;}
            table, th, td {background-color: beige; 
                           border:thin solid maroon;
                           padding: 3px;
                           text-align:left;}
        </style>
    </head>
    <body>
        <%
Connection con = null; // "telephone call" between web app and the db mgt system
PreparedStatement stmt = null; // holds the SQL statement the web app wants to run
ResultSet results = null;  // holds the data that results from executing the SQL SELECT statement.

out.println("<br/>ready to get the driver... <br/>");
try { // to find the driver

    String DRIVER = "com.mysql.jdbc.Driver";
    Class.forName(DRIVER).newInstance();
    out.println("got the driver... <br/>");

    try { // to get the connection

        // Use this URL if you are working from the CIS dept (no tunnelling).                      
        // String url = "jdbc:mysql://cis-linux2.temple.edu:3306/SP11_2308_sallyk?user=sallyk&password=Vaca1415";  
        // Use this URL if you are working from home, but you must be "tunnelled in" to the CIS network
        String url = "jdbc:mysql://localhost:3307/SP11_2308_sallyk?user=sallyk&password=Vaca1415";

        con = DriverManager.getConnection(url);
        out.println("got the connection with the db..." + "<br/>");

        try {
            String sql = "select user_email, user_password from web_user order by user_email";
            stmt = con.prepareStatement(sql);
            results = stmt.executeQuery();

            out.println("executed the query <br/><br/>");
            out.println("<table>");
            out.println("<tr><th>User Email</th><th>User Password</th></tr>");
            while (results.next()) {
                out.print("<tr>");
                out.print("<td>" + results.getString("user_email") + "</td>");
                out.print("<td>" + results.getString("user_password") + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");
            out.println("<br/>All Done !! ");
            results.close();  // close the result set
            stmt.close(); // close the statement
        } catch (Exception e) {
            out.println("problem creating statement & running query:" + e.getMessage() + "<br/>");
            results.close();  // close the result set
            stmt.close(); // close the statement (this is only important if you wanted to reuse the connection)
        }
    } catch (Exception e) {
        out.println("problem getting connection:" + e.getMessage() + "<br/>");
    }
} catch (Exception e) {
    out.println("problem getting driver:" + e.getMessage() + "<br/>");
}

// close database connection -- NO DATABASE CONNECTION LEAKS !!!
if (con != null) {
    try {
        con.close();
        out.println("Database connection was closed.");
    } catch (Exception e) {
        out.println("Exception trying to close the database connection: " + e.getMessage());
    }
} else {
    out.println("Database connection was never opened.");
}
        %>

    </body>
</html>