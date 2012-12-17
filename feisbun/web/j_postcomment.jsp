<%-- 
    Document   : j_postcomment
    Created on : 17-dic-2012, 12:33:53
    Author     : Omar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="dbConn" class="mysql.MySqlConn"/>
<%
    String user_from = request.getParameter("user_from");
    String user_to = request.getParameter("user_to");
    String text = request.getParameter("textarea");
    if ((user_from == null) || (text == null)) {%>
<jsp:forward page="main.jsp">
    <jsp:param name="postError" value="Hubo un error con tu comentario. Vuelva a intentarlo"></jsp:param>
</jsp:forward>
<%} else {
    int n = 0;
    n = dbConn.sendComment(user_from, user_to, text);
    if (n != 0) {%>
<jsp:forward page="main.jsp">
    <jsp:param name="postSuccess" value="Comentario enviado exitosamente"></jsp:param>
</jsp:forward>
<%  } else {%>
<jsp:forward page="main.jsp">
    <jsp:param name="postError" value="Hubo un error con tu comentario. Vuelva a intentarlo"></jsp:param>
</jsp:forward>
<%  }
}%>
