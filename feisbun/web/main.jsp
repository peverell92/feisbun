<%-- 
    Document   : main.jsp
    Created on : 17-dic-2012, 1:18:31
    Author     : Omar
--%>

<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="dbConn" class="mysql.MySqlConn"/>
<jsp:useBean id="dbAux" class="mysql.MySqlConn"/>
<%if (session.getAttribute("username") != null) { //If there's a user logged in%>
<%String current_user = (String) session.getAttribute("username");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="StyleSheet" href="stylesheets/feisbun.css" type="text/css">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
        <script src="postcommentchecker.js"></script>
        <script src="actions.js"></script>
        <title>Feisbun</title>
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
                                    <button class="button signout">Salir</button>
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
                </tr>
            </table>
        </div>
        <div style="height:60px;"></div>
        <div class="page">
            <div class="requests">
                <p><b>Tiene las siguientes solicitudes de amistad pendientes</b></p>
                <%
                    dbConn.getRequestsFrom(current_user);
                    while (dbConn.rs.next()) {
                        String request_from = dbConn.rs.getString("request_from");
                        dbAux.Consult("SELECT * FROM users WHERE email='" + request_from + "'");
                        String user_name = dbAux.rs.getString("username");%>
                <form action="j_acceptrequest.jsp" method="post">
                    <input type="hidden" name="request_from" value="<%=request_from%>">
                    <table>
                        <tr><td><%=user_name%></td><td>
                                <button class="button post">Aceptar</button>
                            </td></tr>
                    </table>
                </form>
                <%}%>
            </div>
            <%if (request.getParameter("postError") != null) {%>
            <div class="post-error notification">
                <p><%=request.getParameter("postError")%></p>
            </div>
            <%}%>
            <%if (request.getParameter("postSuccess") != null) {%>
            <div class="post-success notification">
                <p><%=request.getParameter("postSuccess")%></p>
            </div>
            <%}%>
            <div class="notification">
                <p class="emptybox-notif post-error">El comentario no puede estar en blanco</p>
            </div>
            <div class="comment-form borderbox">
                <form action="j_postcomment.jsp" method="post" class="postcomment">
                    <table>
                        <tr><td><p class="comment-form">Escribe un comentario aqui...</p></td></tr>
                        <tr><td><textarea id="comment-textarea" name="textarea" cols="20" rows="5"></textarea></td></tr>
                        <tr><td style="float:right;"><button class="button post">Comentar</button></td></tr>
                    </table>
                    <input type="hidden" name="user_from" value="<%=(String) session.getAttribute("fullname")%>">
                    <input type="hidden" name="user_to" value="<%=(String) session.getAttribute("username")%>">
                </form>
            </div>

            <div class="comments">
                <%
                    String username = (String) session.getAttribute("username");
                    dbConn.getCommentsFrom(username);
                    while (dbConn.rs.previous()) {
                        String user_from = dbConn.rs.getString("user_from");
                        String sqlDate = dbConn.rs.getString("sent_at");
                        String text = dbConn.rs.getString("text_content");
                %>
                <div class="comment borderbox">
                    <div class="comment-info">
                        <table>
                            <tr><td class="sender"><%=user_from%></td></tr>
                            <tr><td><%=sqlDate%></td></tr>
                        </table>
                    </div>
                    <hr>
                    <div class="comment-content">
                        <table>
                            <%if (dbConn.rs.getBlob("img_content") != null) {%>
                            <tr><td>IMAGE</td></tr>
                            <%}%>
                            <tr><td><%=text%></td></tr>
                        </table>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
        <div class="contacts">
            <%
                dbConn.Consult("SELECT * FROM users WHERE id>1");
                dbConn.rs.beforeFirst();
                while (dbConn.rs.next()) {
                    String fullname = dbConn.rs.getString("username");
                    String user_email = dbConn.rs.getString("email");
                    boolean online = dbConn.rs.getBoolean("online");%>
            <div class="contact-entry">
                <form action="userpage.jsp" method="post" class="userpage-form">
                    <input type="hidden" name="user_page" value="<%=user_email%>">
                    <button class="fakebutton"><%=fullname%></button><%if (online) {%><img src="images/online.png" width="8px" height="8px"/><%}%>
                </form>
            </div>
            <%}%>
        </div>
    </body>
</html>
<%} else {%>
<jsp:forward page="index.jsp"></jsp:forward>
<%}%>