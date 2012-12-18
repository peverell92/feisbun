<%-- 
    Document   : userpage
    Created on : 17-dic-2012, 13:40:21
    Author     : Omar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="dbConn" class="mysql.MySqlConn"/>
<%String user_page = request.getParameter("user_page");%>
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
                                <p>Bienvenido <b><a href="main.jsp"><%=(String) session.getAttribute("fullname")%></a></b>!</p>
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
        <div style="height:60px;"></div>
        <div class="page">
            <%dbConn.getNameFrom(user_page);%>
            <p>Pagina de <%=dbConn.rs.getString("username")%></p>
            <div class="notification">
                <p class="emptybox-notif post-error">El comentario no puede estar en blanco</p>
            </div>
            <%
                dbConn.allows(user_page, current_user);
                int r = dbConn.rs.getRow();
                if (r <= 0) {%>
            <div class="requestform">
                <div class="denial">
                    <p>Usted no tiene permiso para ver este muro.</p>
                    <p>Puede mandar una solicitud de amistad para tener acceso.</p>
                </div>
                <form action="j_sendrequest.jsp" method="post">
                    <input type="hidden" name="requester" value="<%=current_user%>">
                    <input type="hidden" name="user" value="<%=user_page%>">
                    <button class="button request">Enviar Solicitud de amistad</button>
                </form>
            </div>
            <%} else {%>
            <div class="comment-form borderbox">
                <form action="j_postcomment.jsp" method="post" class="postcomment">
                    <table>
                        <tr><td><p class="comment-form">Escribe un comentario aqui...</p></td></tr>
                        <tr><td><textarea id="comment-textarea" name="textarea" cols="20" rows="5"></textarea></td></tr>
                        <tr><td style="float:right;"><button class="button post">Comentar</button></td></tr>
                    </table>
                    <input type="hidden" name="user_from" value="<%=(String) session.getAttribute("fullname")%>">
                    <input type="hidden" name="user_to" value="<%=user_page%>">
                </form>
            </div>
            <div class="comments">
                <%
                    dbConn.getCommentsFrom(user_page);
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
            <%}%>
        </div>
    </body>
</html>
