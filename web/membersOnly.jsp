<%@page import="model.Band.StringData"%>
<%@page import="view.BandView"%>
<%@page import="dbUtils.DbConn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="toHead.jsp" />

<%
    DbConn dbc = new DbConn();
    String msg = dbc.getErr(); // returns "" if connection is good, else error msg.
    if (msg.length() == 0) { // got open connection

        // returns a string that contains a HTML table with the db data in it
        msg = BandView.listAllUsers("resultSetFormat", dbc);
    }
    // PREVENT DB connection leaks:
    dbc.close(); //    EVERY code path that opens a db connection, must also close it.
    
    StringData loggedOnCust = (model.Band.StringData)session.getAttribute("band"); // must type cast the object before use
    if (loggedOnCust == null) { // means user is not logged in
        try {
            response.sendRedirect("deny.jsp?denyMsg=You are not authorized to view the Members Only page.");
        } catch (Exception e) {
            msg += " Exception was thrown: " + e.getMessage();
        }
    }
%>

<style>

</style>

<jsp:include page="toContent.jsp" />
            <h3>Are you ready to get your music finished?</h3>
            <p>
                Get ready to meet the musician of your dreams. 
                A musician that can play in any genre and to 
                any track that you want. Your finished track is 
                just a few clicks away. Are you ready? I know we 
                are. Thank you for being a part of our community
                and enjoy.
                
                <%-- This is where I would have image buttons for links to videos
                     of session artists laying down some tracks for each
                     instrument that is available on the website --%>
            </p>
            
<jsp:include page="postContent.jsp" />

