<%-- 
    Document   : j_signup
    Created on : 16-dic-2012, 22:25:13
    Author     : Omar
--%>

<%@page import="java.sql.Date"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="dbConn" class="mysql.MySqlConn"/>
<%if(session.getAttribute("username") !=  null){ //If there's a user logged in%>
<jsp:forward page="main.jsp"></jsp:forward>
<%} else {
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
<jsp:forward page="index.jsp">
    <jsp:param name="db-error" value="Ya existe tal usuario"></jsp:param>
</jsp:forward>
<%  }
    n = dbConn.signup(username, password, bday, phone, street, colony, city, state, school, school_generation, school_degree, area, email);
    if(n!=0){
        session.setAttribute("username", email);
        session.setAttribute("fullname", username);
        dbConn.markOnline(email);%>
    <jsp:forward page="main.jsp"></jsp:forward>        
<%  }else{  %>
<jsp:forward page="index.jsp">
    <jsp:param name="db-error" value="Hubo un error en la base de datos"></jsp:param>
</jsp:forward>      
<%  }
}%>