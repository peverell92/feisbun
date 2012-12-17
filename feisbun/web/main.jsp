<%-- 
    Document   : main.jsp
    Created on : 17-dic-2012, 1:18:31
    Author     : Omar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="StyleSheet" href="stylesheets/feisbun.css" type="text/css">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
        <title>Feisbun</title>
    </head>
    <body>
        <div class="navbar">
            <div class="navbar-container">
                <table>
                    <tr>
                        <td><div class="imagelogo"></div></td>
                        <td>
                            <div class="welcome">
                                <p>Bienvenido <%=(String)session.getAttribute("fullname")%>!</p>
                            </div>
                        </td>
                        <td>
                            <div class="logout">
                                <form action="j_signout" method="post">
                                    <button class="button signout">Salir</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </body>
</html>