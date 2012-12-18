<%-- 
    Document   : j_acceptrequest
    Created on : Dec 17, 2012, 6:49:11 PM
    Author     : Omar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="dbConn" class="mysql.MySqlConn"/>
<%
    String request_from = request.getParameter("request_from");
    String user = (String) session.getAttribute("username");
    dbConn.removeRequest(user,request_from);
    int r = dbConn.allowUpdate(user,request_from);
    if(r!=0){%>
<jsp:forward page="main.jsp">
    <jsp:param name="postSuccess" value="Usuario aceptado!"></jsp:param>
</jsp:forward>    
<%} else { %>
<jsp:forward page="main.jsp">
    <jsp:param name="postError" value="Hubo un error al procesar la solicitud. Vuelva a intentarlo"></jsp:param>
</jsp:forward>
<%}%>
