

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="toHead.jsp" />

<style>

</style>

<jsp:include page="toContent.jsp" />

<h2>Lab 1: Web App Proposal and Data Model </h2>
<p>
    In this lab, I learned how to create a data model to support my web application using SQL.
    I learned about the SQL commands that will be used to manipulate tables and learned how these tables work
    to populate data in many different ways.
</p>

<h2>Lab 2: Database </h2>
<p>
    In this lab, I revised my data model from Lab 1 and then "forward engineered" 
    from my data model to my database. I then populated my database with realistic data.
    I used the SQL commands that I learned while working on Lab1 in order to demonstrate
    how to join data from several tables, taking screen shots of each statement execution.
</p>

<h2>Lab 3: JSP Web Site</h2>
<p>
    In this lab, I learned how to use JSP along with my previous experience with 
    HTML and CSS in order to create a simple layout for this website. Click 
    <a href="index.jsp">here</a> to check out my home page. 
    to see my home page.
</p>

<h2>Lab 4: Display Data</h2>
<p>
    In this lab, I learned how to display tables on my web page. We used java classes
    to prepare Sql statements and populated tables based on these statements.
    These are the tables that I have created:
    <a href="users.jsp">Bands</a>
    <a href="other.jsp">Instruments</a>
    <a href="assoc.jsp">Requests</a>
</p>

<h2>Lab 5: Logon</h2>
<p>
    In this lab, I learned how to allow users to log-in in order to view members only material.
    Once logged in, users are able to access the tables added last lab. These are found here:
    <a href="users.jsp">Bands</a>
    <a href="other.jsp">Instruments</a>
    <a href="assoc.jsp">Requests</a>

    Once a user logs off, they are redirected to the index page and no longer have access to these
    "members only" pages. Users now see an error message when attempting to access these pages.
</p>

<jsp:include page="postContent.jsp" />

