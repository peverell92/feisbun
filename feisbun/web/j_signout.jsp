<%-- 
    Document   : j_signout
    Created on : 17-dic-2012, 13:00:57
    Author     : Omar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="dbConn" class="mysql.MySqlConn"/>
<%
if(session.getAttribute("username") !=  null){ //If there's a user logged in
    dbConn.markOffline((String)session.getAttribute("username"));
    session.invalidate();
}
%>
<jsp:forward page="index.jsp"></jsp:forward>