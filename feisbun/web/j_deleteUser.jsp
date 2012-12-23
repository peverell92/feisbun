<%-- 
    Document   : j_deleteUser
    Created on : 21-dic-2012, 07:41:39 PM
    Author     : LUIS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="dbConn" class="mysql.MySqlConn"/>
<%
    int id_usr = 0;
    if(request.getParameter("identif") != null)
        id_usr = Integer.parseInt(request.getParameter("identif"));
    
    String query = "delete from `feisbun`.`users` where `id`='" + id_usr + "';";
    
    dbConn.Update(query);
    dbConn.desConnect();
%>
<jsp:forward page="bajas.jsp"/>
