<%-- 
    Document   : j_sendrequest
    Created on : 17-dic-2012, 14:06:14
    Author     : Omar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="dbConn" class="mysql.MySqlConn"/>
<%
    String requester = request.getParameter("requester");
    String user = request.getParameter("user");
    int r = dbConn.sendRequest(user, requester);
    if (r != 0) {%>
<jsp:forward page="main.jsp">
    <jsp:param name="postSuccess" value="Solicitud enviada exitosamente"></jsp:param>
</jsp:forward>
<%  } else { %>
<jsp:forward page="main.jsp">
    <jsp:param name="postError" value="Hubo un error con la solicitud. Vuelva a intentarlo"></jsp:param>
</jsp:forward>
<%}%>