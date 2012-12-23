<%-- 
    Document   : j_addNewUser
    Created on : 20-dic-2012, 22:21:21
    Author     : Loli
--%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="dbConn" class="mysql.MySqlConn"/>
<%
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String day = request.getParameter("bday-day");
    String month = request.getParameter("bday-month");
    String year = request.getParameter("bday-year");
    String phone = request.getParameter("phone");
    String street = request.getParameter("address-street");
    String colony = request.getParameter("address-colony");
    String city = request.getParameter("address-city");
    String state = request.getParameter("address-state");
    String school = request.getParameter("school");
    String school_generation = request.getParameter("school-generation");
    String school_degree = request.getParameter("school-degree");
    String area = request.getParameter("area");
    
    Date bday = new Date(Integer.parseInt(year),Integer.parseInt(month),Integer.parseInt(day));
    int n = 0;
    n = dbConn.hasUniqueEmail(email);
    if(n!=0){%>
<jsp:forward page="altas.jsp">
    <jsp:param name="db-error" value="Ya existe tal usuario"></jsp:param>
</jsp:forward>
<%  }
    n = dbConn.signup(username, password, bday, phone, street, colony, city, state, school, school_generation, school_degree, area, email);
    if(n!=0){
      %>
   <jsp:forward page="altas.jsp">
    <jsp:param name="db-error" value="Usuario Creado"></jsp:param>
</jsp:forward>       
<%  }else{  %>
<jsp:forward page="altas.jsp">
    <jsp:param name="db-error" value="Hubo un error en la base de datos"></jsp:param>
</jsp:forward>      
<%  }
%>