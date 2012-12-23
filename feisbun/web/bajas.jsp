<%-- 
    Document   : bajas
    Created on : 21/12/2012, 05:25:05 PM
    Author     : LUIS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="dbConn" class="mysql.MySqlConn"/>
<!DOCTYPE html>

<%
    //Recoger los datos de la base de datos para construir la matriz
    int n=0;
    String query = "select id,username,email,school,area from users where `id` != '1';";
    dbConn.Consult(query);
    
    //Vemos si hubo resultados y contamos cuantos hubo
    if(dbConn.rs != null){
        try{
            dbConn.rs.last();
            n = dbConn.rs.getRow();
            dbConn.rs.first();
        }
        catch(Exception e){
        }
    }
    
    //Construimos matriz con los resultados obtenidos
    String [][] matriz = new String[n][5];
    
    //guarda en la matriz los datos de la base de datos          
    int i = 0;
    int index = 0;
    do{
        matriz[i][0] = dbConn.rs.getString("id");
        matriz[i][1] = dbConn.rs.getString("username");
        matriz[i][2] = dbConn.rs.getString("email");
        matriz[i][3] = dbConn.rs.getString("school");
        matriz[i][4] = dbConn.rs.getString("area");
        i++;
    }while(dbConn.rs.next());
    
    dbConn.desConnect();
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="StyleSheet" href="stylesheets/alta-Style.css" type="text/css">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
        <script src="signupboxevents.js"></script>
        <title>Feisbun | Bajas</title>
    </head>
    <body>
        <div class="navbar">
            <div class="navbar-container">
                <table class="navbar-container">
                    <tr>
                        <td><div class="imagelogo"></div></td>
                        <td>
                            <div class="welcome">
                                <p>Bienvenido <b><%=(String) session.getAttribute("fullname")%></b>!</p>
                            </div>
                        </td>
                        <td>
                            <div class="logout">
                                <form action="j_signout.jsp" method="post">
                                    <button class="buttonOut signout">Salir</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
       
        <div class="barraAdmin">
            <table>
                <tr>
                    <td><a href="altas.jsp">Dar de alta un usuario</a></td><td>         </td>
                    <td><a href="bajas.jsp">Dar de baja un usuario</a></td><td>         </td>
                    <td><a href="j_cambios.jsp">Cambiar datos</a></td>
                    <td><a href="main.jsp">Inicio</a></td>
                </tr>
            </table>
        </div>
                            
        <div class="content">
            <div class="container">
                <div class="slogan floatingblock">
                    <p>Bajas de usuarios</p>
                </div>
                
                <div class="sign-up-form floatingblock">
                    <div class="error-messages">
                        <%if (request.getParameter("db-error") != null) {%>
                        <p class="errordb"><%=request.getParameter("db-error")%></p>
                        <%}%>
                        <p class="error emailmismatch">Los emails no coinciden</p>
                        <p class="error emptyfield">Hay uno o varios cuadros sin llenar</p>
                        <p class="error invalidemail">El email es invalido. Debe de terminar en <em>@feisbun.com</em></p>
                    </div>
                        <br><br>
                    <%for(int x=0; x<n; x++){
                        out.print("<br><br><table border=\"5\" width=\"100%\"><tr>");
                        out.print("<td>Usuario: " + matriz[x][1] + "</td>");
                        out.print("<td>e-mail: " + matriz[x][2] + "</td></tr>");
                        out.print("<tr><td>Escuela: " + matriz[x][3] + "</td>");
                        out.print("<td>Area: " + matriz[x][4] + "</td></tr>");
                        out.print("<tr><td colspan=\"2\">"); %>
                            <form action="j_deleteUser.jsp" method="post">
                                <%out.print("<input type=\"hidden\" name=\"identif\" value=\"" + 
                                        matriz[x][0] + "\">");%>
                            <input type="submit" value="Dar de baja"></form>
                     <%   out.print("</td></tr>");
                     }%>
                    
                </div>
                
            </div>
        </div>
                                                
    </body>
</html>
