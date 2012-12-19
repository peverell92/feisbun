<%-- 
    Document   : j_signin
    Created on : 17-dic-2012, 0:25:56
    Author     : Omar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="dbConn" class="mysql.MySqlConn"/>
<%if(session.getAttribute("username") !=  null){ //If there's a user logged in%>
<jsp:forward page="main.jsp"></jsp:forward>
<%} else {
    String email = request.getParameter("email");
    String password = request.getParameter("password");  
    dbConn.signin(email, password);
    if(dbConn.rs.getRow() != 0){
        session.setAttribute("username", email);
        session.setAttribute("fullname", dbConn.rs.getString("username"));
        dbConn.markOnline(email);%>
<jsp:forward page="main.jsp"></jsp:forward>
<%  }else{ %>
<jsp:forward page="index.jsp">
    <jsp:param name="db-error" value="Usuario o contraseña no validos"></jsp:param>
</jsp:forward>
<% }
}%>