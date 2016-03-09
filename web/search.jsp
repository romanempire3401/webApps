<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="toHead.jsp" />

<style>

</style>

<jsp:include page="toContent.jsp" />

<form action="search.jsp" method="get" style = "text-align: center">
    <br/>

    <select name = 'user'>
        <option value = '0' >Band</option>
        <option value = '1' >A Day To Remember</option>
        <option value = '2' >Dream Theater</option>
        <option value = '3' >Sevendust</option>
        <option value = '4' >The Black Dahlia Murder</option>
        <option value = '5' >War of Attrition</option>
    </select>

    <select name = 'other'>
        <option value = '0' >Instrument</option>
        <option value = '1' >Bass</option>
        <option value = '2' >Drums</option>
        <option value = '3' >Piano</option>
        <option value = '4' >Lead Guitar</option>
        <option value = '5' >Rhythm Guitar</option>
    </select>

    <br>

    Number of requests (between 1 and 5): 
    <input type="text" name="assoc" size="20" style="border:1px solid black" placeholder="Please enter number"/>
    <%
        String assoc = request.getParameter("assoc");
        String resultsMsg = new String();
        
        try {
            Integer assocInt = Integer.parseInt(assoc);
            if ((assocInt < 1) || (assocInt > 5)) {
                resultsMsg = "<br>Results:<br> Please enter a number within the range.";
            } else {
                resultsMsg = "<br>Results:<br>";
            }
        } catch (Exception E){
            resultsMsg = "<br>Results:<br> Please enter a numeric number in range.";
        }
    %>
    <input type="submit" value="search"><br/>
    
    <%=resultsMsg%>

</form>


<jsp:include page="postContent.jsp" />

